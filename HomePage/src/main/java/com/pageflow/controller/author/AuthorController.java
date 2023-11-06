package com.pageflow.controller.author;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pageflow.entity.author.*;
import com.pageflow.service.author.*;

import java.util.List;

@Controller
public class AuthorController {
  @Autowired
  private AuthorService authorService;

  @GetMapping("/authors/add")
  @Secured("ROLE_ADMIN")
  public String showAddAuthorForm(Model model) {
    return "add-author";
  }

  @PostMapping("/authors/add")
  @Secured("ROLE_ADMIN")
  public String addAuthor(@ModelAttribute Author author) {
    Integer result = authorService.saveAuthor(author);
    if (result != null) {
      return "redirect:/authors";
    } else {
      return "add-author";
    }
  }

  @GetMapping("/authors/{authorCode}")
  public String getAuthorByAuthorCode(@PathVariable Long authorCode, Model model) {
    Author author = authorService.getAuthorByAuthorCode(authorCode);
    if (author != null) {
      model.addAttribute("author", author);
      return "author-details";
    } else {
      return "?error";
    }
  }

  @GetMapping("/authors/name/{authorName}")
  public String getAuthorByAuthorName(@PathVariable String authorName, Model model) {
    Author author = authorService.getAuthorByAuthorName(authorName);
    if (author != null) {
      model.addAttribute("author", author);
      return "author-details";
    } else {
      return "?error";
    }
  }

  @GetMapping("/authors/{authorCode}/edit")
  @Secured("ROLE_ADMIN")
  public String showEditAuthorForm(@PathVariable Long authorCode, Model model) {
    Author author = authorService.getAuthorByAuthorCode(authorCode);
    if (author != null) {
      model.addAttribute("author", author);
      return "edit-author";
    } else {
      return "?error";
    }
  }

  @PostMapping("/authors/{authorCode}/edit")
  @Secured("ROLE_ADMIN")
  public String editAuthorName(@PathVariable Long authorCode, @RequestParam String authorName) {
    Integer result = authorService.changeAuthorName(authorName, authorCode);
    if (result != null) {
      return "redirect:/authors";
    } else {
      return "edit-author";
    }
  }

  @GetMapping("/authors/{authorCode}/delete")
  @Secured("ROLE_ADMIN")
  public String deleteAuthor(@PathVariable Long authorCode) {
    Integer result = authorService.deleteAuthorById(authorCode);
    if (result != null) {
      return "redirect:/authors";
    } else {
      return "?error";
    }
  }

  @GetMapping("/authors")
  public String getAllAuthors(Model model) {
    List<Author> authors = authorService.getAllAuthors();
    model.addAttribute("authors", authors);
    return "author-list";
  }
  /*
   * [참고] 추후에 변동될 사항이 많으니, 기본 예로 볼 것 매핑 경로나 반환 경로는 임의로 정해둔 것이니 추후 상황에 맞게 수정할 것
   * 컨트롤러에 대한 의견/아이디어가 있으면 고민하지 말고 말할 것
   */
}
