package com.daelim.hobby.Vo;


import java.sql.Timestamp;



// 보드 VO
public class VOBoard {
	private int bdCno;
	private String bdName;
	private String bdTitle;
	private String bdContent;
	private int bdHit;
	private int bdLike;
	private Timestamp bdDate;
	private String bdCategory;
	private int dno;
	public int getBdCno() {
		return bdCno;
	}
	public void setBdCno(int bdCno) {
		this.bdCno = bdCno;
	}
	public String getBdName() {
		return bdName;
	}
	public void setBdName(String bdName) {
		this.bdName = bdName;
	}
	public String getBdTitle() {
		return bdTitle;
	}
	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}
	public String getBdContent() {
		return bdContent;
	}
	public void setBdContent(String bdContent) {
		this.bdContent = bdContent;
	}
	public int getBdHit() {
		return bdHit;
	}
	public void setBdHit(int bdHit) {
		this.bdHit = bdHit;
	}
	public Timestamp getBdDate() {
		return bdDate;
	}
	public void setBdDate(Timestamp bdDate) {
		this.bdDate = bdDate;
	}
	public String getBdCategory() {
		return bdCategory;
	}
	public void setBdCategory(String bdCategory) {
		this.bdCategory = bdCategory;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public int getBdLike() {
		return bdLike;
	}
	public void setBdLike(int bdLike) {
		this.bdLike = bdLike;
	}

//	private memberDao member;
	

}
