package com.dalim.hobby.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dalim.hobby.dao.MemberDAO;
import com.dalim.hobby.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	public MemberDAO mDao;
	public MemberVO mVo;
	
	
	// 회원가입
	public void mCreateAccount(MemberVO mVo) {
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemEmail(), mVo.getMemPhone(), 
				mVo.getMemRegion(), mVo.getMemCity(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	// 아이디 중복검사
	public void mIdCheck(HttpServletRequest request, Model model) {
		String memId = request.getParameter("memId");
		
		mVo = mDao.checkId(memId);
		if(mVo == null) {
			model.addAttribute("ok", "ok");
		}
		
	}
	
	
	
	// 로그인
	public void mLogin(MemberVO mVo, HttpServletRequest request, Model model) {
		mVo = mDao.login(mVo.getMemId(), mVo.getMemPw());
		
		if(mVo != null) {
			model.addAttribute("ok", "ok");
			
			HttpSession session = request.getSession(); // 로그인 -> 세션 만듬
			session.setAttribute("mVo", mVo); 
			
			session.setAttribute("memId", mVo.getMemId());
			session.setAttribute("memPw", mVo.getMemPw());
			
			String myid = (String) session.getAttribute("memId");
			String mypwd = (String) session.getAttribute("memPw");
			System.out.println("세션 아이디: " + myid);
			System.out.println("세션 비밀번호: " + mypwd);
		}
	}
	
	
	
	// 아이디 찾기
	public void mIdSearch(MemberVO mVo, Model model) {
		String memEmail = mVo.getMemEmail();
		String memPhone = mVo.getMemPhone();
		
		mVo = mDao.searchId(memEmail, memPhone);
		
		if(mVo != null) {
			System.out.println("아이디 검색 성공 : " + mVo.getMemId());
			model.addAttribute("mVo", mVo);
		}
	}
	
	
	// 비밀번호 찾기
	public void mPwSearch(MemberVO mVo, Model model) {
		String memId = mVo.getMemId();
		int memPwHint = mVo.getMemPwHint();
		String memPwAns = mVo.getMemPwAns();
		
		mVo = mDao.searchPw(memId, memPwHint, memPwAns);
		
		if(mVo != null) {
			System.out.println("비밀번호 검색 성공 : " + mVo.getMemPw());
			model.addAttribute("mVo", mVo);
		}
		
	}
	
	
	
	// 회원 정보 수정
	public void mMemberModify(MemberVO mVo, HttpSession session) {
		
		
		String memPhone = mVo.getMemPhone();
		String memEmail = mVo.getMemEmail();
		String memRegion = mVo.getMemRegion();
		String memCity = mVo.getMemCity();
		
		// 로그인할때  세션에 mId를 설정했음. getAttribute를 해서 mId를 가져온다면 -> 로그인 된 상태
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		mDao.memberModify(memId, memPhone, memEmail, memRegion, memCity);
	}
	
	
	// 회원 탈퇴
	public void mMemberDelete(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		System.out.println("세션 아이디(삭제할 아이디): " + memId);
		mDao.memberDelete(memId);
	}
	
	
	// 멤버 리스트
	public void mList(Model model) {
		ArrayList<MemberVO> dtos = mDao.list();
		model.addAttribute("list", dtos);
	}
	
}

