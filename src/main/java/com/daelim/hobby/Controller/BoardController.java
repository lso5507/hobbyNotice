package com.daelim.hobby.Controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.daelim.hobby.Service.BoardService;
import com.daelim.hobby.Service.MemberService;
import com.daelim.hobby.Vo.MemberVO;
import com.daelim.hobby.Vo.VOBoard;
import com.daelim.hobby.Vo.VOComment;








//   ----------------------------------寃뚯떆�뙋�뿉 ���븳 而⑦듃濡ㅻ윭�엯�땲�떎 --------------------------------------
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;  // BoardService 鍮�  �벑濡�
	@Autowired
	MemberService memberService; 
	


	@RequestMapping(value = "/board_list", method = RequestMethod.GET)  // 寃뚯떆�뙋 �쟾泥대낫湲�
	public String list(Locale locale, Model model) {
		System.out.println("list");
		List<VOBoard> boards = boardService.read();
		model.addAttribute("list",boards);

		return "board/board_list";
	}

	@RequestMapping(value = "/board_notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model,HttpServletRequest request) {
		String value=request.getParameter("val"); //게시판 종ㄿ

		List<VOBoard> boards = boardService.read(Integer.parseInt(value),"Notice");
		model.addAttribute("list",boards);
		return "board/board_list";
	}

	@RequestMapping(value = "/board_detailview", method = RequestMethod.GET) // 게시판 상세보기
	public ModelAndView detail(HttpServletResponse response,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard board = boardService.detailView(Integer.parseInt(cnt)); // 寃뚯떆�뙋 �긽�꽭蹂닿린
		List<VOComment> comments = boardService.detailComment(Integer.parseInt(cnt));
		ModelAndView mav = new ModelAndView( "board/board_detailview");
		mav.addObject("board",board);
		mav.addObject("comments",comments);
		

		return mav;
	}

	@RequestMapping(value = "/board_team", method = RequestMethod.GET)
	public String team(Locale locale, Model model,HttpServletRequest request) {
		String value=request.getParameter("val"); //게시판 종ㄿ

		List<VOBoard> boards = boardService.read(Integer.parseInt(value),"Team");
		model.addAttribute("list",boards);
		return "board/board_list";
	}
	@RequestMapping(value = "/board_tip", method = RequestMethod.GET)
	public String tip(Locale locale, Model model,HttpServletRequest request) {
		String value=request.getParameter("val");// 게시판 종류
		List<VOBoard> boards = boardService.read(Integer.parseInt(value),"Tip");
		model.addAttribute("list",boards);
		return "board/board_list";
	}
	@RequestMapping(value = "/board_free", method = RequestMethod.GET)
	public String freeboard(Locale locale, Model model,HttpServletRequest request) {
		String value=request.getParameter("val");  // 게시판 종류
		List<VOBoard> boards = boardService.read(Integer.parseInt(value),"FreeBoard");
		
		model.addAttribute("list",boards);
		return "board/board_list";
	}
	@RequestMapping(value = "/board_qa", method = RequestMethod.GET)
	public String qa(Locale locale, Model model,HttpServletRequest request) {
		String value=request.getParameter("val");
		
		List<VOBoard> boards = boardService.read(Integer.parseInt(value),"QA"); //"QA"는 게시판 카테고
		model.addAttribute("list",boards);
		return "board/board_list";
	}


	@RequestMapping(value = "/board_writeform", method = RequestMethod.GET)
	public String writeForm(Locale locale, Model model) {


		return "board/board_writeform";
	}
	@RequestMapping(value = "/board_write", method = RequestMethod.POST) // 사용자가 입력한 값
	public String write(VOBoard board, Model model,HttpServletRequest request) {
		System.out.println("카테고리 테스트 : "+board.getBdCategory());
		System.out.println("벨류 테스트 : "+board.getValue());
		System.out.println("벨류 테스트 : "+request.getParameter("value"));
		String url = "home";
		if(board.getBdCategory().equals("Team")) {
			url="/board_team?val="+board.getValue();
			System.out.println(url);
		}

		else if(board.getBdCategory().equals("Tip")) {
			url="/board_tip?val="+board.getValue();
		}
		else if(board.getBdCategory().equals("QA")) {
			url="/board_qa?val="+board.getValue();
		}
		else if(board.getBdCategory().equals("FreeBoard")) {
			url="/board_free?val="+board.getValue();
		}
		
		int result=boardService.insert(board);
		if(result==0) {
			System.out.println("Insert Error");
		}
		else {
			System.out.println("Insert Success");
		}
		System.out.println(url);
		return "redirect:"+url;
	}
	@RequestMapping(value = "/board_modiform", method = RequestMethod.GET) // �궗�슜�옄媛� �엯�젰�븳 媛�
	public String modifyForm(VOBoard board, Model model,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard boardRST = boardService.detailView(Integer.parseInt(cnt)); // 寃뚯떆�뙋 �긽�꽭蹂닿린
		request.setAttribute("board", boardRST); // 寃뚯떆�뙋 �긽�꽭 �궡�슜 �쟾�떖

		return "board/board_modiform";
	}
	@RequestMapping(value = "/board_delform", method = RequestMethod.GET) // �궗�슜�옄媛� �엯�젰�븳 媛�
	public String delete(VOBoard board, Model model,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		int result=boardService.delete(Integer.parseInt(cnt));
		if(result!=0)
			System.out.println("DeleteSuccess");
		else
			System.out.println("DeleteFail");

		return "redirect:board_list";
	}
	@RequestMapping(value = "/board_modify", method = RequestMethod.POST) // �궗�슜�옄媛� �엯�젰�븳 媛�
	public String modify(VOBoard board, HttpServletRequest request,HttpServletResponse response) {
		String cnt = request.getParameter("cnt");
		PrintWriter outs;
		int result = boardService.update(board,Integer.parseInt(cnt));
//		VOMember member = (VOMember)session.getAttribute("member");

		try {
			outs = response.getWriter();
//			if(member==null) {
//				outs.println("<script>alert('NotFoundSession');</script>");
//			}
//			else {

			if(result!=0) {
				outs.println("<script>alert('寃뚯떆湲��닔�젙�셿猷�');</script>");
			}
			else {
				outs.println("<script>alert('寃뚯떆湲��닔�젙�떎�뙣');</script>");
			}

//			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return "redirect:board_list";
	}
	@RequestMapping(value = "/board_comment", method = RequestMethod.GET)
	public ModelAndView board_comment(HttpSession session,HttpServletResponse response,VOComment comment,HttpServletRequest request) {
		
		int result=boardService.insertComment(comment);
		MemberVO member = (MemberVO)session.getAttribute("mVo");
		int dno = Integer.parseInt(request.getParameter("dno"));
		ModelAndView mav ;
		if(member==null) {
			mav= new ModelAndView("redirect");
			mav.addObject("message", "세션이 만료되었습니다..");
			mav.addObject("url", "board_detailview?cnt="+dno);
			return mav;
			
		}
		if(result!=0) {
			mav= new ModelAndView("redirect");
			mav.addObject("message", "댓글입력 완료.");
			mav.addObject("url", "board_detailview?cnt="+dno);
			
		}
		else {
			mav= new ModelAndView("redirect");
			mav.addObject("message", "댓글 입력 실패.");
			mav.addObject("url", "board_detailview?cnt="+dno);
			
		}

		return mav;
	}
	
	@RequestMapping(value = "/board_likey", method = RequestMethod.GET)
	public ModelAndView board_likey(HttpServletRequest request,RedirectAttributes redirect,HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("mVo");
		
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		int board_result=0;
		
		ModelAndView mav ;
		if(member==null) {
			mav= new ModelAndView("redirect");
			mav.addObject("message", "세션이 만료되었습니다..");
			mav.addObject("url", "board_detailview?cnt="+cnt);
			return mav;
			
		}

		
		int member_result = memberService.verify(cnt,member);
		redirect.addAttribute("cnt", cnt); //리디렉트시 파라미터 값도 넘겨주기 
		if(member_result!=0) {
			mav= new ModelAndView("redirect");
			mav.addObject("message", "추천하였습니다.");
			mav.addObject("url", "board_detailview?cnt="+cnt);
			board_result = boardService.incrementLikey(cnt); 
			
		}
		else {
			mav= new ModelAndView("redirect");
			mav.addObject("message", "추천 취소.");
			mav.addObject("url", "board_detailview?cnt="+cnt);
			board_result = boardService.decrementLikey(cnt); 
		}
	    
		return mav;
	
	
	}
}
