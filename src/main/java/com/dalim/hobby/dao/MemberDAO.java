package com.dalim.hobby.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAO {
	
	JdbcTemplate template;
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	
	// 회원가입
	public void createAccount(final String memId, final String memPw, final String memName, final String memEmail, 
			final String memPhone, final String memCity, final String memRegion, final int memPwHint, final String memPwAns) {
		 
		String query = "insert into member(memId, memPw, memName, memPhone, memEmail, memCity, memRegion, memPwHint, memPwAns)"
				+ " values(?,?,?,?,?,?,?,?,?)";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memId);
				ps.setString(2, memPw);
				ps.setString(3, memName);
				ps.setString(4, memEmail);
				ps.setString(5, memPhone);
				ps.setString(6, memCity);
				ps.setString(7, memRegion);
				ps.setInt(8, memPwHint);
				ps.setString(9, memPwAns);
			}
		});
	}
	
	
	
	
	
	
	
/*	
	
	// 로그인
	public MemberVO login(String mId, String mPwd) {
		
		MemberVO dto = null;
		String query = "select * from m_member where mId='" + mId + "' and mPwd='" + mPwd + "'";
		try {
			dto = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return dto;
	}
	
	
	// 리스트
	public ArrayList<MemberVO> list(){
		String query = "select * from m_member order by mJoinDate desc";
		return (ArrayList<MemberVO>) template.query(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
	}
	
	
	// 아이디 중복 확인
	public MemberVO checkId(String mId) {
		MemberVO dto = null;
		String query = "select * from m_member where mId='" + mId + "'";
		try {
			dto = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return dto;
	}
	
	
	// 아이디 찾기
	public MemberVO searchId(String mName, String mEmail, String mBirth) {
		MemberVO dto = null;
		String query = "select * from m_member where mName='"+mName +"' and "
				+ "mEmail='"+mEmail+"' and mBirth='"+mBirth+"'";
		try {
			dto = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("검색된 아이디가 없습니다.");
			return null;
		}
		
		return dto;
	}
	
	
	// 회원 정보 수정
	public void memberModify(final String mId, final String mName, final String mMobile, 
			final String mEmail, final String mRegion, final String mBirth) {
		String query = "update m_member set mName=?, mMobile=?, mEmail=?, mRegion=?, mBirth=? where mId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, mName);
				ps.setString(2, mMobile);
				ps.setString(3, mEmail);
				ps.setString(4, mRegion);
				ps.setString(5, mBirth);
				ps.setString(6, mId);
			}
		});
	}
	
	
	// 회원 탈퇴
	public void memberDelete(final String mId) {
		String query = "delete from m_member where mId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, mId);
			}
		});
	}
	
	

*/	
	
	
} // end of MDao
