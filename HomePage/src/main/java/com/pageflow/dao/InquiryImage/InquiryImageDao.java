package com.pageflow.dao.InquiryImage;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.pageflow.entity.inquiryImage.*;

@Mapper
public interface InquiryImageDao {

  // 새로운 문의 이미지를 db에 저장한다
  @SelectKey(statement = "select inquiry_image.nextval from dual", before = true, resultType = long.class, keyProperty = "iino")
  @Insert("INSERT INTO inquiry_image (iino, ii_name, inno) VALUES (#{iino}, #{iiName}, #{inno})")
  public InquiryImage insertInquiryImage(InquiryImage inquiryImage);

  // 문의사항 사진변경
  @Update("UPDATE inquiry_image SET inno = #{inno} WHERE iino = #{iino} AND ii_name = #{iiName}")
  public Integer updateInquiryImage(InquiryImage inquiryImage);

  // 문의이미지 삭제
  @Delete("DELETE FROM inquiry_image WHERE iino = #{iino} AND ii_name = #{iiName}")
  public Integer deleteInquiryImage(Long iino, String iiName);

  // 주어진 문의 번호(iino)와 이미지 이름(iiName)에 해당하는 문의 이미지를 조회합니다.
  @Select("SELECT * FROM inquiry_image WHERE iino = #{iino} AND ii_name = #{iiName}")
  public InquiryImage getInquiryImage(Long iino, String iiName);

  // 주어진 문의 번호 에 해당하는 모든 문의 이미지 목록을 조회합니다.
  @Select("SELECT * FROM inquiry_image WHERE inno = #{inno}")
  public List<InquiryImage> getInquiryImagesByInno(Long inno);

//    전체 조회
  @Select("select * from inquiry_image")
  public List<InquiryImage> getAllInquiryImage();

}
