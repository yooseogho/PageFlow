package com.example.demo.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.demo.notice.entity.Notice;

@Mapper
public interface NoticeDao {

	
	// 글 저장
	@SelectKey(statement = "select notice_seq.nextval from dual",before = true, resultType = long.class,keyProperty="nno")
	@Insert("insert into notice values(#{nno},#{noticeTitle},#{noticeContent},'고객센터',#{noticeWriteday})")
	public Integer save(Notice notice);
	
	// 페이징 - 글의 개수
	@Select("select count(*) from notice")
	public Long count();
	
	// 페이징 쿼리	
	public List<Notice> findAll(Long startRownum,Long endRownum);
	
	// 글 내용확인
	@Select("select * from notice where nno=#{nno} and rownum=1")
	public Notice findRead(Long nno);
	
	// 글 내용 변경
	@Update("update set notice_content where nno=#{nno} ")
	public Integer increaseContent();
	// 글 제목 변경
	@Update("update set notice_title where nno=#{nno} ")
	public Integer increaseTitle();
	
	// 글 삭제
	@Delete("delete from notice where nno=#{nno}")
	public Integer deleteByNno(Long nno);
	
	
	
	
	
	
	
	
	
	
}
