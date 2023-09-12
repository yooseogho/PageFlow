package com.example.demo.member.dao;

import org.apache.ibatis.annotations.*;

import com.example.demo.member.entity.*;

@Mapper
public interface MemberDao {
	@Select("select * from member" )
	public Member findById(String username);
}
