package com.pageflow.controller.book;

import org.apache.ibatis.type.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.pageflow.dao.book.*;
import com.pageflow.dto.book.*;
import com.pageflow.entity.book.*;
import com.pageflow.service.book.*;

// 상품 추가, 삭제
// 작업을 하려면 ADMIN 권한이 필요하므로 작성자 아이디를 확인하지 않는다

@Secured("ROLE_ADMIN")
@Controller
public class BookAdminController {
  @Autowired
  private BookAdminService service;

  @Autowired
  private BookDao bookDao;

  /** 1-1. 상품 추가 페이지(GetMapping) */
  @GetMapping("/admin/book/add")
  public ModelAndView add() {
    return new ModelAndView("admin_product_add_page");
  }

  /** 1-2. 상품 추가 페이지(PostMapping) */
  @PostMapping("/admin/book/add")
  public ModelAndView add(BookDto.Add dto, RedirectAttributes ra) {
    service.add(dto);
    return new ModelAndView("redirect:/admin/book/list");
  }

  /**
   * 1-3. 상품 등록할 때 아무것도 입력하지 않고 등록 버튼을 누르면 TypeException 오류가 발생함 그래서 오류 처리를 위한
   * RedirectAttributes 사용해서 등록했을 때 오류 발생할 경우 상품 등록에 실패했다는 메세지와 함께 다시 그 페이지를 띄움
   */
  @ExceptionHandler(TypeException.class)
  public ModelAndView aaa(TypeException e, RedirectAttributes ra) {
    System.out.println(e.getMessage());
    ra.addFlashAttribute("msg", "상품 등록에 실패하였습니다. 입력 정보를 확인하고 다시 시도해 주세요");
    return new ModelAndView("redirect:/admin/book/add");
  }

  // 2-1. 관리자 상품 리스트 페이지(GetMapping)
  @GetMapping("/admin/book/list")
  public ModelAndView adminBookList(@RequestParam(defaultValue = "1") Long pageno) {
    Long count = bookDao.adminBookListCount();
    BookPage page = service.adminBookList(pageno);
    return new ModelAndView("admin_product_list_page").addObject("page", page).addObject("count", count);
  }

  // 2-2. 관리자 상품 리스트 삭제
  @PostMapping("/admin/book/delete")
  public ModelAndView delete(Long bno) {
    service.deleteByBno(bno);
    return new ModelAndView("redirect:/admin/book/list");
  }

  // 3-1. 상품 수정 페이지(GetMapping)
  @GetMapping("/admin/book/update/{bno}")
  public ModelAndView update(@PathVariable Long bno) {
    Book book = bookDao.findByBno(bno);
    return new ModelAndView("admin_product_update_page").addObject("book", book);

  }

  // 3-2. 상품 수정 페이지(PostMapping)
  @PostMapping("/admin/book/update/{bno}")
  public ModelAndView update(@PathVariable Long bno, BookDto.Update dto) {
    service.update(dto);
    return new ModelAndView("redirect:/admin/book/list");
  }

  // 4. 관리자 도서 검색 리스트 페이지(GetMapping)
  @GetMapping("admin/book/list/search")
  public ModelAndView adminSearchPage(@RequestParam(required = false) String keyword,
      @RequestParam(defaultValue = "1") Long pageno) {
    Long count = bookDao.searchListCount(keyword);
    AdminSearchPage page = service.adminSearchBookList(pageno, keyword);
    return new ModelAndView("admin_search_list_page").addObject("page", page).addObject("count", count);
  }

}
