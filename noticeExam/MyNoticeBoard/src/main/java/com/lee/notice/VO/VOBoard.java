package com.lee.notice.VO;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import com.lee.notice.dao.memberDao;

public class VOBoard {

	private int count;
	private String name;
	private String title;
	private String content;
	private int hit;
	private Date date;
	private String category;
	private int dno;
//	private memberDao member;
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public VOBoard() {
		
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "VOBoard [count=" + count + ", name=" + name + ", title=" + title + ", content=" + content + ", hit="
				+ hit + ", date=" + date + "]";
	}

}
