package com.pageflow.service.book;

import java.time.format.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.pageflow.dao.book.*;
import com.pageflow.dao.member.*;
import com.pageflow.dao.memberGrade.*;
import com.pageflow.dto.book.*;
import com.pageflow.entity.book.*;
import com.pageflow.entity.member.*;

@Service
public class BookService {
	@Autowired
	private BookDao bookDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MemberGradeDao memberGradeDao;

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

	/**	 1. 도서 종류별 5개의 리스트를 나열하는 페이지 (도서 페이지의 첫부분) (대분류) */
	public List<BookDto.Recent> get5RecentBooks(Long categoryParent, Long gradeCode, String memberId) {
		Member m = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (m == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = m.getGradeCode();
		}

		// DAO를 통해 도서 목록을 가져온다.
		List<BookDto.Recent> recentBooks = bookDao.find5Recent(categoryParent, memberId, gradeCode);

		// 여기서 책의 포인트 적립금액을 계산할 수 있다.
		for (BookDto.Recent book : recentBooks) {
			Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
			Long bookPrice = book.getBookPrice();
			Double pointEarningsDouble = bookPrice * pointRate;
			Long pointEarnings = pointEarningsDouble.longValue();
			book.setPointEarnings(pointEarnings);
		}

		return recentBooks;
	}

	/** 2-1. 상품, 이미지, 리뷰들, 리뷰 개수, 리뷰 평점 평균을 읽어 출력 → 리뷰 영역은 아직 구현 안함 */
	public BookDto.Read read(Long bno, String memberId, Long gradeCode) {
		// 사용자의 아이디 정보(memberId)를 가져온다
		Member member = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (member == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = member.getGradeCode();
		}

		Book book = bookDao.findByBook(bno, memberId, gradeCode);
		if (book == null) {
			return null;
		}

		// publishDate를 String으로 변환
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		String publishDate = dtf.format(book.getPublishDate());

		// 여기서 책의 포인트 적립금액을 계산할 수 있다.
		Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
		Long bookPrice = book.getBookPrice();
		Double pointEarningsDouble = bookPrice * pointRate;
		Long pointEarnings = pointEarningsDouble.longValue();

		return new BookDto.Read(book.getBno(), book.getCategoryCode(), book.getBookTitle(), book.getBookImage(),
				book.getBookIntro(), book.getBookContent(), publishDate, book.getAuthorName(), book.getPublisherName(),
				book.getTranslator(), book.getStock(), book.getBookPrice(), pointRate, pointEarnings);
	}

	/** 2-2. 작가의 다른 작품 더보기 (Read 페이지 안에 있음) */
	public List<BookDto.AuthorOtherBooks> findAuthorOtherBooks(String authorName) {
		// DAO를 사용하여 DB에서 해당 작가의 다른 책들을 찾아옴.
		// 결과값은 Book 객체들의 리스트 형태로 받아옴.
		List<Book> books = bookDao.findOtherBooksByAuthor(authorName);

		// 반환할 결과값을 담기 위한 빈 ArrayList 생성.
		// 이 리스트에는 BookDto.AuthorOtherBooks 타입의 객체들이 들어감.
		List<BookDto.AuthorOtherBooks> otherBooks = new ArrayList<>();

		// for-each 루프 : 위의 DB에서 가져온 각각의 Book 객체에 대해 반복
		for (Book book : books) {
			// 각 Book 객체에서 필요한 정보(책 번호, 제목, 이미지, 작가 이름)를 가져와 새로운 DTO 생성
			BookDto.AuthorOtherBooks CategoryParentList = new BookDto.AuthorOtherBooks(book.getBno(),
					book.getBookTitle(), book.getBookImage(), book.getAuthorName());

			// 생성된 DTO 객체를 otherBooks라는 ArrayList에 추가
			otherBooks.add(CategoryParentList);
		}

		// 최종적으로 작가에 대한 다른 책들 리스트 반환
		return otherBooks;

	}
	
	/** 3. 작가 검색해서 도서 정보 불러오기 */
	public SearchListPage authorNameListPage(Long pageno, String memberId, Long gradeCode, String keyword) {
		Member member = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (member == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = member.getGradeCode();
		}
		
		// 작가의 도서 상품 목록의 총 갯수를 센다.
		Long count = bookDao.authorBookCount(keyword);
		
		// pageno의 갯수
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		// 사용자가 직접 주소창에 pageno=? 이렇게 쳤을 떄
		if (pageno < 1) {
			pageno = -(pageno);
		} else if (pageno == 0) {
			pageno = 1L;
		} else if (pageno > numberOfPage) {
			pageno = numberOfPage;
		}

		// 해당 pageno의 처음 숫자
		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;

		// 해당 pageno의 끝 숫자
		Long endRownum = pageno * numberOfProductsPerPage;

		// 상품 목록 리스트 ex) startRownum=1 , endRownum=10 이라고 가정하면 bno가 1 부터 10까지의 책 목록 나열
		List<BookDto.BookList> books = bookDao.searchAuthorBook(keyword, memberId, gradeCode, startRownum, endRownum);

		for (BookDto.BookList book : books) {
			// 여기서 책의 포인트 적립금액을 계산할 수 있다.
			Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
			Long bookPrice = book.getBookPrice();
			Double pointEarningsDouble = bookPrice * pointRate;
			Long pointEarnings = pointEarningsDouble.longValue();
			book.setPointEarnings(pointEarnings);
		}

		// 상품의 개수 : 123개
		// ↓
		// 페이지의 개수 : 13개

		// 현재 페이지번호
		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;

		// 이전 버튼
		Long prev = start - 1;

		// 끝 페이지번호
		Long end = prev + sizeOfPagination;

		// 다음 버튼
		Long next = end + 1;

		// 다음 버튼의 숫자가 페이지 번호의 갯수보다 많거나 끝 페이지 번호보다 많을 경우 다음 버튼은 안보이게 설정
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}

		return new  SearchListPage(prev, start, end, next, pageno, keyword, books);

	}
	
	
	/** 4. 출판사 검색해서 도서 정보 불러오기 */
	public SearchListPage publisherListPage(Long pageno, String memberId, Long gradeCode, String keyword) {
		Member member = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (member == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = member.getGradeCode();
		}
		
		// 작가의 도서 상품 목록의 총 갯수를 센다.
		Long count = bookDao.publisherBookCount(keyword);
		
		// pageno의 갯수
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		// 사용자가 직접 주소창에 pageno=? 이렇게 쳤을 떄
		if (pageno < 1) {
			pageno = -(pageno);
		} else if (pageno == 0) {
			pageno = 1L;
		} else if (pageno > numberOfPage) {
			pageno = numberOfPage;
		}

		// 해당 pageno의 처음 숫자
		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;

		// 해당 pageno의 끝 숫자
		Long endRownum = pageno * numberOfProductsPerPage;

		// 상품 목록 리스트 ex) startRownum=1 , endRownum=10 이라고 가정하면 bno가 1 부터 10까지의 책 목록 나열
		List<BookDto.BookList> books = bookDao.searchPublisherBook(keyword, memberId, gradeCode, startRownum, endRownum);

		for (BookDto.BookList book : books) {
			// 여기서 책의 포인트 적립금액을 계산할 수 있다.
			Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
			Long bookPrice = book.getBookPrice();
			Double pointEarningsDouble = bookPrice * pointRate;
			Long pointEarnings = pointEarningsDouble.longValue();
			book.setPointEarnings(pointEarnings);
		}

		// 상품의 개수 : 123개
		// ↓
		// 페이지의 개수 : 13개

		// 현재 페이지번호
		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;

		// 이전 버튼
		Long prev = start - 1;

		// 끝 페이지번호
		Long end = prev + sizeOfPagination;

		// 다음 버튼
		Long next = end + 1;

		// 다음 버튼의 숫자가 페이지 번호의 갯수보다 많거나 끝 페이지 번호보다 많을 경우 다음 버튼은 안보이게 설정
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}

		return new SearchListPage(prev, start, end, next, pageno, keyword, books);

	}
	

	/** pageno, 개수 -> prev, start, end, next, pageno, 제품들을 출력한다
	*   5. 도서 종류별 페이징 리스트 페이지 (도서 페이지의 두번째 부분) (중분류)
	*/
	public CategoryParentPage categoryParentList(Long pageno, String memberId, Long gradeCode, Long categoryParent) {

		Member member = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (member == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = member.getGradeCode();
		}

		// 상품 목록의 총 갯수를 센다.
		Long count = bookDao.categoryParentCount(categoryParent);

		// pageno의 갯수
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		// 사용자가 직접 주소창에 pageno=? 이렇게 쳤을 떄
		if (pageno < 1) {
			pageno = -(pageno);
		} else if (pageno == 0) {
			pageno = 1L;
		} else if (pageno > numberOfPage) {
			pageno = numberOfPage;
		}

		// 해당 pageno의 처음 숫자
		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;

		// 해당 pageno의 끝 숫자
		Long endRownum = pageno * numberOfProductsPerPage;

		// 상품 목록 리스트 ex) startRownum=1 , endRownum=10 이라고 가정하면 bno가 1 부터 10까지의 책 목록 나열
		List<BookDto.BookList> books = bookDao.findBookByCategoryParent(categoryParent, memberId, gradeCode,
				startRownum, endRownum);

		for (BookDto.BookList book : books) {
			// 여기서 책의 포인트 적립금액을 계산할 수 있다.
			Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
			Long bookPrice = book.getBookPrice();
			Double pointEarningsDouble = bookPrice * pointRate;
			Long pointEarnings = pointEarningsDouble.longValue();
			book.setPointEarnings(pointEarnings);
		}

		// 상품의 개수 : 123개
		// ↓
		// 페이지의 개수 : 13개

		// 현재 페이지번호
		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;

		// 이전 버튼
		Long prev = start - 1;

		// 끝 페이지번호
		Long end = prev + sizeOfPagination;

		// 다음 버튼
		Long next = end + 1;

		// 다음 버튼의 숫자가 페이지 번호의 갯수보다 많거나 끝 페이지 번호보다 많을 경우 다음 버튼은 안보이게 설정
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}

		return new CategoryParentPage(prev, start, end, next, pageno, categoryParent, books);
	}

	/** pageno, 개수 -> prev, start, end, next, pageno, 제품들을 출력한다
	*   6. 도서 장르별 페이징 리스트 페이지 (도서 페이지의 마지막 부분) (소분류)
	*/
	public CategoryCodePage categoryCodeList(Long pageno, String memberId, Long gradeCode, Long categoryCode, Long categoryParent) {

		Member member = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (member == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = member.getGradeCode();
		}

		// 상품 목록의 총 갯수를 센다.
		Long count = bookDao.categoryCodeCount(categoryCode);

		// pageno의 갯수
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		// 사용자가 직접 주소창에 pageno=? 이렇게 쳤을 떄
		if (pageno < 1) {
			pageno = -(pageno);
		} else if (pageno == 0) {
			pageno = 1L;
		} else if (pageno > numberOfPage) {
			pageno = numberOfPage;
		}

		// 해당 pageno의 처음 숫자
		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;

		// 해당 pageno의 끝 숫자
		Long endRownum = pageno * numberOfProductsPerPage;

		// 상품 목록 리스트 ex) startRownum=1 , endRownum=10 이라고 가정하면 bno가 1 부터 10까지의 책 목록 나열
		List<BookDto.BookList> books = bookDao.findBookByCategoryCode(categoryCode, categoryParent, memberId, gradeCode,
				startRownum, endRownum);

		for (BookDto.BookList book : books) {
			// 여기서 책의 포인트 적립금액을 계산할 수 있다.
			Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
			Long bookPrice = book.getBookPrice();
			Double pointEarningsDouble = bookPrice * pointRate;
			Long pointEarnings = pointEarningsDouble.longValue();
			book.setPointEarnings(pointEarnings);
		}

		// 상품의 개수 : 123개
		// ↓
		// 페이지의 개수 : 13개

		// 현재 페이지번호
		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;

		// 이전 버튼
		Long prev = start - 1;

		// 끝 페이지번호
		Long end = prev + sizeOfPagination;

		// 다음 버튼
		Long next = end + 1;

		// 다음 버튼의 숫자가 페이지 번호의 갯수보다 많거나 끝 페이지 번호보다 많을 경우 다음 버튼은 안보이게 설정
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}

		return new CategoryCodePage(prev, start, end, next, pageno, categoryParent, categoryCode, books);
	}
	
	/** 7. 검색어와 일치하는 작가, 출판사, 책 제목을 가진 도서의 정보를 목록으로 보여주는 페이지 */
	public SearchListPage searchListPage(Long pageno, String memberId, Long gradeCode, String keyword) {

		Member member = memberDao.findById(memberId);

		// memberId가 null 또는 빈 문자열인 경우 '0'으로 설정
		if (member == null || memberId.isEmpty()) {
			memberId = "0";
			// 비회원일 경우 gradeCode를 0으로 설정
			gradeCode = 0L;
		} else {
			gradeCode = member.getGradeCode();
		}

		// 상품 목록의 총 갯수를 센다.
		Long count = bookDao.searchListCount(keyword);

		// pageno의 갯수
		Long numberOfPage = (count - 1) / numberOfProductsPerPage + 1;

		// 사용자가 직접 주소창에 pageno=? 이렇게 쳤을 떄
		if (pageno < 1) {
			pageno = -(pageno);
		} else if (pageno == 0) {
			pageno = 1L;
		} else if (pageno > numberOfPage) {
			pageno = numberOfPage;
		}

		// 해당 pageno의 처음 숫자
		Long startRownum = (pageno - 1) * numberOfProductsPerPage + 1;

		// 해당 pageno의 끝 숫자
		Long endRownum = pageno * numberOfProductsPerPage;

		// 상품 목록 리스트 ex) startRownum=1 , endRownum=10 이라고 가정하면 bno가 1 부터 10까지의 책 목록 나열
		List<BookDto.BookList> books = bookDao.searchList(keyword, memberId, gradeCode, startRownum, endRownum);

		for (BookDto.BookList book : books) {
			// 여기서 책의 포인트 적립금액을 계산할 수 있다.
			Double pointRate = memberGradeDao.findPointRateByGradeCode(gradeCode); // 책의 등급별 포인트 적립률
			Long bookPrice = book.getBookPrice();
			Double pointEarningsDouble = bookPrice * pointRate;
			Long pointEarnings = pointEarningsDouble.longValue();
			book.setPointEarnings(pointEarnings);
		}

		// 상품의 개수 : 123개
		// ↓
		// 페이지의 개수 : 13개

		// 현재 페이지번호
		Long start = (pageno - 1) / sizeOfPagination * sizeOfPagination + 1;

		// 이전 버튼
		Long prev = start - 1;

		// 끝 페이지번호
		Long end = prev + sizeOfPagination;

		// 다음 버튼
		Long next = end + 1;

		// 다음 버튼의 숫자가 페이지 번호의 갯수보다 많거나 끝 페이지 번호보다 많을 경우 다음 버튼은 안보이게 설정
		if (end >= numberOfPage) {
			end = numberOfPage;
			next = 0L;
		}

		return new SearchListPage(prev, start, end, next, pageno, keyword, books);		
	}


}
