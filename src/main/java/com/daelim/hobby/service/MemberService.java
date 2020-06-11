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
	
	
	// 회占쏙옙占쏙옙占쏙옙
	public void mCreateAccount(MemberVO mVo) { // 占싸깍옙占쏙옙 view占쏙옙占쏙옙 占쌉뤄옙占쏙옙 占쏙옙占쏙옙 MemberVo 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙磯占�
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemPhone(), mVo.getMemEmail(),  
				mVo.getMemRegion(), mVo.getMemCity(), mVo.getMemBirth(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	// 占쏙옙占싱듸옙 占쌩븝옙占싯삼옙
	public MemberVO mIdCheck(HttpServletRequest request) {
		String memId = request.getParameter("memId"); // memId : 회占쏙옙占쏙옙占쏙옙 창占쏙옙占쏙옙 占쌉뤄옙占쏙옙 占쏙옙占싱듸옙
		mVo = mDao.checkId(memId);
		return mVo;
	}
	
	
	
	// 占싸깍옙占쏙옙
	public MemberVO mLogin(MemberVO mVo, HttpServletRequest request) {
		mVo = mDao.login(mVo.getMemId(), mVo.getMemPw());
		
		if(mVo != null) { // 占싯삼옙 占쏙옙占쏙옙 占쏙옙
			HttpSession session = request.getSession(); // 占싸깍옙占쏙옙 -> 占쏙옙占쏙옙 占쏙옙占쏙옙			
			session.setAttribute("mVo", mVo); // 占쏙옙占실울옙 mVo 占쌩곤옙
			
			session.setAttribute("memId", mVo.getMemId()); // 占쏙옙占실울옙 占쏙옙占싱듸옙 占쌩곤옙
			session.setAttribute("memPw", mVo.getMemPw()); // 占쏙옙占실울옙 占쏙옙橘占싫� 占쌩곤옙
			System.out.println("占쏙옙占쏙옙 占쏙옙占싱듸옙: " + (String) session.getAttribute("memId"));
			System.out.println("占쏙옙占쏙옙 占쏙옙橘占싫�: " + (String) session.getAttribute("memPw"));
			
			return mVo;
		}
		
		return null;
	}
	
	
	// 占쏙옙占싱듸옙 찾占쏙옙 (占싱몌옙, 占싱몌옙占쏙옙)
	public MemberVO mIdSearch(MemberVO mVo) {
		String memName = mVo.getMemName();
		String memEmail = mVo.getMemEmail();
		
		mVo = mDao.searchId(memName, memEmail);
		return mVo;
	}
	
	
	// 占쏙옙橘占싫� 찾占쏙옙
	public MemberVO mPwSearch(MemberVO mVo) {
		String memId = mVo.getMemId();
		int memPwHint = mVo.getMemPwHint();
		String memPwAns = mVo.getMemPwAns();
		
		mVo = mDao.searchPw(memId, memPwHint, memPwAns);
		return mVo;
	}
	
	
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public void mMemberModify(MemberVO mVo, HttpSession session) {
		String memPhone = mVo.getMemPhone();
		String memEmail = mVo.getMemEmail();
		String memRegion = mVo.getMemRegion();
		String memCity = mVo.getMemCity();
		String memBirth = mVo.getMemBirth();
		
		// 占싸깍옙占쏙옙占쌀띰옙  占쏙옙占실울옙 mId占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙. getAttribute占쏙옙 占쌔쇽옙 mId占쏙옙 占쏙옙占쏙옙占승댐옙\
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		mDao.memberModify(memId, memPhone, memEmail, memRegion, memCity, memBirth);
		
		// 占쏙옙占쏙옙占쏙옙 mVo占쏙옙 占쌕쏙옙 占쏙옙占실울옙 占쏙옙占쏙옙
		mVo = mDao.login((String)session.getAttribute("memId"), (String)session.getAttribute("memPw"));
		session.setAttribute("mVo", mVo); // 占쏙옙占실울옙 mVo 占쌩곤옙
	}
	
	
	// 占쏙옙橘占싫� 占쏙옙占쏙옙
	public void mMemberPwModify(MemberVO mVo, HttpSession session) {
		String memId = (String) session.getAttribute("memId");
		System.out.println("session.getAttribute mId : " + memId);
		
		String memPw = mVo.getMemPw();
		System.out.println("占쏙옙占쏙옙 占쏙옙橘占싫�: " + memPw);
		
		mDao.memberPwModify(memId, memPw);
		
		// 占쏙옙占쏙옙占쏙옙 mVo占쏙옙 占쌕쏙옙 占쏙옙占실울옙 占쏙옙占쏙옙
		session.setAttribute("memPw", mVo.getMemPw()); // 占쏙옙占실울옙 占쏙옙占쏙옙占� 占쏙옙橘占싫� 占쏙옙占쏙옙
		mVo = mDao.login((String)session.getAttribute("memId"), (String)session.getAttribute("memPw"));
		session.setAttribute("mVo", mVo); // 占쏙옙占실울옙 mVo 占쌩곤옙
	}
	
	
	
	
	// 회占쏙옙 탈占쏙옙
	public void mMemberDelete(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		System.out.println("占쏙옙占쏙옙 占쏙옙占싱듸옙(占쏙옙占쏙옙占쏙옙 占쏙옙占싱듸옙): " + memId);
		mDao.memberDelete(memId);
	}
	
	
	// 占쏙옙占� 占쏙옙占쏙옙트
//	public void mList(Model model) {
//		ArrayList<MemberVO> dtos = mDao.list();
//		model.addAttribute("list", dtos);
//	}

}

