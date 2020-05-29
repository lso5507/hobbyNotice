package com.daelim.hobby.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daelim.hobby.Service.MemberService;
import com.daelim.hobby.vo.MemberVO;



@Controller
public class MemberController {
		
	@Autowired
	public MemberService mService;

	
	// 회원가입
	@RequestMapping("/Login_SignUp") // create_account_view 
	public String create_account_view(Model model) {
		return "/member/Login_SignUp";
	}
	@RequestMapping("/create_account")
	public String create_account(MemberVO mVo) {
		mService.mCreateAccount(mVo);
		return "/member/Login"; // /member/login_page
	}
	
	
	
	
	
	
	
	
	
/*	
	
	
	// 아이디 중복검사
	@RequestMapping("/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		mService.mIdCheckCommand(model);
		
		if(model.containsAttribute("dto")) {
			System.out.println("사용 가능한 아이디 입니다.");
			model.addAttribute("msg", "사용 가능한 아이디 입니다.");
		}
		else {
			System.out.println("사용할수 없는 아이디 입니다.");
			model.addAttribute("msg", "사용할수 없는 아이디 입니다.");
		}
		
		return "member/create_account_view";
	}
	
	
	// 로그인
	@RequestMapping("/login_page")
	public String login_view() {
		return "/member/login_page";
	}
	@RequestMapping("/login")
	public String login(MemberVO dto, HttpServletRequest request, Model model) {
		mService.mLoginCommand(dto, request, model);
		
		if(!model.containsAttribute("dto")) {
			model.addAttribute("msg", "아이디, 비밀번호가 틀립니다.");
			model.addAttribute("url", "member/login_page.jsp");
			return "/member/login_page";
		}
		return "/member/login_view";
	}
	
	
	// 멤버 리스트
	@RequestMapping("/mList")
	public String list(Model model) {
		mService.mListCommand(model);
		return "/member/list";
	}
	
	
	// 아이디 찾기
	@RequestMapping("/idSearch_page")
	public String idSearch_page() {
		return "/member/idSearch_page";
	}
	@RequestMapping("/idSearch")
	public String idSearch(MemberVO dto, Model model) {	
		mService.MIdSearchCommand(dto, model);
		return "/member/idSearch_page";
	}
	
	
	// 회원 정보 수정  (정보수정 하고 Home으로 리다이렉트 시키는데 수정된 정보로 바뀌지 않음)
	@RequestMapping("/member_modify_page")
	public String member_modify_page() {	
		return "/member/member_modify_page";
	}
	@RequestMapping("/member_modify")
	public String member_modify(MemberVO dto, HttpSession session) {
		mService.mMemberModifyCommand(dto, session);
		return "redirect:Home";
	}
	
	
	// 홈페이지
	@RequestMapping("/Home")
	public String Home(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		if(session.getAttribute("mId") == null) { // 처음 만들어진 세션이면 -> 로그인 상태가 아니면 (세션에 바인딩된 id가 없음) -> 로그인 페이지로 보낸다
			System.out.println("로그인부터 하세요!");
			return "member/login_page";
		}
		
		System.out.println("세션 아이디: " + session.getAttribute("mId"));
		return "member/login_view"; // 로그인이 되어있는 상태이면 로그인뷰를 보여준다
	}
	
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		System.out.println("logout()");
		session = request.getSession();
		if(session.isNew()) {
			System.out.println("처음 만들어진 세션입니다.");
		}else {
			System.out.println("로그인된 아이디: " + session.getAttribute("mId"));
			session.invalidate();
			System.out.println("세션을 삭제합니다");
		}
		
		return "/member/login_page";
	}
	
	
	// 회원 탈퇴
	@RequestMapping("/mDelete")
	public String mDelete(HttpSession session) {
		mService.mMemberDelete(session);
		return "/member/login_page";
	}
	

*/

	
} // end of MController
