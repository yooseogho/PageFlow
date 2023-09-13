package com.example.demo.service.notice;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.notice.*;
import com.example.demo.entity.notice.*;

@Service
public class NoticeService {
  @Autowired
  private NoticeDao noticeDao;
  
  public Boolean insertNotice(String noticeTitle, String noticeContent) {
    if(noticeTitle.isEmpty()||noticeTitle.isBlank()||noticeContent.isEmpty()||noticeContent.isBlank()) {
      return false;
    }
    
    Notice notice = new Notice();
    notice.setNoticeTitle(noticeTitle);
    notice.setNoticeContent(noticeContent);
    
    return noticeDao.save(notice)==1;
  }
  
  public Boolean deleteNotice(Long nno) {
    if(nno==null) {
      return false;
    }
    Integer deleteRows = noticeDao.deleteByNno(nno);
    return deleteRows==1;
  }
  
  public Boolean updateNotice(Long nno, String noticeTitle, String noticeContent) {
    if(nno==null) {
      return false;
    }
    return noticeDao.updateNotice(nno, noticeTitle, noticeContent)==1;
  }
  
  public Notice checkNotice(Long nno) {
    if(nno==null) {
      return null;
    }
    return noticeDao.findRead(nno);
  }
  
  public Boolean count() {
    return noticeDao.count()==1;
  }
  
}
