package com.daelim.hobby.Vo;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;



public class VOComment {
	private String comm_name;
	private Timestamp comm_regDate;
	private int dno;
	private String comm_content;
	private int comm_cno;
	public String getComm_name() {
		return comm_name;
	}
	public void setComm_name(String comm_name) {
		this.comm_name = comm_name;
	}
	public Timestamp getComm_regDate() {
		return comm_regDate;
	}
	public void setComm_regDate(Timestamp timestamp) {
		this.comm_regDate = timestamp;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public int getComm_cno() {
		return comm_cno;
	}
	public void setComm_cno(int comm_cno) {
		this.comm_cno = comm_cno;
	}
	


}
