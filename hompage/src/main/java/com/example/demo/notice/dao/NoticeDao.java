package com.example.demo.notice.dao;

import org.apache.ibatis.annotations.*;

@Mapper
public interface NoticeDao {
//	@Insert()
	public Long save(String aaaa);
	
//	@Select()
	public Long aa(String aa);

}
