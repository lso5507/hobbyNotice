package com.daelim.hobby.Vo;

public class VOMember {
	private String memId;
	private String memPw;
	private String memMail;

	public VOMember(String id,String pwd, String mail){
		this.memId=id;
		this.memPw=pwd;
		this.memMail=mail;
		
	}
	public VOMember() {
		
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	@Override
	public String toString() {
		return "VOMember [memId=" + memId + ", memPw=" + memPw + ", memMail=" + memMail + "]";
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	
	
}
