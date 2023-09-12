package com.example.demo.notice.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface NoticeDao {
	@Insert()
	public Long save(String aaaa);
	
	@Select()
	public Long aa(String aa);

}
