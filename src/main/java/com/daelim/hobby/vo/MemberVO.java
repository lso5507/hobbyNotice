package com.daelim.hobby.vo;

import java.sql.Timestamp;


public class MemberVO {
	
	int mCnt; // 회원 번호
	String memId; // 아이디
	String memPw; // 비번
	String memName; // 이름
	String memPhone; // 연락처
	String memEmail; // 이메일
	String memRegion; // 도
	String memCity; // 시
	String memBirth; // 생년월일 (6자리)
	int memPwHint; // 0.어릴때 별명, 1.가장 친한친구 이름
	String memPwAns; // 비밀번호 답변
	Timestamp memRegDate; // 가입일
	
	public MemberVO() {}
	public MemberVO(int mCnt, String memId, String memPw, String memName, String memPhone, String memEmail,   
			String memRegion, String memCity, int memPwHint, String memPwAns, String memBirth, Timestamp memRegDate) {
		this.mCnt = mCnt;
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memRegion = memRegion;
		this.memCity = memCity;
		this.memBirth = memBirth;
		this.memPwHint = memPwHint;
		this.memPwAns = memPwAns;
		this.memRegDate = memRegDate;
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
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemRegion() {
		return memRegion;
	}
	public void setMemRegion(String memRegion) {
		this.memRegion = memRegion;
	}
	public String getMemCity() {
		return memCity;
	}
	public void setMemCity(String memCity) {
		this.memCity = memCity;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
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
	public Timestamp getMemRegDate() {
		return memRegDate;
	}
	public void setMemRegDate(Timestamp memRegDate) {
		this.memRegDate = memRegDate;
	}
	
	
} // end of MDto

