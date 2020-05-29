package com.lee.notice.dao;

import java.beans.PropertyVetoException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.lee.notice.VO.VOMember;
import com.mchange.v2.c3p0.ComboPooledDataSource;





@Repository
public class memberDao {
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/lsw?useSSL=false&serverTimezone=UTC";
	private String userid = "root";
	private String userpw = "1111";
	private ComboPooledDataSource dataSource;
	
	private JdbcTemplate template;
	public memberDao() {  //ComboPool을 이용하여 DB접근 
		dataSource = new ComboPooledDataSource();
		try {
			dataSource.setDriverClass(driver);
			dataSource.setJdbcUrl(url);
			dataSource.setUser(userid);
			dataSource.setPassword(userpw);
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		
		template = new JdbcTemplate();
		template.setDataSource(dataSource);
	}
	
	public int memberInsert(final VOMember member) {
		int result = 0;
		
		final String sql = "INSERT INTO member_ (memId, memPw,memMail) values (?,?,?)";
		
		result = template.update(sql,member.getMemId(),member.getMemPw(),member.getMemMail());

		return result;
		
	}
//	public VOMember memberUpdate(String keyword,String str) {//매개변수로 세션 접속중인 멤버 접근하여 UPDATE
//		int result = 0;
//      //
//		
////		VOMember member = (VOMember) session.getAttribute("member");
//		System.out.println(member.getMemId());
//		if(str.equals("ID")) {
//			final String sql = "UPDATE member_ SET memId = ? WHERE memId = ?";
//			result = template.update(sql,keyword,member.getMemId());
//			member.setMemId(keyword);
//		}
//		
//		else if(str.equals("PW")) {
//			final String sql = "UPDATE member_ SET memPw = ? WHERE memId = ?";
//			result = template.update(sql,keyword,member.getMemId());
//			member.setMemPw(keyword);
//		}
//		
//		return member;
//		
//		
//		
//		
//		
//	}

	public int memberRemove(VOMember member) {
		int result = 0;
		
		final String sql = "DELETE from member_ WHERE memId = ? AND memPw=?";
		result = template.update(sql,member.getMemId(),member.getMemPw());
		
		
		return result;
		
	}
	public VOMember memberSelect(VOMember member) {
		List<VOMember> members = null;
		
		final String sql = "SELECT * FROM member_ WHERE memId = ? AND memPw = ? ";
		
		members = template.query(sql, new Object[]{member.getMemId(), member.getMemPw()}, new RowMapper<VOMember>() {

			@Override
			public VOMember mapRow(ResultSet rs, int rowNum) throws SQLException {
				VOMember mem = new VOMember();
				mem.setMemId(rs.getString("memId"));
				mem.setMemPw(rs.getString("memPw"));
				mem.setMemMail(rs.getString("memMail"));
				
				
				
				
				return mem;
			}
			
		});
		
		if(members.isEmpty()) {
			System.out.println("member is null");
			return null;
		}
		return members.get(0);
		
	}

}
