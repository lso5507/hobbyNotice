package com.daelim.hobby;

import java.beans.PropertyVetoException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.daelim.hobby.Vo.VOBoard;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class dbTest {

	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://61.84.24.83:3306/hobby33?useSSL=false&serverTimezone=UTC";
	private static String userid = "hobby33";
	private static String userpw = "hobby33!!";
	 
		@Test
		public void testConnection() throws Exception{
			
			ComboPooledDataSource dataSource = new ComboPooledDataSource();
			
			dataSource.setDriverClass(driver);
			dataSource.setJdbcUrl(url);
			dataSource.setUser(userid);
			dataSource.setPassword(userpw);//try_
			JdbcTemplate template;
			
			template = new JdbcTemplate();
			template.setDataSource(dataSource);
			System.out.println("Success");
			
			final String sql = "select * from board";
			//select m.*,count(C.dno) from mainboard as m LEFT join `comment` as c  ON  m.count=c.dno
			List<VOBoard> boards = null;
			 boards = template.query(sql, new Object[]{}, new RowMapper<VOBoard>() {

				@Override
				public VOBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
					VOBoard board = new VOBoard();
					board.setBdName(rs.getString("bdName"));
					board.setBdTitle(rs.getString("bdTitle"));
					board.setBdContent(rs.getString("bdContent"));
					board.setBdHit(rs.getInt("bdHit"));
					board.setBdDate(rs.getTimestamp("bdDate"));
					board.setBdCno(rs.getInt("bdCno"));
					
					
					return board;
					
				}
				
			});
			
		}//testConnection_
	}//MySQLConnectionTest_

