package com.pageflow.dao.inquiry;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.entity.inquiry.*;

@Mapper
public interface InquiryDao {
	// 문의사항 작성
	@Select("select i.*, m.member_tel from inquiry i inner join member m on i.member_id = m.member_id where i.inno=#{inno} and rownum=1")
	public Inquiry findByInno(Long inno);

	// 회원이 작성한 모든 문의사항
	@Select("SELECT * FROM inquiry WHERE member_id = #{memberId} order by inno desc")
	public List<Inquiry> findByMemberId(String memberId);

	@SelectKey(statement = "select inquiry_seq.nextval from dual", before = true, resultType = long.class, keyProperty = "inno")
	@Insert("insert into inquiry(inno, member_id, content, inquiry_type, inquiry_title, inquiry_answer) values(#{inno}, #{memberId,jdbcType=VARCHAR}, #{content,jdbcType=VARCHAR}, #{inquiryType,jdbcType=CLOB}, #{inquiryTitle,jdbcType=VARCHAR}, #{inquiryAnswer,jdbcType=CLOB})")
	public Integer save(Inquiry inquiry);

	// 문의사항 내용 수정
	@Update("update inquiry set inquiry_type=#{inquiryType}, inquiry_title=#{inquiryTitle}, content=#{content} where inno=#{inno}")
	public Integer updateContent(Long inno, String inquiryType, String inquiryTitle, String content);

	// 문의사항 삭제
	@Delete("delete from inquiry where inno=#{inno}")
	public Integer deleteByInNo(Long inno);

	// 문의사항 확인 - 관리자
	@Select("SELECT * FROM inquiry ORDER BY inno DESC")
	public List<Inquiry> getAllInquiries();
	
	@Update("update inquiry set inquiry_answer=#{inquiryAnswer} where inno=#{inno}")
	public Integer createAnswer(Long inno, String inquiryAnswer);
}
