package com.example.demo.controller.book;

import com.example.demo.dto.book.*;
import com.example.demo.entity.book.Book;
import com.example.demo.service.book.BookService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BookController {
  @Autowired
  private BookService bookService;

  // 1. 도서 목록 페이지
  @GetMapping("/list")
  public String listBooks(@RequestParam(value = "startRownum", defaultValue = "1") Long startRownum,
      @RequestParam(value = "endRownum", defaultValue = "10") Long endRownum, Model model) {
    List<Book> books = bookService.getAllBooks(startRownum, endRownum); // 모든 도서 조회
    model.addAttribute("books", books); // 모델에 도서 목록 추가
    return "bookList"; // 도서 목록 페이지의 이름 (예: bookList.jsp)
  }

  // 2. 도서 등록 페이지 (GET 방식)
  @Secured("ROLE_ADMIN")
  @GetMapping("/register")
  public String showRegistrationForm(Model model) {
    model.addAttribute("registrationDto", new BookDto.Registration());
    return "bookRegistration"; // 도서 등록 페이지의 이름 (예: bookRegistration.jsp)
  }

  // 3. 도서 등록 처리 (POST 방식)
  @PostMapping("/register")
  public String registerBook(@ModelAttribute("registrationDto") BookDto.Registration registrationDto, Model model) {
    Boolean isRegistered = bookService.registerBook(registrationDto); // 도서 등록 시도
    if (!isRegistered) {
      // 도서 등록 실패 시 처리
      // 예: 오류 메시지 추가
      model.addAttribute("error", "도서 등록에 실패했습니다.");
      return "bookRegistration";
    }
    return "redirect:/books/list"; // 도서 목록 페이지로 리다이렉트
  }

  // 4. 도서 상세 정보 페이지
  @GetMapping("/{bno}")
  public String getBookDetail(@PathVariable Long bno, Model model) {
    BookDto.Read book = bookService.getBookDetail(bno); // 도서 상세 정보 조회
    if (book == null) {
      // 도서를 찾지 못한 경우 처리
      // 예: 오류 메시지 추가
      model.addAttribute("error", "해당 도서를 찾을 수 없습니다.");
      return "bookDetail";
    } else {
      model.addAttribute("book", book); // 모델에 도서 상세 정보 추가
      return "bookDetail"; // 도서 상세 정보 페이지의 이름 (예: bookDetail.jsp)
    }
  }

  // 5. 도서 삭제 처리
  @Secured("ROLE_ADMIN")
  @PostMapping("/{bno}/delete")
  public String deleteBook(@PathVariable Long bno, Model model) {
    Boolean isDeleted = bookService.deleteBook(bno); // 도서 삭제 시도
    if (!isDeleted) {
      // 도서 삭제 실패 시 처리
      // 예: 오류 메시지 추가
      model.addAttribute("error", "도서 삭제에 실패했습니다.");
    }
    return "redirect:/books/list"; // 도서 목록 페이지로 리다이렉트
  }

  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
