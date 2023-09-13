package com.example.demo.dao.member;

import org.apache.ibatis.annotations.*;

import com.example.demo.entity.member.*;

@Mapper
public interface MemberDao {
	// 회원가입
	@Insert("insert into member values(#{memberId}, #{gradeCode}, #{memberName}, #{memberEmail}, #{password}, #{memberAddress}, #{memberTel}, #{memberProfile}, #{memberPoint}, #{joinday}, #{birthday})")	
	public Integer save(Member member);

	// 아이디 중복
	@Select("select * from member where member_id=#{memberId} and rownum=1")
	public Member findById(String memberId);
	
	// 전화번호 중복
	@Select("select * from member where member_tel=#{memberTel} and rownum=1")
	public Member findByTel(String memberTel);
	
	// 내정보 보기
	@Select("select * from member where password=#{password} and rownum=1")
	public Member findAll(String password);
	
	// 비밀번호 변경
	@Update("update member set password=#{password} where password=#{password}")
	public Integer changPassword(String password);
	
	// 이름 변경
	@Update("update member set member_name=#{memberName} where password=#{password}")
	public Integer changMemberName(String memberName, String password);
	
	// 이메일 변경
	@Update("update member set member_email=#{memberEmail} where password=#{password}")
	public Integer changMemberEmail(String memberEmail, String password);
	
	// 전화번호 변경
	@Update("update member set member_tel=#{memberTel} where password=#{password}")
	public Integer changMemberTel(String memberTel, String password);
	
	// 프로필사진 변경
	@Update("update member set member_profile=#{memberProfile} where password=#{password}")
	public Integer changProfile(String memberProfile, String password);
	
	// 회원 탈퇴
	@Delete("delete from member where password=#{password}")
	public Integer deleteById(String password);
	
	// 아이디 찾기 - 이메일
	@Select("select memberId from member where member_email=#{memberEmail}")
	public String findIdByEmail(String memberEmail);
	
	// 아이디 찾기 - 전화번호
	@Select("select memberId from member where member_tel=#{memberTel}")
	public String findIdByTel(String memberTel);
}


