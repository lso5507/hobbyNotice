package com.dalim.hobby.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.dalim.hobby.vo.MemberVO;


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
		
//		String query = "insert into member(memId, memPw, memName, memPhone, memEmail, memRegion, memCity, memPwHint, memPwAns)"
//				+ " values(?,?,?,?,?,?,?,?,?)";
		
		String query = "insert into member(memId, memPw, memPhone, memEmail, memRegion, memCity, memPwHint, memPwAns)"
				+ " values(?,?,?,?,?,?,?,?)";
		
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memId);
				ps.setString(2, memPw);
				//ps.setString(3, memName);
				ps.setString(3, memEmail);
				ps.setString(4, memPhone);
				ps.setString(5, memCity);
				ps.setString(6, memRegion);
				ps.setInt(7, memPwHint);
				ps.setString(8, memPwAns);
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
	
	
	
	// 아이디 찾기
	public MemberVO searchId(String memEmail, String memPhone) {
		MemberVO mVo = null;
		String query = "select * from member where memEmail='"+ memEmail +"' and memPhone='"+ memPhone +"'";
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
