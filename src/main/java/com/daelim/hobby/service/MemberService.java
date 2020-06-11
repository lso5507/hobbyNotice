package com.daelim.hobby.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daelim.hobby.dao.MemberDAO;
import com.daelim.hobby.vo.MemberVO;

@Service	
public class MemberService {
	
	@Autowired
	public MemberDAO mDao;
	public MemberVO mVo;
	
	
	// 회원가입
	public void mCreateAccount(MemberVO mVo) { // 로그인 view에서 입력한 값을 MemberVo 객체로 가져와 사용한다
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemPhone(), mVo.getMemEmail(),  
				mVo.getMemRegion(), mVo.getMemCity(), mVo.getMemBirth(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	// 아이디 중복검사
	public MemberVO mIdCheck(HttpServletRequest request) {
		String memId = request.getParameter("memId"); // memId : 회원가입 창에서 입력한 아이디
		mVo = mDao.checkId(memId);
		return mVo;
	}
	
	
	
	// 로그인
	public MemberVO mLogin(MemberVO mVo, HttpServletRequest request) {
		mVo = mDao.login(mVo.getMemId(), mVo.getMemPw());
		
		if(mVo != null) { // 검색 성공 시
			HttpSession session = request.getSession(); // 로그인 -> 세션 만듬			
			session.setAttribute("mVo", mVo); // 세션에 mVo 추가
			
			session.setAttribute("memId", mVo.getMemId()); // 세션에 아이디 추가
			session.setAttribute("memPw", mVo.getMemPw()); // 세션에 비밀번호 추가
			System.out.println("세션 아이디: " + (String) session.getAttribute("memId"));
			System.out.println("세션 비밀번호: " + (String) session.getAttribute("memPw"));
			
			return mVo;
		}
		
		return null;
	}
	
	
	// 아이디 찾기 (이름, 이메일)
	public MemberVO mIdSearch(MemberVO mVo) {
		String memName = mVo.getMemName();
		String memEmail = mVo.getMemEmail();
		
		mVo = mDao.searchId(memName, memEmail);
		return mVo;
	}
	
	
	// 비밀번호 찾기
	public MemberVO mPwSearch(MemberVO mVo) {
		String memId = mVo.getMemId();
		int memPwHint = mVo.getMemPwHint();
		String memPwAns = mVo.getMemPwAns();
		
		mVo = mDao.searchPw(memId, memPwHint, memPwAns);
		return mVo;
	}
	
	
	// 회원 정보 수정
	public void mMemberModify(MemberVO mVo, HttpSession session) {
		String memPhone = mVo.getMemPhone();
		String memEmail = mVo.getMemEmail();
		String memRegion = mVo.getMemRegion();
		String memCity = mVo.getMemCity();
		String memBirth = mVo.getMemBirth();
		
		// 로그인할때  세션에 mId를 설정했음. getAttribute를 해서 mId를 가져온다\
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		mDao.memberModify(memId, memPhone, memEmail, memRegion, memCity, memBirth);
		
		// 수정된 mVo를 다시 세션에 저장
		mVo = mDao.login((String)session.getAttribute("memId"), (String)session.getAttribute("memPw"));
		session.setAttribute("mVo", mVo); // 세션에 mVo 추가
	}
	
	
	// 비밀번호 변경
	public void mMemberPwModify(MemberVO mVo, HttpSession session) {
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		String memPw = mVo.getMemPw();
		System.out.println("변경 비밀번호: " + memPw);
		
		mDao.memberPwModify(memId, memPw);
		
		// 수정된 mVo를 다시 세션에 저장
		session.setAttribute("memPw", mVo.getMemPw()); // 세션에 변경된 비밀번호 갱신
		mVo = mDao.login((String)session.getAttribute("memId"), (String)session.getAttribute("memPw"));
		session.setAttribute("mVo", mVo); // 세션에 mVo 추가
	}
	
	
	
	
	// 회원 탈퇴
	public void mMemberDelete(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		System.out.println("세션 아이디(삭제할 아이디): " + memId);
		mDao.memberDelete(memId);
	}
	
	
	// 멤버 리스트
//	public void mList(Model model) {
//		ArrayList<MemberVO> dtos = mDao.list();
//		model.addAttribute("list", dtos);
//	}

}

