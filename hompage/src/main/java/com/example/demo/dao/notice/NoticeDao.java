package com.example.demo.dao.notice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.demo.entity.notice.*;

@Mapper
public interface NoticeDao {

  // 글 저장
  @SelectKey(statement = "select notice_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "nno")
  @Insert("insert into notice values(#{nno},#{noticeTitle},#{noticeContent},'고객센터',sysdate)")
  public Long save(Notice notice);

  // 페이징 - 글의 개수
  @Select("select count(*) from notice")
  public Long count();

  // 페이징 쿼리
  public List<Notice> findAll(Long startRownum, Long endRownum);

  // 글 내용확인
  @Select("select * from notice where nno=#{nno} and rownum=1")
  public Notice findRead(Long nno);

  // 글 내용 및 제목 변경
  @Update("UPDATE notice SET notice_title=#{noticeTitle}, notice_content=#{noticeContent} WHERE nno=#{nno}")
  public Integer updateNotice(Long nno, String noticeTitle, String noticeContent);

  // 글 삭제
  @Delete("delete from notice where nno=#{nno}")
  public Integer deleteByNno(Long nno);

 //	글 모두 불러오기
  @Select("select * from notice Notices ORDER BY nno DESC")
  public List<Notice> getAllNotices();
  
  // 고객센터 공지사항 최신순 3개 불러오기
  @Select("SELECT * FROM (SELECT * FROM notice ORDER BY nno DESC) WHERE ROWNUM <= 3")
  public List<Notice> findTop3ByOrderByNoticeWritedayDesc();
  
  
  // 공지사항 이전글 불러오기
  public Notice findPrev(Long nno);
  
  // 공지사항 다음글 불러오기
  public Notice findNext(Long nno);
 

}
