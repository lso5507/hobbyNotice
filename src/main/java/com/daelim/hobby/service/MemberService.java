package com.daelim.hobby.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daelim.hobby.Dao.MemberDAO;
import com.daelim.hobby.Vo.MemberVO;

@Service	
public class MemberService {
	
	@Autowired 
	public MemberDAO mDao;
	public MemberVO mVo;
	
	
	// ȸ������
	public void mCreateAccount(MemberVO mVo) { // �α��� view���� �Է��� ���� MemberVo ��ü�� ������ ����Ѵ�
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemPhone(), mVo.getMemEmail(),  
				mVo.getMemRegion(), mVo.getMemCity(), mVo.getMemBirth(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	// ���̵� �ߺ��˻�
	public MemberVO mIdCheck(HttpServletRequest request) {
		String memId = request.getParameter("memId"); // memId : ȸ������ â���� �Է��� ���̵�
		mVo = mDao.checkId(memId);
		return mVo;
	}
	
	
	
	// �α���
	public MemberVO mLogin(MemberVO mVo, HttpServletRequest request) {
		mVo = mDao.login(mVo.getMemId(), mVo.getMemPw());
		
		if(mVo != null) { // �˻� ���� ��
			HttpSession session = request.getSession(); // �α��� -> ���� ����			
			session.setAttribute("mVo", mVo); // ���ǿ� mVo �߰�
			
			session.setAttribute("memId", mVo.getMemId()); // ���ǿ� ���̵� �߰�
			session.setAttribute("memPw", mVo.getMemPw()); // ���ǿ� ��й�ȣ �߰�
			System.out.println("���� ���̵�: " + (String) session.getAttribute("memId"));
			System.out.println("���� ��й�ȣ: " + (String) session.getAttribute("memPw"));
			
			return mVo;
		}
		
		return null;
	}
	
	
	// ���̵� ã�� (�̸�, �̸���)
	public MemberVO mIdSearch(MemberVO mVo) {
		String memName = mVo.getMemName();
		String memEmail = mVo.getMemEmail();
		
		mVo = mDao.searchId(memName, memEmail);
		return mVo;
	}
	
	
	// ��й�ȣ ã��
	public MemberVO mPwSearch(MemberVO mVo) {
		String memId = mVo.getMemId();
		int memPwHint = mVo.getMemPwHint();
		String memPwAns = mVo.getMemPwAns();
		
		mVo = mDao.searchPw(memId, memPwHint, memPwAns);
		return mVo;
	}
	
	
	// ȸ�� ���� ����
	public void mMemberModify(MemberVO mVo, HttpSession session) {
		String memPhone = mVo.getMemPhone();
		String memEmail = mVo.getMemEmail();
		String memRegion = mVo.getMemRegion();
		String memCity = mVo.getMemCity();
		String memBirth = mVo.getMemBirth();
		
		// �α����Ҷ�  ���ǿ� mId�� ��������. getAttribute�� �ؼ� mId�� �����´�\
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		mDao.memberModify(memId, memPhone, memEmail, memRegion, memCity, memBirth);
		
		// ������ mVo�� �ٽ� ���ǿ� ����
		mVo = mDao.login((String)session.getAttribute("memId"), (String)session.getAttribute("memPw"));
		session.setAttribute("mVo", mVo); // ���ǿ� mVo �߰�
	}
	
	
	// ��й�ȣ ����
	public void mMemberPwModify(MemberVO mVo, HttpSession session) {
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		String memPw = mVo.getMemPw();
		System.out.println("���� ��й�ȣ: " + memPw);
		
		mDao.memberPwModify(memId, memPw);
		
		// ������ mVo�� �ٽ� ���ǿ� ����
		session.setAttribute("memPw", mVo.getMemPw()); // ���ǿ� ����� ��й�ȣ ����
		mVo = mDao.login((String)session.getAttribute("memId"), (String)session.getAttribute("memPw"));
		session.setAttribute("mVo", mVo); // ���ǿ� mVo �߰�
	}
	
	
	
	
	// ȸ�� Ż��
	public void mMemberDelete(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		System.out.println("���� ���̵�(������ ���̵�): " + memId);
		mDao.memberDelete(memId);
	}
	
	
	// ��� ����Ʈ
//	public void mList(Model model) {
//		ArrayList<MemberVO> dtos = mDao.list();
//		model.addAttribute("list", dtos);
//	}

}

