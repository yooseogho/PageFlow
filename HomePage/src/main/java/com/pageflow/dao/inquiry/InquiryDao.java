package com.pageflow.dao.inquiry;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.pageflow.entity.inquiry.*;

@Mapper
public interface InquiryDao {
  // 문의사항 확인
  @Select("select * from inquiry where inno=#{inno} and rownum=1")
  public Inquiry findByInno(Long inno);

  // 회원이 작성한 모든 문의사항
  @Select("select * from inquiry where memberId=#{memberId} and rownum=1")
  public List<Inquiry> findByMemberId(String memberId);

  // 새로운 문의사항을 저장
  @Insert("insert into inquiry(inno, content, inquiryType,inquiryTitle) values(#{inno}, #{content}, #{inquiryType},#{inquiryTitle})")
  @SelectKey(statement = "select inquiry_seq.nextval from dual", keyProperty = "inno", before = true, resultType = Long.class)
  public Integer save(Inquiry inquiry);

  // 문의사항 내용 수정
  @Update("update inquiry set content=#{content} where inno=#{inno}")
  public Integer updateContent(String content, Long inno);

  // 문의사항 삭제
  @Delete("delete from inquiry where inno=#{inno}")
  public Integer deleteByInNo(Long inno);

}
