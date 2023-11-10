package com.pageflow.controller.book;

import java.io.*;
import java.nio.file.*;
import java.security.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dao.book.*;
import com.pageflow.dto.book.*;
import com.pageflow.dto.cart.*;
import com.pageflow.entity.book.*;
import com.pageflow.service.book.*;

@Controller
public class BookController {
  @Autowired
  private BookDao bookDao;

  @Autowired
  private BookService bookService;

  @Autowired
  private CategoryService categoryService;

  // 1. 상품 종류별로 5개씩 리스트 보여주는 페이지(도서페이지)
  @GetMapping("/category/book")
  public ModelAndView showCategoryBook(HttpServletRequest request, Authentication auth) {
    ModelAndView modelAndView = new ModelAndView("/category/book");
    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    Long gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    // 도서 목록 가져오기
    List<BookDto.Recent> novelBooks = bookService.get5RecentBooks(110L, gradeCode, memberId);
    List<BookDto.Recent> comicBooks = bookService.get5RecentBooks(120L, gradeCode, memberId);
    List<BookDto.Recent> textBooks = bookService.get5RecentBooks(130L, gradeCode, memberId);

    // 포인트 적립 (회원인 경우에만)
    if (!"0".equals(memberId)) {
      for (BookDto.Recent book : novelBooks) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
      for (BookDto.Recent book : comicBooks) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
      for (BookDto.Recent book : textBooks) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
    }

    modelAndView.addObject("novelBooks", novelBooks);
    modelAndView.addObject("comicBooks", comicBooks);
    modelAndView.addObject("textBooks", textBooks);
    modelAndView.addObject("memberId", memberId);

    return modelAndView;
  }

  // 2. 상품 읽기
  @GetMapping("/book/read")
  public ModelAndView read(@RequestParam(required = false) Long bno, RedirectAttributes ra,
      HttpServletRequest request) {

    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    Long gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    // 카테고리 경로 정보 가져오기 시작
    List<Category> categoriesPath = categoryService.getCategoryPath(bno);

    // 상품 정보 읽기
    BookDto.Read dto = bookService.read(bno, memberId, gradeCode);

    // 상품 정보를 찾을 수 없다면 /로 이동한 후 오류메시지를 출력
    if (dto == null) {
      ra.addFlashAttribute("msg", "현재 판매중인 상품이 아닙니다");
      return new ModelAndView("redirect:/");
    }

    // 작가의 다른 작품 읽어오기
    List<BookDto.AuthorOtherBooks> otherBooks = bookService.findAuthorOtherBooks(dto.getAuthorName());

    // 포인트 적립 (회원인 경우에만)
    if (!"0".equals(memberId)) {
      Double pointRate = dto.getPointRate();
      Long bookPrice = dto.getBookPrice();
      Long pointEarnings = Math.round(bookPrice * pointRate);
      dto.setPointEarnings(pointEarnings);
    }

    return new ModelAndView("product_read_page").addObject("book", dto) // 책 정보 읽어올 때
        .addObject("categories", categoriesPath) // 책의 카테고리 정보 읽어올 때
        .addObject("otherBooks", otherBooks) // 작가의 다른 작품 읽어올 때
        .addObject("currentBno", bno).addObject("memberId", memberId);
  }

  // 3.0 부모 카테고리 번호(categorryParent)에 따라 보여줄 페이지(View) 결정
  // ex)categoryParent가 110L이면 category 폴더 안에 book 폴더 안의 novel jsp를 페이지로 설정
  private static final Map<Long, String> CATEGORY_VIEW_MAP = new HashMap<>();

  static {
    CATEGORY_VIEW_MAP.put(110L, "/category/book/novel");
    CATEGORY_VIEW_MAP.put(120L, "/category/book/comicBook");
    CATEGORY_VIEW_MAP.put(130L, "/category/book/textbook");
  }

  // 3. 도서 종류별 리스트 페이지
  @GetMapping("/category/book/{categoryParent}")
  public ModelAndView CategoryParentList(@PathVariable Long categoryParent,
      @RequestParam(defaultValue = "1") Long pageno, RedirectAttributes ra, HttpServletRequest request,
      Long gradeCode) {
    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    // 로그인한 사용자가 있다면 그 사용자의 아이디를 가져오고 회원등급도 가져온다
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용

      // 만약 그게 아니라면, 즉 비회원이라면 memberId를 임의로 '0'으로 설정한 후 gradeCode 또한 0으로 설정함
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    // 부모 카테고리에 따라 페이지 구분 ex) 110 => 소설, 120 => 만화 130 => 참고도서
    Long count = bookDao.categoryParentCount(categoryParent);
    CategoryParentPage pageData = bookService.categoryParentList(pageno, memberId, gradeCode, categoryParent);

    if (!"0".equals(memberId)) {
      for (BookDto.BookList book : pageData.getBooks()) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
    }

    // 부모 카테고리에 따른 뷰 이름 결정 로직
    String viewName = CATEGORY_VIEW_MAP.get(categoryParent);

    // 부모 카테고리에 따라 종류가 정해짐
    if (categoryParent.equals(110L)) {
      viewName = CATEGORY_VIEW_MAP.get(categoryParent);
    } else if (categoryParent.equals(120L)) {
      viewName = CATEGORY_VIEW_MAP.get(categoryParent);
    } else if (categoryParent.equals(130L)) {
      viewName = CATEGORY_VIEW_MAP.get(categoryParent);
    }

    if (viewName == null) {
      // 유효하지 않은 카테고리가 주어진 경우 예외 처리 => index로 보냄
      ra.addFlashAttribute("msg", "잘못된 접근 방법입니다.");
      return new ModelAndView("redirect:/");
    }

    // 각 도서 목록을 Model에 추가한다
    return new ModelAndView(viewName).addObject("page", pageData).addObject("count", count).addObject("memberId",
        memberId);

  }

  // 4.0 카테고리 번호(categoryCode)에 따라 보여줄 페이지(View) 결정
  // ex)categoryCode가 111L이면 category 폴더 안에 book 폴더 안의 novel 안에
  // fantasy_novel_book.jsp를 페이지로 설정
  private static final Map<Long, String> CATEGORY_VIEW_MAP2 = new HashMap<>();

  static {
    CATEGORY_VIEW_MAP2.put(111L, "/category/book/novel/fantasy_novel_book");
    CATEGORY_VIEW_MAP2.put(112L, "/category/book/novel/horror_novel_book");
    CATEGORY_VIEW_MAP2.put(113L, "/category/book/novel/original_novel_book");
    CATEGORY_VIEW_MAP2.put(114L, "/category/book/novel/science_novel_book");
    CATEGORY_VIEW_MAP2.put(115L, "/category/book/novel/romance_novel_book");
    CATEGORY_VIEW_MAP2.put(121L, "/category/book/comicBook/webtoon_book");
    CATEGORY_VIEW_MAP2.put(122L, "/category/book/comicBook/cooking_comic_book");
    CATEGORY_VIEW_MAP2.put(123L, "/category/book/comicBook/action_comic_book");
    CATEGORY_VIEW_MAP2.put(124L, "/category/book/comicBook/academy_comic_book");
    /* ---------------------------------------------------------------------- */
    CATEGORY_VIEW_MAP2.put(125L, "/category/book/comicBook/fantasy_comic_book");
    /* ---------------------------------------------------------------------- */
    CATEGORY_VIEW_MAP2.put(131L, "/category/book/textbook/secondary_book");
    CATEGORY_VIEW_MAP2.put(132L, "/category/book/textbook/toeic_book");
    CATEGORY_VIEW_MAP2.put(133L, "/category/book/textbook/ebs_book");
  }

  // 4. 도서 장르별 리스트 페이지
  @GetMapping("/category/book/{categoryParent}/{categoryCode}")
  public ModelAndView CategoryCodeList(@PathVariable Long categoryParent, @PathVariable Long categoryCode,
      @RequestParam(defaultValue = "1") Long pageno, RedirectAttributes ra, HttpServletRequest request,
      Long gradeCode) {
    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    // 로그인한 사용자가 있다면 그 사용자의 아이디를 가져오고 회원등급도 가져온다
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용

      // 만약 그게 아니라면, 즉 비회원이라면 memberId를 임의로 '0'으로 설정한 후 gradeCode 또한 0으로 설정함
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    Long count = bookDao.categoryCodeCount(categoryCode);
    CategoryCodePage pageData = bookService.categoryCodeList(pageno, memberId, gradeCode, categoryCode, categoryParent);

    // 포인트 적립 (회원인 경우에만)
    if (!"0".equals(memberId)) {
      for (BookDto.BookList book : pageData.getBooks()) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
    }

    // 카테고리에 따른 뷰 이름 결정 로직
    String viewName = CATEGORY_VIEW_MAP2.get(categoryCode);

    // 부모 카테고리에 따라 장르가 정해짐
    if (categoryParent.equals(110L)) {
      viewName = CATEGORY_VIEW_MAP2.get(categoryCode);
    } else if (categoryParent.equals(120L)) {
      viewName = CATEGORY_VIEW_MAP2.get(categoryCode);
    } else if (categoryParent.equals(130L)) {
      viewName = CATEGORY_VIEW_MAP2.get(categoryCode);
    }

    if (viewName == null) {
      // 유효하지 않은 카테고리가 주어진 경우 예외 처리 => index로 보냄
      ra.addFlashAttribute("msg", "잘못된 접근 방법입니다.");
      return new ModelAndView("redirect:/");
    }

    return new ModelAndView(viewName).addObject("page", pageData).addObject("count", count).addObject("memberId",
        memberId);

  }

  // 5. 검색어를 통한 도서 목록 리스트 페이지
  @GetMapping("/book/search")
  public ModelAndView searListPage(@RequestParam(required = false) String keyword,
      @RequestParam(defaultValue = "1") Long pageno, Long gradeCode, HttpServletRequest request) {

    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    // 로그인한 사용자가 있다면 그 사용자의 아이디를 가져오고 회원등급도 가져온다
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용

      // 만약 그게 아니라면, 즉 비회원이라면 memberId를 임의로 '0'으로 설정한 후 gradeCode 또한 0으로 설정함
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    Long count = bookDao.searchListCount(keyword);
    SearchListPage pageData = bookService.searchListPage(pageno, memberId, gradeCode, keyword);

    // 포인트 적립 (회원인 경우에만)
    if (!"0".equals(memberId)) {
      for (BookDto.BookList book : pageData.getBooks()) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
    }

    return new ModelAndView("product_search_list_page").addObject("page", pageData).addObject("count", count)
        .addObject("memberId", memberId);
  }

  // 6. 작가를 검색해 작가의 도서 목록을 나열하는 리스트 페이지
  @GetMapping("/book/search/authorName")
  public ModelAndView AuthorBookList(@RequestParam(required = false) String keyword,
      @RequestParam(defaultValue = "1") Long pageno, Long gradeCode, HttpServletRequest request) {
    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    // 로그인한 사용자가 있다면 그 사용자의 아이디를 가져오고 회원등급도 가져온다
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용

      // 만약 그게 아니라면, 즉 비회원이라면 memberId를 임의로 '0'으로 설정한 후 gradeCode 또한 0으로 설정함
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    Long count = bookDao.authorBookCount(keyword);
    SearchListPage pageData = bookService.authorNameListPage(pageno, memberId, gradeCode, keyword);

    // 포인트 적립 (회원인 경우에만)
    if (!"0".equals(memberId)) {
      for (BookDto.BookList book : pageData.getBooks()) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
    }

    return new ModelAndView("author_search_list_page").addObject("page", pageData).addObject("count", count)
        .addObject("memberId", memberId);
  }

  // 7 출판사를 검색해 작가의 도서 목록을 나열하는 리스트 페이지
  @GetMapping("/book/search/publisher")
  public ModelAndView publisheBookList(@RequestParam(required = false) String keyword,
      @RequestParam(defaultValue = "1") Long pageno, Long gradeCode, HttpServletRequest request) {
    // 세션에서 사용자 정보 가져오기
    HttpSession session = request.getSession();
    String memberId = (String) session.getAttribute("memberId");
    gradeCode = (Long) session.getAttribute("gradeCode");

    // Principal을 통한 대체
    Principal principal = request.getUserPrincipal();
    // 로그인한 사용자가 있다면 그 사용자의 아이디를 가져오고 회원등급도 가져온다
    if (principal != null) {
      memberId = principal.getName(); // Principal의 이름을 memberId로 사용

      // 만약 그게 아니라면, 즉 비회원이라면 memberId를 임의로 '0'으로 설정한 후 gradeCode 또한 0으로 설정함
    } else {
      memberId = "0"; // 비회원인 경우 기본값으로 설정
      gradeCode = 0L;
    }

    Long count = bookDao.publisherBookCount(keyword);
    SearchListPage pageData = bookService.publisherListPage(pageno, memberId, gradeCode, keyword);

    // 포인트 적립 (회원인 경우에만)
    if (!"0".equals(memberId)) {
      for (BookDto.BookList book : pageData.getBooks()) {
        Double pointRate = book.getPointRate();
        Long bookPrice = book.getBookPrice();
        Long pointEarnings = Math.round(bookPrice * pointRate);
        book.setPointEarnings(pointEarnings);
      }
    }

    return new ModelAndView("publisher_search_list_page").addObject("page", pageData).addObject("count", count)
        .addObject("memberId", memberId);
  }
  
  	//8. 바로 구매 구현
	@Secured("ROLE_USER")
	@PostMapping("/buy/{bno}")
	public String buyNow(@PathVariable Long bno, HttpServletRequest request, Long gradeCode, @RequestParam(required = false, defaultValue = "1") Long cartCount) {
		
		// 세션에서 사용자 정보 가져오기
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		gradeCode = (Long) session.getAttribute("gradeCode");

		// Principal을 통한 대체
		Principal principal = request.getUserPrincipal();
		// 로그인한 사용자가 있다면 그 사용자의 아이디를 가져오고 회원등급도 가져온다
		if (principal != null) {
			memberId = principal.getName(); // Principal의 이름을 memberId로 사용

			// 만약 그게 아니라면, 즉 비회원이라면 memberId를 임의로 '0'으로 설정한 후 gradeCode 또한 0으로 설정함
		} else {
			memberId = "0"; // 비회원인 경우 기본값으로 설정
			gradeCode = 0L;
		}
		
		// 책 정보 조회
	    BookDto.Read book = bookService.read(bno, memberId, gradeCode);

	    // 장바구니 리스트를 세션에 저장
	    List<CartDto.Select> cartList = new ArrayList<>();
	    CartDto.Select cartItem = new CartDto.Select();
	    cartItem.setBno(book.getBno());
	    cartItem.setBookTitle(book.getBookTitle());
	    cartItem.setBookImage(book.getBookImage());
	    cartItem.setCartCount(cartCount);  // 수량은 1로 설정
	    cartItem.setAmount(book.getBookPrice());  // 가격은 책의 가격으로 설정
		cartItem.setTotalAmount(book.getBookPrice());
		cartItem.setTotalPointEarnings(book.getPointEarnings());
	    cartList.add(cartItem);
	    
	    session.setAttribute("cartList", cartList);

	    // 결제 페이지로 리다이렉트
	    return "redirect:/order";
	}

  // 도서 이미지 보여주기 위한 설정
  @GetMapping("/category/{imageName}")
  public ResponseEntity<byte[]> viewProfile(@PathVariable String imageName) {
    File file = new File("c:/upload/books", imageName);
    try {
      byte[] bytes = Files.readAllBytes(file.toPath());
      String contentType = Files.probeContentType(file.toPath());
      MediaType type = MediaType.parseMediaType(contentType);
      return ResponseEntity.ok().contentType(type).body(bytes);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }
}
