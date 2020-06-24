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
	public void setTemplate(JdbcTemplate template) { // JdbcTemplate �� ����ϱ� ���� ����
		this.template = template;
	}
	

	
	// ȸ������
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
		
	
	// ���̵� �ߺ� Ȯ��
	public MemberVO checkId(String memId) {
		MemberVO mVo = null;
		System.out.println("���̵�: " + memId);
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
	
	
	// �α���
	public MemberVO login(String memId, String memPw) {
		
		MemberVO mVo = null;
		String query = "select * from member where memId='" + memId + "' and memPw='" + memPw + "'";

		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("�α��� ����");
			return null;
		}
		return mVo;
	}
	
	
	
	// ���̵� ã�� (�̸�, �̸��Ϸ� ã��)
	public MemberVO searchId(String memName, String memEmail) {
		MemberVO mVo = null;
		String query = "select * from member where memName='"+ memName +"' and memEmail='"+ memEmail +"'";
		System.out.println(query);
		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("�˻��� ���̵� �����ϴ�.");
			return null;
		}
		
		return mVo;
	}
	
	
	
	// ��й�ȣ ã��
	public MemberVO searchPw(String memId, int memPwHint, String memPwAns) {
		MemberVO mVo = null;
		String query = "select * from member where memId='"+ memId +"' and memPwHint="+ memPwHint +" and memPwAns='"+ memPwAns +"'";
		System.out.println(query);
		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("��й�ȣ�� �����ϴ�.");
			return null;
		}
		
		return mVo;
	}
	
	
	
	// ȸ�� ���� ����
	public void memberModify(final String memId, final String memPhone, final String memEmail, final String memRegion, final String memCity, final String memBirth) {
		String query = "update member set memPhone=?, memEmail=?, memRegion=?, memCity=?, memBirth=? where memId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memPhone);
				ps.setString(2, memEmail);
				ps.setString(3, memRegion);
				ps.setString(4, memCity);
				ps.setString(5, memBirth);
				ps.setString(6, memId);
			}
		});
	}
	
	
	// ��й�ȣ ����
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
	
	
	
	
	// ȸ�� Ż��
	public void memberDelete(final String memId) {
		String query = "delete from member where memId=?";
		template.update(query, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, memId);
			}
		});
	}
	
	
	// ����Ʈ
	public ArrayList<MemberVO> list(){
		String query = "select * from member order by memRegDate desc";
		return (ArrayList<MemberVO>) template.query(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));
	}



	public MemberVO verify_like(MemberVO member) {   //추천 중복확인
		MemberVO mVo = null;
		String query = "select memLikey from member where memId='" + member.getMemId() + "'";

		try {
			mVo = template.queryForObject(query, new BeanPropertyRowMapper<MemberVO>(MemberVO.class));	
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Select Fail");
			return null;
		}
		System.out.println(mVo.getMemLikey());
		return mVo;
		
	}



	public int memberLikey(MemberVO member) {
		int result = 0;
		final String sql = "UPDATE member SET memLikey=? where memId=?";
		System.out.println(sql);
		 result = template.update(sql,member.getMemLikey(),member.getMemId());
		return result;

		
		
	}
	
	
} // end of MDao
