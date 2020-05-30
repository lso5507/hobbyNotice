package com.daelim.hobby.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daelim.hobby.service.MemberService;
import com.daelim.hobby.vo.MemberVO;


@Controller
public class MemberController { 
	
	@Autowired
	public MemberService mService;
	
	@RequestMapping("/test2")
	public String test() {
		System.out.println("test()");
		return "/test";
	}
	
	
	// ȸ������
	@RequestMapping("/create_account_view") 
	public String create_account_view(Model model) {
		return "/member/create_account_view";
	}
	@RequestMapping("/create_account")
	public String create_account(MemberVO mVo) {
		mService.mCreateAccount(mVo);
		return "/member/login_page";
	}
	
	
	// ���̵� �ߺ��˻�
	@RequestMapping("/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {
		mService.mIdCheck(request, model);
		
		if(model.containsAttribute("ok")) { 
			System.out.println("��� ������ ���̵� �Դϴ�.");
			model.addAttribute("msg", "��� ������ ���̵� �Դϴ�.");
		}
		else {
			System.out.println("����Ҽ� ���� ���̵� �Դϴ�.");
			model.addAttribute("msg", "����Ҽ� ���� ���̵� �Դϴ�.");
		}
		
		return "member/create_account_view";
	}
	
	
	// �α���
	@RequestMapping("/login_page")
	public String login_view() {
		return "/member/login_page";
	}
	@RequestMapping("/login")
	public String login(MemberVO mVo, HttpServletRequest request, Model model) {
		mService.mLogin(mVo, request, model);
		
		if(!model.containsAttribute("ok")) {
			model.addAttribute("msg", "���̵�, ��й�ȣ�� Ʋ���ϴ�.");
			model.addAttribute("url", "member/login_page.jsp");
			return "/member/login_page";
		}
		return "/member/Login_MyInfo";
	}
	
	
	// ���̵� ã��
	@RequestMapping("/idSearch_page")
	public String idSearch_page() {
		return "/member/idSearch_page";
	}
	@RequestMapping("/idSearch")
	public String idSearch(MemberVO mVo, Model model) {
		mService.mIdSearch(mVo, model);
		return "/member/idSearch_page";
	}
	
	
	// ��й�ȣ ã��
	@RequestMapping("/Login_FindPW")
	public String Login_FindPW() {
		return "/member/Login_FindPW";
	}
	@RequestMapping("/pwSearch")
	public String pwSearch(MemberVO mVo, Model model) {
		mService.mPwSearch(mVo, model);
		return "/member/Login_FindPW";
	}
	
	
	// �� ����
	@RequestMapping("/Login_MyInfo")
	public String Login_MyInfo() {
		return "/member/Login_MyInfo";
	}
	
	
	// ȸ�� ���� ����
	@RequestMapping("/Login_MyInfo_MyInfoChange")
	public String member_modify_page() {	
		return "/member/Login_MyInfo_MyInfoChange";
	}
	@RequestMapping("/member_modify")
	public String member_modify(MemberVO mVo, HttpSession session) {
		mService.mMemberModify(mVo, session);
		return "redirect:Login_MyInfo";
	}
	
	
	// �α׾ƿ� (���� ����)
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		System.out.println("logout()");
		session = request.getSession();
		if(session.isNew()) {
			System.out.println("ó�� ������� �����Դϴ�.");
		}else {
			System.out.println("�α��ε� ���̵�: " + session.getAttribute("mId"));
			session.invalidate();
			System.out.println("������ �����մϴ�");
		}
		
		return "/member/login_page";
	}
	
	
	// ȸ�� Ż��
	@RequestMapping("/mDelete")
	public String mDelete(HttpSession session) {
		mService.mMemberDelete(session);
		session.invalidate();
		return "/member/login_page";
	}
	
	
	
	// ��� ����Ʈ (������ ȸ�� ���)
	@RequestMapping("/mList")
	public String list(Model model) {
		mService.mList(model);
		return "/member/list";
	}
	
	
	
/*	
	// Ȩ������
	@RequestMapping("/Home")
	public String Home(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		if(session.getAttribute("mId") == null) { // ó�� ������� �����̸� -> �α��� ���°� �ƴϸ� (���ǿ� ���ε��� id�� ����) -> �α��� �������� ������
			System.out.println("�α��κ��� �ϼ���!");
			return "member/login_page";
		}
		
		System.out.println("���� ���̵�: " + session.getAttribute("mId"));
		return "member/login_view"; // �α����� �Ǿ��ִ� �����̸� �α��κ並 �����ش�
	}
*/
	
} // end of MController
