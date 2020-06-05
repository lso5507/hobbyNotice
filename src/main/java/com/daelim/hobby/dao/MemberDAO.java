package com.daelim.hobby.Dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.daelim.hobby.Vo.MemberVO;


@Repository
public class MemberDAO {
	
	JdbcTemplate template;
	@Autowired
	public void setTemplate(JdbcTemplate template) { // JdbcTemplate 을 사용하기 위한 세팅
		this.template = template;
	}
	

	
	// 회원가입
	public void createAccount(final String memId, final String memPw, final String memName, final String memPhone, final String memEmail, 
			final String memRegion, final String memCity, final String memBirth, final int memPwHint, final String memPwAns) {

		String query = "insert into member(memId, memPw, memName, memPhone, memEmail, memRegion, memCity, memBirth, memPwHint, memPwAns)"
				+ " values(?,?,?,?,?,?,?,?,?,?)";
		
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memId);
				ps.setString(2, memPw);
				ps.setString(3, memName);
				ps.setString(4, memPhone);
				ps.setString(5, memEmail);
				ps.setString(6, memRegion);
				ps.setString(7, memCity);
				ps.setString(8, memBirth);
				ps.setInt(9, memPwHint);
				ps.setString(10, memPwAns);
			}
		});
	}
		
	
	// 아이디 중복 확인
	public MemberVO checkId(String memId) {
		MemberVO mVo = null;
		System.out.println("아이디: " + memId);
		String query = "select * from member where memId='" + memId + "'";
		System.out.println(query);
		
		try {
			
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("return null");
			return null;
		}
		
		return mVo;
	}
	
	
	// 로그인
	public MemberVO login(String memId, String memPw) {
		
		MemberVO mVo = null;
		String query = "select * from member where memId='" + memId + "' and memPw='" + memPw + "'";
		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return mVo;
	}
	
	
	
	// 아이디 찾기 (이름, 이메일로 찾기)
	public MemberVO searchId(String memName, String memEmail) {
		MemberVO mVo = null;
		String query = "select * from member where memName='"+ memName +"' and memEmail='"+ memEmail +"'";
		System.out.println(query);
		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("검색된 아이디가 없습니다.");
			return null;
		}
		
		return mVo;
	}
	
	
	
	// 비밀번호 찾기
	public MemberVO searchPw(String memId, int memPwHint, String memPwAns) {
		MemberVO mVo = null;
		String query = "select * from member where memId='"+ memId +"' and memPwHint="+ memPwHint +" and memPwAns='"+ memPwAns +"'";
		System.out.println(query);
		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호가 없습니다.");
			return null;
		}
		
		return mVo;
	}
	
	
	
	// 회원 정보 수정
	public void memberModify(final String memId, final String memPhone, final String memEmail, final String memRegion, final String memCity) {
		String query = "update member set memPhone=?, memEmail=?, memRegion=?, memCity=? where memId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memPhone);
				ps.setString(2, memEmail);
				ps.setString(3, memRegion);
				ps.setString(4, memCity);
				ps.setString(5, memId);
			}
		});
	}
	
	
	// 비밀번호 변경
	public void memberPwModify(final String memId, final String memPw) {
		String query = "update member set memPw=? where memId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memPw);
				ps.setString(2, memId);
			}
		});
	}
	
	
	
	
	// 회원 탈퇴
	public void memberDelete(final String memId) {
		String query = "delete from member where memId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memId);
			}
		});
	}
	
	
	// 리스트
	public ArrayList<MemberVO> list(){
		String query = "select * from member order by memRegDate desc";
		return (ArrayList<MemberVO>) template.query(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
	}
	
	
} // end of MDao
