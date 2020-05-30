package com.dalim.hobby.vo;

import java.sql.Timestamp;


public class MemberVO {

	int mCnt;
	String memId;
	String memPw;
	String memName;
	String memEmail;
	Timestamp memRegDate;
	String memPhone;
	String memRegion; // 거주 도
	String memCity; // 거주 시
	int memPwHint; // 0:어릴때 별명, 1: 가장 친한 친구
	String memPwAns; 
	
	public MemberVO() {}
	public MemberVO(int mCnt, String memId, String memPw, String memEmail, Timestamp memRegDate, String memPhone, 
			String memCity, String memRegion, int memPwHint, String memPwAns) {
		this.mCnt = mCnt;
		this.memId = memId;
		this.memEmail = memEmail;
		this.memRegDate = memRegDate;
		this.memPhone = memPhone;
		this.memCity = memCity;
		this.memRegion = memRegion;
		this.memPwHint = memPwHint;
		this.memPwAns = memPwAns;
	}
	
	
	public int getmCnt() {
		return mCnt;
	}
	public void setmCnt(int mCnt) {
		this.mCnt = mCnt;
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
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public Timestamp getMemRegDate() {
		return memRegDate;
	}
	public void setMemRegDate(Timestamp memRegDate) {
		this.memRegDate = memRegDate;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemCity() {
		return memCity;
	}
	public void setMemCity(String memCity) {
		this.memCity = memCity;
	}
	public String getMemRegion() {
		return memRegion;
	}
	public void setMemRegion(String memRegion) {
		this.memRegion = memRegion;
	}
	public int getMemPwHint() {
		return memPwHint;
	}
	public void setMemPwHint(int memPwHint) {
		this.memPwHint = memPwHint;
	}
	public String getMemPwAns() {
		return memPwAns;
	}
	public void setMemPwAns(String memPwAns) {
		this.memPwAns = memPwAns;
	}
	
	
	
} // end of MDto

