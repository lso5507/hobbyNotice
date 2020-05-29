package com.daelim.hobby.Service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.daelim.hobby.vo.MemberVO;
import com.dalim.hobby.dao.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	public MemberDAO mDao;
	public MemberVO mVo;
	
	
	// 회원가입
	public void mCreateAccount(MemberVO dto) {
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemEmail(), mVo.getMemPhone(), 
				mVo.getMemCity(), mVo.getMemRegion(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	
	
	
	
	
	
/*	
	
	// 아이디 중복검사
	public void mIdCheckCommand(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = request.getParameter("mId");
		
		dto = dao.checkId(mId);
		
		if(dto == null) {
			model.addAttribute("dto", "ok");
		}
	}
	
	
	// 로그인
	public void mLoginCommand(MemberVO dto, HttpServletRequest request, Model model) {
		dto = dao.login(dto.getmId(), dto.getmPwd());
		
		if(dto != null) {
			model.addAttribute("dto", dto);
			
			HttpSession session = request.getSession(); // 로그인 -> 세션 만듬
			session.setAttribute("dto2", dto); 
			
			session.setAttribute("mId", dto.getmId());
			session.setAttribute("mPwd", dto.getmPwd());
			session.setAttribute("mName", dto.getmName());
			
			String myid = (String) session.getAttribute("mId");
			String mypwd = (String) session.getAttribute("mPwd");
			System.out.println("세션 아이디: " + myid);
			System.out.println("세션 비밀번호: " + mypwd);
		}
	}
	
	
	// 멤버 리스트
	public void mListCommand(Model model) {
		ArrayList<MemberVO> dtos = dao.list();
		model.addAttribute("list", dtos);
	}
	
	
	// 아이디 찾기
	public void MIdSearchCommand(MemberVO dto, Model model) {
		String mName = dto.getmName();
		String mEmail = dto.getmEmail();
		String mBirth = dto.getmBirth();
		
		dto = dao.searchId(mName, mEmail, mBirth);
		
		if(dto != null) {
			System.out.println("아이디 검색 성공.");
			model.addAttribute("dto", dto);
		}
	}

	
	// 회원 정보 수정
	public void mMemberModifyCommand(MemberVO dto, HttpSession session) {
		
		String mName = dto.getmName();
		String mMobile = dto.getmMobile();
		String mEmail = dto.getmEmail();
		String mRegion = dto.getmRegion();
		String mBirth = dto.getmBirth();
		
		// 로그인할때  세션에 mId를 설정했음. getAttribute를 해서 mId를 가져온다면 -> 로그인 된 상태
		String mId = (String) session.getAttribute("mId");
		System.out.println("session.getAttribute mId : " + mId);
		
		dao.memberModify(mId, mName, mMobile, mEmail, mRegion, mBirth);
	}
	
	
	// 회원 탈퇴
	public void mMemberDelete(HttpSession session) {
		String mId = (String)session.getAttribute("mId");
		System.out.println("세션 아이디(삭제할 아이디): " + mId);
		dao.memberDelete(mId);
	}
	
	
	

*/

	
}

