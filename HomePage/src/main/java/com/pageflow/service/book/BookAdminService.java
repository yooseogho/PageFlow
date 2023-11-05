package com.pageflow.service.book;

import java.io.*;
import java.nio.file.*;
import java.util.*;

import org.apache.commons.io.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

import com.pageflow.dao.book.*;
import com.pageflow.dto.book.*;
import com.pageflow.entity.book.*;

@Service
public class BookAdminService {
	@Autowired
	private BookDao bookDao;

	@Value("${numberOfProductsPerPage}")
	private Long numberOfProductsPerPage;

	@Value("${sizeOfPagination}")
	private Long sizeOfPagination;

	@Value("${bookImageFolder}")
	private String imageFolder;

	@Value("${bookImageUrl}")
	private String imageUrl;

	@Value("${defaultBookImage}")
	private String defaultBookImage;

	
	/** 1. 상품 등록 Service */
	@Transactional
	public Boolean add(BookDto.Add dto ) {
	    MultipartFile bookImage = dto.getBookImage();
	    String imageName = defaultBookImage;

	    // 사용자가 사진을 등록한 경우
	    if (!bookImage.isEmpty()) {
	        String extension = FilenameUtils.getExtension(bookImage.getOriginalFilename());
	        imageName = UUID.randomUUID() + "_" + dto.getAuthorName() + "_" + dto.getBookTitle() + "." + extension;
	        File file = new File(imageFolder, imageName);
	        try {
	            bookImage.transferTo(file);
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	        }
	    } else {
	         // 사용자가 사진을 등록하지 않은 경우
	         File image = new File(imageFolder, defaultBookImage);
	         imageName = UUID.randomUUID() + "_" + dto.getAuthorName() + "_" + dto.getBookTitle() + "." + "png";
	         if (image.exists()) {
	             File file = new File(imageFolder, imageName);
	             try {
	                 Files.copy(image.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
	             } catch (IOException e) {
	                 e.printStackTrace();
	             }
	         }
	     }
	    

	     Book b = dto.toEntity(imageName);  // 여기서 Book 객체 생성

	     return bookDao.save(b) == 1;  // 여기서 한번만 save
	}

	

	/** 2. 도서 관리를 위한 도서 리스트 */
	public BookPage adminBookList(Long pageno) {
		Long count = bookDao.adminBookListCount();
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;
		Long endRownum = pageno * numberOfProductsPerPage;
		List<Book> books = bookDao.findAll(startRownum, endRownum);

		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;
		Long prev = start - 1;
		Long end = prev + sizeOfPagination;
		Long next = end + 1;

		// end가 numberOfPage보다 같거나 크다면...처리
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}
		return new BookPage(prev, start, end, next, pageno, books);
	}


	/** 3. 상품 삭제 */
	public Boolean deleteByBno(Long bno) {
		Book b = bookDao.findByBno(bno);
		String fileName = defaultBookImage;
		File file = new File(imageFolder, b.getBookImage());
		if (!(b.getBookImage().equals(fileName)) && file.exists()) {
			file.delete();
		}
		System.out.println(file.exists());
		return bookDao.deleteById(bno) == 1;
	}
	
	
	/** 4. 상품 수정 */
	public Boolean update(BookDto.Update dto) {
		Book book = bookDao.findByBno(dto.getBno());

		// 상품 수정할 때
		book.setCategoryCode(dto.getCategoryCode());
		book.setBookTitle(dto.getBookTitle());
		book.setBookIntro(dto.getBookIntro());
		book.setBookContent(dto.getBookContent());
		book.setPublishDate(dto.getPublishDate());
		book.setBookPrice(dto.getBookPrice());
		book.setStock(dto.getStock());
	    book.setTranslator(dto.getTranslator()); 
		book.setPublisherName(dto.getPublisherName());
		book.setAuthorName(dto.getAuthorName());

		
		// 사진 파일 첨부 받아야할 때
		MultipartFile bookImage = dto.getBookImage();
		// 기존에 있던 default 이미지 파일 이름
		String imageName = defaultBookImage;
		// 기존에 있는 이미지 파일을 읽어온다
		String existImage = book.getBookImage();
		
		// 사용자가 사진 등록을 하는 경우
		if (!bookImage.isEmpty()) {
			// 이미지 확장자 파일 가져오기
			String extension = FilenameUtils.getExtension(bookImage.getOriginalFilename());
			imageName = UUID.randomUUID() + "_" + dto.getAuthorName() + "_" + dto.getBookTitle() + "." + extension;
			// 폴더에 파일명을 주고 파일 객체를 생성 -> 0바이트 파일 생성
			File file = new File(imageFolder, imageName);
			// profile의 내용을 file로 이동시키자
			if (existImage != null && !existImage.equals(defaultBookImage)) {
				File existFile = new File(imageFolder, existImage);
				existFile.delete();
			}
			try {
				bookImage.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		// 사진을 등록 하지 않은 경우
		} else {
			// 사용자가 사진을 등록하지 않은 경우
			File image = new File(imageFolder, defaultBookImage);
			imageName = UUID.randomUUID() + "_" + dto.getAuthorName() + "_" + dto.getBookTitle() + "." + "png";
			
			if (existImage != null && !existImage.equals(defaultBookImage)) {
				File existFile = new File(imageFolder, existImage);
				existFile.delete();
			}
			
			if (image.exists()) {
				File file = new File(imageFolder, imageName);
				try {
					Files.copy(image.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		book.setBookImage(imageName); // 이미지 이름 설정
		
		
		return bookDao.bookUpdate(book) == 1;
	}
	
	/** 5. 관리자 검색 리스트 */
	public AdminSearchPage adminSearchBookList(Long pageno, String keyword) {
		Long count = bookDao.searchListCount(keyword);
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;
		Long endRownum = pageno * numberOfProductsPerPage;
		List<Book> books = bookDao.adminSearchList(startRownum, endRownum, keyword);

		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;
		Long prev = start - 1;
		Long end = prev + sizeOfPagination;
		Long next = end + 1;

		// end가 numberOfPage보다 같거나 크다면...처리
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}
		return new AdminSearchPage(prev, start, end, next, pageno, keyword, books);
	}

}
