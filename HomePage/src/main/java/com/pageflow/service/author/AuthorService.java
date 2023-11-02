package com.pageflow.service.author;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pageflow.dao.author.*;
import com.pageflow.entity.author.*;

import java.util.List;

@Service
public class AuthorService {
  @Autowired
  private AuthorDao authorDao;

  // 작가 등록
  public Integer saveAuthor(Author author) {
    Integer checkName = authorDao.save(author);
//    이름이 공백이면 NULL 반환
    if (author.getAuthorName() == "") {
      return null;
    } else {
      return checkName;
    }
  }

  // 작가 정보 조회(작가 코드 기준)
  public Author getAuthorByAuthorCode(Long authorCode) {
    Author findByCode = authorDao.findByAuthorCode(authorCode);
//    작가 코드가 없다면 NULL 반환
    if (findByCode == null) {
      return null;
    } else {
      return authorDao.findByAuthorCode(authorCode);
    }
  }

  // 작가 정보 조회(작가 이름 기준)
  public Author getAuthorByAuthorName(String authorName) {
    Author findByName = authorDao.findByAuthorName(authorName);
//    작가명이 겹치는 것이 없다면 NULL 반환
    if (findByName == null) {
      return null;
    } else {
      return authorDao.findByAuthorName(authorName);
    }
  }

  // 작가 이름 수정
  public Integer changeAuthorName(String authorName, Long authorCode) {
    Integer changeName = authorDao.changAuthorName(authorName, authorCode);
//    작가 코드와 대조하여 작가 이름이 일치하는 것이 없다면 NULL 반환
    if (changeName == null) {
      return null;
    } else {
      return authorDao.changAuthorName(authorName, authorCode);
    }
  }

  // 작가 삭제
  public Integer deleteAuthorById(Long authorCode) {
    Integer delete = authorDao.deleteById(authorCode);
    if (delete == null) {
      return null;
    } else {
      return authorDao.deleteById(authorCode);
    }
  }

  // 전체 작가 조회
  public List<Author> getAllAuthors() {
    return authorDao.getAllAuthor();
  }
}
