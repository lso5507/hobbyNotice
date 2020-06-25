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
	
	
	// 회원가입
	public void mCreateAccount(MemberVO mVo) { 
		mDao.createAccount(mVo.getMemId(), mVo.getMemPw(), mVo.getMemName(), mVo.getMemPhone(), mVo.getMemEmail(),  
				mVo.getMemRegion(), mVo.getMemCity(), mVo.getMemBirth(), mVo.getMemPwHint(), mVo.getMemPwAns());
	}
	
	
	// 아이디 중복확인
	public MemberVO mIdCheck(HttpServletRequest request) {
		String memId = request.getParameter("memId"); 
		mVo = mDao.checkId(memId);
		return mVo;
	}
	
	
	// 로그인
	public MemberVO mLogin(MemberVO mVo, HttpServletRequest request) {
		mVo = mDao.login(mVo.getMemId(), mVo.getMemPw());
		
		if(mVo != null) { // 검색 성공 시
			HttpSession session = request.getSession(); // 세션 만듬			
			session.setAttribute("mVo", mVo); // 세션에 mVo 추가
			
			session.setAttribute("memId", mVo.getMemId()); // 세션에 아이디 추가 (회원정보 수정, 비밀번호 변경 -> 로그인한 사용자의 아이디를 가져오기 위해 세션에 바인딩)
			session.setAttribute("memPw", mVo.getMemPw()); // 세션에 비밀번호 추가 (회원정보 수정, 비밀번호 변경 -> 로그인한 사용자의 비밀번호를 가져오기 위해 세션에 바인딩)
			System.out.println("세션 아이디 : " + (String) session.getAttribute("memId"));
			System.out.println("세션 비밀번호 : " + (String) session.getAttribute("memPw"));
			
			return mVo;
		}
		return null;
	}
	
	
	// 아이디 검색
	public MemberVO mIdSearch(MemberVO mVo) {
		String memName = mVo.getMemName();
		String memEmail = mVo.getMemEmail();
		
		mVo = mDao.searchId(memName, memEmail);
		return mVo;
	}
	
	
	// 비밀번호 검색
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
		
		// 로그인할 때 만들어진 세션에서 아이디를 가져옴
		String memId = (String) session.getAttribute("memId");
		String memPw = (String) session.getAttribute("memPw");
		
		mDao.memberModify(memId, memPhone, memEmail, memRegion, memCity, memBirth);
		
		// 뷰에서는 수정되기 전 mVo를 가지고 있으므로 업데이트된 mVo를 다시 세션에 바인딩 시킨다 
		mVo = mDao.login(memId, memPw); // 수정된 mVo를 가져온다
		session.setAttribute("mVo", mVo); // 수정된 mVo를 다시 세션에 등록
	}
	
	
	// 비밀번호 변경
	public void mMemberPwModify(MemberVO mVo, HttpSession session) {
		String memId = (String) session.getAttribute("memId");
		String memPw = mVo.getMemPw(); // 변경할 비밀번호
		System.out.println("변경 비밀번호: " + memPw);
		
		mDao.memberPwModify(memId, memPw);
		
		session.setAttribute("memPw", mVo.getMemPw()); // 변경된 비밀번호를 세션에 등록
		mVo = mDao.login(memId, memPw);
		session.setAttribute("mVo", mVo); // 수정된 mVo를 다시 세션에 등록
	}
	
	
	// 회원 탈퇴
	public void mMemberDelete(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		System.out.println("세션 아이디(삭제할 아이디) : " + memId);
		mDao.memberDelete(memId);
	}


	public int verify(int cnt, MemberVO mem) {  // 추천 중복확인 -SWLee-
		boolean checker = true;
		int result =0;
		int likeRst=0;
		if(mem.getMemLikey()!=null) {
			String[] like = mem.getMemLikey().split(",");
			for (String str : like) {
				System.out.println(str);
				if(String.valueOf(cnt).equals(str)) {
					// DB에서 cnt 값 지우기
					checker = false;
					mem.setMemLikey(mem.getMemLikey().replace(String.valueOf(cnt)+",",""));
					result=mDao.memberLikey(mem);
					
				}
				
			}
		}
		if(checker) {  // cnt 값이 db 데이터에 없을때
			// DB에 cnt 값 넣기 
			if(mem.getMemLikey()!=null) {
				mem.setMemLikey(mem.getMemLikey()+cnt+",");
			}
			else
				mem.setMemLikey(cnt+",");
			result=mDao.memberLikey(mem);
			likeRst=1;
		}
		if(result==0) {
			System.out.println("Likey Error_memberService");
		}
		return likeRst;
	}
	
	
	// 멤버리스트
//	public void mList(Model model) {
//		ArrayList<MemberVO> dtos = mDao.list();
//		model.addAttribute("list", dtos);
//	}

}

