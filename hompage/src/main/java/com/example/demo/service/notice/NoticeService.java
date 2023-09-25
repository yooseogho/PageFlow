package com.example.demo.service.notice;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.notice.*;
import com.example.demo.entity.notice.*;

@Service
public class NoticeService {
  @Autowired
  private NoticeDao noticeDao;

//  1. 공지사항 등록 (INSERT 문)
  public Boolean insertNotice(String noticeTitle, String noticeContent) {
    if (noticeTitle.isEmpty() || noticeTitle.isBlank() || noticeContent.isEmpty() || noticeContent.isBlank()) {
      return false;
    }

    Notice notice = new Notice();
    notice.setNoticeTitle(noticeTitle);
    notice.setNoticeContent(noticeContent);

    return noticeDao.save(notice) == 1;
  }

//  2. 공지사항 삭제 (DELETE 문)
  public Boolean deleteNotice(Long nno) {
    if (nno == null) {
      return false;
    }
    Integer deleteRows = noticeDao.deleteByNno(nno);
    return deleteRows == 1;
  }

//  3. 공지사항 수정 (UPDATE 문)
  public Boolean updateNotice(Long nno, String noticeTitle, String noticeContent) {
    if (nno == null) {
      return false;
    }
    return noticeDao.updateNotice(nno, noticeTitle, noticeContent) == 1;
  }

//  4. 공지사항 보기 (SELECT 문)
  public Notice checkNotice(Long nno) {
    if (nno == null) {
      return null;
    }
    return noticeDao.findRead(nno);
  }

//  5. 공지사항 페이지네이션 (SELECT 문)
  public Boolean count() {
    return noticeDao.count() == 1;
  }

//  0. 공지사항 모두 불러오기 (SELECT 문)
  public List<Notice> getAllNotices() {
    return noticeDao.getAllNotices();
  }

}
