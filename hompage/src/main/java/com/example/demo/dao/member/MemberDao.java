package com.example.demo.dao.member;

import org.apache.ibatis.annotations.*;

import com.example.demo.entity.member.*;

@Mapper
public interface MemberDao {
	// 회원가입
	@Insert("insert into member values(#{memberId}, 'FRIENDS', #{memberName}, #{memberEmail}, #{password}, #{memberAddress}, #{memberTel}, #{memberProfile}, #{memberPoint}, #{joinday}, #{birthday})")	
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
	@Update("update member set password=#{password} where member_id=#{memberId}")
	public Integer changePassword(String password, String memberId);
	
	// 이메일 변경
	@Update("update member set member_email=#{memberEmail} where password=#{password}")
	public Integer changeMemberEmail(String memberEmail, String password);
	
	// 전화번호 변경
	@Update("update member set member_tel=#{memberTel} where password=#{password}")
	public Integer changeMemberTel(String memberTel, String password);
	
	// 프로필사진 변경
	@Update("update member set member_profile=#{memberProfile} where member_id=#{memberId}")
	public Integer changeProfile(String memberProfile, String memberId);
	
	// 회원 탈퇴
	@Delete("delete from member where member_id=#{memberId}")
	public Integer deleteById(String memberId);
	
	// 아이디 찾기 - 이메일
	@Select("select member_id from member where member_email=#{memberEmail}")
	public Member findIdByEmail(String memberEmail);
	
	// 아이디 찾기 - 전화번호
	@Select("select member_id from member where member_tel=#{memberTel}")
	public Member findIdByTel(String memberTel);
}


