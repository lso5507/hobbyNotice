package com.daelim.hobby.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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


	// �븘�씠�뵒 以묐났寃��궗
	@RequestMapping("/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {
		mVo = mService.mIdCheck(request);

		if(mVo == null) {
			model.addAttribute("msg", request.getParameter("memId") + " �궗�슜 媛��뒫�븳 �븘�씠�뵒 �엯�땲�떎."); // 寃��깋 寃곌낵瑜� view�뿉�꽌 �궗�슜�븯湲� �쐞�빐 model�뿉 異붽�
			model.addAttribute("result","true"); // result : 酉곗뿉�꽌 �븘�씠�뵒 以묐났�씤吏� �솗�씤�븷 �븣 �궗�슜
			model.addAttribute("memId", request.getParameter("memId"));
		}else {
			model.addAttribute("msg", request.getParameter("memId") + " �궗�슜�븷�닔 �뾾�뒗 �븘�씠�뵒 �엯�땲�떎.");
			model.addAttribute("result","false");
			model.addAttribute("memId", request.getParameter("memId"));
		}

		return "member/create_account_view.part";
	}


	// 濡쒓렇�씤
	@RequestMapping("/login_page")
	public String login_view() {
		return "/member/login_page.part";
	}
	@RequestMapping("/login")
	public String login(MemberVO mVo, HttpServletRequest request, Model model) {
		mVo = mService.mLogin(mVo, request);

		if(mVo == null) { // 寃��깋 �떎�뙣�떆
			model.addAttribute("msg", "�븘�씠�뵒, 鍮꾨�踰덊샇媛� ��由쎈땲�떎."); // view�뿉 肉뚮젮二쇨린 �쐞�빐 model�뿉 異붽�
			model.addAttribute("url", "member/login_page.jsp");
			return "/member/login_page.part";
		}
		
		return "redirect:/";
	}


	// �븘�씠�뵒 李얘린
	@RequestMapping("/idSearch_page")
	public String idSearch_page() {
		return "/member/idSearch_page.part";
	}
	@RequestMapping("/idSearch")
	public String idSearch(MemberVO mVo, Model model) {
		mVo = mService.mIdSearch(mVo);
		if(mVo != null) {
			System.out.println("�븘�씠�뵒 寃��깋 �꽦怨� : " + mVo.getMemId());
			model.addAttribute("mVo", mVo); // view�뿉 寃곌낵瑜� 肉뚮젮二쇨린 �쐞�빐 model�뿉 異붽�
		}
		return "/member/idSearch_page.part";
	}


	// 鍮꾨�踰덊샇 李얘린
	@RequestMapping("/pwSearch_page")
	public String pwSearch_page() {
		return "/member/pwSearch_page.part";
	}
	@RequestMapping("/pwSearch")
	public String pwSearch(MemberVO mVo, Model model) {
		mVo = mService.mPwSearch(mVo);

		if(mVo != null) {
			System.out.println("鍮꾨�踰덊샇 寃��깋 �꽦怨� : " + mVo.getMemPw());
			model.addAttribute("mVo", mVo); // view�뿉 寃곌낵瑜� 肉뚮젮二쇨린 �쐞�빐 model�뿉 異붽�
		}

		return "/member/pwSearch_page.part";
	}


	// �궡 �젙蹂�
	@RequestMapping("/myInfo_page")
	public String Login_MyInfo() {
		return "/member/myInfo_page.part";
	}


	// �쉶�썝 �젙蹂� �닔�젙
	@RequestMapping("/myInfo_modify_page")
	public String member_modify_page() {
		return "/member/myInfo_modify_page.part";
	}
	@RequestMapping("/member_modify")
	public String member_modify(MemberVO mVo, HttpSession session) {
		mService.mMemberModify(mVo, session);
		return "redirect:myInfo_page.part";
	}
	
	// 鍮꾨�踰덊샇 蹂�寃�
	@RequestMapping("myPw_modify_page")
	public String myPw_modify_page() {
		return "/member/myPw_modify_page.part";
	}
	@RequestMapping("/memberPw_modify")
	public String memberPw_modify(MemberVO mVo, HttpSession session) {
		mService.mMemberPwModify(mVo, session);
		return "redirect:myInfo_page.part";
	}


	// 濡쒓렇�븘�썐 (�꽭�뀡 �궘�젣)
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession(); // �꽭�뀡�쓣 媛��졇�샂. (�뾾�쑝硫� �깉濡� 留뚮뱺�떎)
		if(session.isNew()) { // 泥섏쓬 留뚮뱾�뼱吏� �꽭�뀡�씠硫� (濡쒓렇�씤�맂 �긽�깭媛� �븘�땶嫄곗엫)
			System.out.println("泥섏쓬 留뚮뱾�뼱吏� �꽭�뀡�엯�땲�떎.");
		}else {
			System.out.println("濡쒓렇�씤�맂 �븘�씠�뵒: " + session.getAttribute("mId"));
			session.invalidate(); // �꽭�뀡 �궘�젣
			System.out.println("�꽭�뀡�쓣 �궘�젣�빀�땲�떎");
		}
		return "redirect:/"; // �솃 �럹�씠吏�濡� �씠�룞
	}


	// �쉶�썝 �깉�눜
	@RequestMapping("/mDelete")
	public String mDelete(HttpSession session) {
		mService.mMemberDelete(session);
		session.invalidate(); // �꽭�뀡�쓣 �궘�젣�븳�떎
		return "/member/login_page";
	}



	// 硫ㅻ쾭 由ъ뒪�듃 (媛��엯�븳 �쉶�썝 紐⑸줉)
//	@RequestMapping("/mList")
//	public String list(Model model) {
//		mService.mList(model);
//		return "/member/list";
//	}


} // end of MController
