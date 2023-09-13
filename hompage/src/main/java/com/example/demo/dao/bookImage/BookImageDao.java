package com.example.demo.dao.bookImage;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.entity.bookImage.BookImage;

@Mapper
public interface BookImageDao {
	// book bno 외래키 활용 
	
	// 책 사진저장
	@Insert("insert into  values(bookImage_seq.nextval, #{imageName}, #{bno})")
	public Integer save(BookImage bookImage);
	
	// 리스트에저장된 사진 꺼내기
	@Select("select imageName from Book_Image where bno=#{bno}")
	public List<String> findByPno(Long bno);
	
	// 책 사진 삭제
	@Delete("delete from Book_Image where bno=#{bno}")
	public Integer deleteByPno(Long bno);
	
}
