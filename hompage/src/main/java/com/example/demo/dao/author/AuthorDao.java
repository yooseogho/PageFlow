package com.example.demo.dao.author;

import org.apache.ibatis.annotations.*;

import com.example.demo.entity.author.*;

@Mapper
public interface AuthorDao {
	// 작가 등록
	@Insert("insert into author values(#{authorCode}, #{authorName})")
	public Integer save(Author author);
		
	// 작가 정보 조회(작가 코드 기준)
	@Select("select * from author where author_code=#{authorCode}")
	public Author findByAuthorCode(Long authorCode);
		
	// 작가 정보 조회(작가 이름 기준)
	@Select("select * from author where author_name=#{authorName}")
	public Author findByAuthorName(String authorName);
		
	// 작가 이름 수정
	@Update("update author set author_name=#{authorName} where author_code=#{authorCode}")
	public Integer changAuthorName(String authorName, Long authorCode);
		
	// 작가 삭제
	@Delete("delete from author where author_code=#{authorCode}")
	public Integer deleteById(Long authorCode);
}
