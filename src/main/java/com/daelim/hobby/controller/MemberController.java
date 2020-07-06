package com.daelim.hobby.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daelim.hobby.Service.MemberService;
import com.daelim.hobby.Vo.MemberVO;


@Controller
public class MemberController {

	@Autowired
	public MemberService mService;
	MemberVO mVo;
	
	// 메인 페이지
	@RequestMapping("/")
	public String home(Model model) {
		return "main";
	}
	
	@RequestMapping("/search")
	public String search(Model model) {
		return "main_search_results.part";
	}
	
	// 회원가입
	@RequestMapping("/create_account_view")
	public String create_account_view(Model model) {
		return "/member/create_account_view.part";
	}
	@RequestMapping("/create_account")
	public String create_account(MemberVO mVo) {
		System.out.println("create_account()");

		mService.mCreateAccount(mVo);
		return "/member/login_page.part";
	}


	// 아이디 중복 확인
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request, Model model) {
		mVo = mService.mIdCheck(request);
		if(mVo == null) {
			return "1";
		}else {
			return "0";
		}
	}


	// 로그인
	@RequestMapping("/login_page")
	public String login_view() {
		return "/member/login_page.part";
	}
	@RequestMapping("/login")
	public String login(MemberVO mVo, HttpServletRequest request, Model model) {
		mVo = mService.mLogin(mVo, request);
		if(mVo == null) { // 검색 실패
			model.addAttribute("msg", "아이디, 비밀번호가 틀립니다.");
			model.addAttribute("url", "member/login_page.jsp");
			return "/member/login_page.part";
		}else {
			return "redirect:/";
		}
		
	}
	
	

	// 아이디 찾기
	@RequestMapping("/idSearch_page")
	public String idSearch_page() {
		return "/member/idSearch_page.part";
	}
	
	@RequestMapping(value="/idSearch", method=RequestMethod.GET, produces ="application/text; charset=utf-8")
	@ResponseBody
	public String idSearch(MemberVO mVo, Model model) {
		System.out.println("idSearch()");
		mVo = mService.mIdSearch(mVo);
		if(mVo != null) {
			System.out.println("아이디 : " + mVo.getMemId());
			return mVo.getMemId();
		}
		
		return null;
	}


	// 비밀번호 찾기
	@RequestMapping("/pwSearch_page")
	public String pwSearch_page() {
		return "/member/pwSearch_page.part";
	}
	
	@RequestMapping("/pwSearch")
	@ResponseBody
	public String pwSearch(MemberVO mVo, Model model) {
		mVo = mService.mPwSearch(mVo);
		
		if(mVo != null) {
			System.out.println("비밀번호 : " + mVo.getMemPw());
			return mVo.getMemPw();
		}

		return null;
	}


	// 내 정보 페이지
	@RequestMapping("/myInfo_page")
	public String Login_MyInfo() {
		return "/member/myInfo_page.part";
	}


	// 회원정보 수정(휴대폰, 이메일, 주소, 생일)
	@RequestMapping("/myInfo_modify_page")
	public String member_modify_page() {
		return "/member/myInfo_modify_page.part";
	}
	@RequestMapping("/member_modify")
	public String member_modify(MemberVO mVo, HttpSession session) {
		mService.mMemberModify(mVo, session);
		return "redirect:myInfo_page.part";
	}
	
	// 비밀번호 변경
	@RequestMapping("myPw_modify_page")
	public String myPw_modify_page() {
		return "/member/myPw_modify_page.part";
	}
	@RequestMapping("/memberPw_modify")
	public String memberPw_modify(MemberVO mVo, HttpSession session) {
		mService.mMemberPwModify(mVo, session);
		return "redirect:myInfo_page.part";
	}


	// 로그아웃 (세션 삭제)
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession(); // 세션을 가져옴. (없으면 새로 만든다)
		if(session.isNew()) { // 처음 만들어진 세션이면 (로그인된 상태가 아닌거임)
			System.out.println("처음 만들어진 세션입니다.");
		}else {
			System.out.println("로그인된 아이디: " + session.getAttribute("mId"));
			session.invalidate(); // 세션 삭제
			System.out.println("세션을 삭제합니다");
		}
		return "redirect:/";
	}


	// 회원탈퇴
	@RequestMapping("/mDelete")
	public String mDelete(HttpSession session) {
		mService.mMemberDelete(session);
		session.invalidate(); // 세션 삭제
		return "redirect:/";
	}


	/*
	// 멤버 리스트
	@RequestMapping("/mList")
	public String list(Model model) {
		mService.mList(model);
		return "/member/list";
	}
	*/

} // end of MController
