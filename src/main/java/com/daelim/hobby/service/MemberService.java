package com.daelim.hobby.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.daelim.hobby.dao.MemberDAO;
import com.daelim.hobby.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	public MemberDAO mDao;
	public MemberVO mVo;
	
	
	// ȸ������
	public void mCreateAccount(MemberVO mVo) {
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemEmail(), mVo.getMemPhone(), 
				mVo.getMemRegion(), mVo.getMemCity(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	// ���̵� �ߺ��˻�
	public void mIdCheck(HttpServletRequest request, Model model) {
		String memId = request.getParameter("memId");
		
		mVo = mDao.checkId(memId);
		if(mVo == null) {
			model.addAttribute("ok", "ok");
		}
		
	}
	
	
	
	// �α���
	public void mLogin(MemberVO mVo, HttpServletRequest request, Model model) {
		mVo = mDao.login(mVo.getMemId(), mVo.getMemPw());
		
		if(mVo != null) {
			model.addAttribute("ok", "ok");
			
			HttpSession session = request.getSession(); // �α��� -> ���� ����
			session.setAttribute("mVo", mVo); 
			
			session.setAttribute("memId", mVo.getMemId());
			session.setAttribute("memPw", mVo.getMemPw());
			
			String myid = (String) session.getAttribute("memId");
			String mypwd = (String) session.getAttribute("memPw");
			System.out.println("���� ���̵�: " + myid);
			System.out.println("���� ��й�ȣ: " + mypwd);
		}
	}
	
	
	
	// ���̵� ã��
	public void mIdSearch(MemberVO mVo, Model model) {
		String memEmail = mVo.getMemEmail();
		String memPhone = mVo.getMemPhone();
		
		mVo = mDao.searchId(memEmail, memPhone);
		
		if(mVo != null) {
			System.out.println("���̵� �˻� ���� : " + mVo.getMemId());
			model.addAttribute("mVo", mVo);
		}
	}
	
	
	// ��й�ȣ ã��
	public void mPwSearch(MemberVO mVo, Model model) {
		String memId = mVo.getMemId();
		int memPwHint = mVo.getMemPwHint();
		String memPwAns = mVo.getMemPwAns();
		
		mVo = mDao.searchPw(memId, memPwHint, memPwAns);
		
		if(mVo != null) {
			System.out.println("��й�ȣ �˻� ���� : " + mVo.getMemPw());
			model.addAttribute("mVo", mVo);
		}
		
	}
	
	
	
	// ȸ�� ���� ����
	public void mMemberModify(MemberVO mVo, HttpSession session) {
		
		
		String memPhone = mVo.getMemPhone();
		String memEmail = mVo.getMemEmail();
		String memRegion = mVo.getMemRegion();
		String memCity = mVo.getMemCity();
		
		// �α����Ҷ�  ���ǿ� mId�� ��������. getAttribute�� �ؼ� mId�� �����´ٸ� -> �α��� �� ����
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		mDao.memberModify(memId, memPhone, memEmail, memRegion, memCity);
	}
	
	
	// ȸ�� Ż��
	public void mMemberDelete(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		System.out.println("���� ���̵�(������ ���̵�): " + memId);
		mDao.memberDelete(memId);
	}
	
	
	// ��� ����Ʈ
	public void mList(Model model) {
		ArrayList<MemberVO> dtos = mDao.list();
		model.addAttribute("list", dtos);
	}
	
}

