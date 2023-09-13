package com.example.demo.dao.publisher;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.entity.publisher.*;

@Mapper
public interface PublisherDao {
	// 출판사 저장
	@Insert("insert into publisher values(#{publisherCode}, #{publisherName})")
	public Integer save(Publisher publisher);
		
	// 전체 조회
	@Select("select * from publisher")
	public List<Publisher> findAll();
		
	// 상세 정보 조회
	@Select("select * from publisher where publisher_code=#{publisherCode}")
	public Publisher findById(Long publisherCode);
		
	// 상세 정보 이름으로 조회
	@Select("select * from publisher where publisher_name=#{publisherName}")
	public Publisher findByName(String publisherName);
		
	// 출판사 이름변경
	@Update("update publisher set publisher_name=#{publisherName} where publisher_code=#{publisherCode}")
	public Integer changPublisherName(String publisherName, Long publisherCode);
		
		
	// 출판사 삭제
	@Delete("delete from publisher where publisher_code=#{publisherCode}")
	public Integer deleteById(Long publisherCode);
}
