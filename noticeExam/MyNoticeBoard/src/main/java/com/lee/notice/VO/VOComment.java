package com.lee.notice.VO;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import com.lee.notice.dao.memberDao;

public class VOComment {
	private String name;
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	private Date date;
	private int dno;
	private String content;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	


}
