package com.daelim.hobby.controller;

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

import com.daelim.hobby.service.BoardService;
import com.daelim.hobby.vo.VOBoard;
import com.daelim.hobby.vo.VOComment;




 



//   ----------------------------------寃뚯떆�뙋�뿉 ���븳 而⑦듃濡ㅻ윭�엯�땲�떎 --------------------------------------
@Controller
public class BoardController {

	@Autowired 
	BoardService boardService;  // BoardService 鍮�  �벑濡�
	
	
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)  // 寃뚯떆�뙋 �쟾泥대낫湲�
	public String list(Locale locale, Model model) {
		System.out.println("list");
		List<VOBoard> boards = boardService.read();
		model.addAttribute("list",boards);
		
		return "board_list";
	}
	@RequestMapping(value = "/board_detailview", method = RequestMethod.GET) // 寃뚯떆�뙋 �긽�꽭蹂닿린 
	public String detail(HttpServletResponse response,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard board = boardService.detailView(Integer.parseInt(cnt)); // 寃뚯떆�뙋 �긽�꽭蹂닿린
		List<VOComment> comments = boardService.detailComment(Integer.parseInt(cnt));
		request.setAttribute("board", board); // 寃뚯떆�뙋 �긽�꽭 �궡�슜 �쟾�떖
		request.setAttribute("comments", comments); // �뙎湲� �궡�슜 �쟾�떖
		return "board_detailview";
	}
	
	@RequestMapping(value = "/board_team", method = RequestMethod.GET)
	public String team(Locale locale, Model model) {
		boardService.read("Team");
		List<VOBoard> boards = boardService.read("Team");
		model.addAttribute("list",boards);
		return "board_team";
	}
	@RequestMapping(value = "/board_tip", method = RequestMethod.GET)
	public String tip(Locale locale, Model model) {
		boardService.read("Tip");
		List<VOBoard> boards = boardService.read("Tip");
		model.addAttribute("list",boards);
		return "board_tip";
	}
	@RequestMapping(value = "/board_free", method = RequestMethod.GET)
	public String freeboard(Locale locale, Model model) {
		boardService.read("FreeBoard");
		List<VOBoard> boards = boardService.read("FreeBoard");
		model.addAttribute("lists",boards);
		return "board_free";
	}
	

	@RequestMapping(value = "/board_writeform", method = RequestMethod.GET)
	public String writeForm(Locale locale, Model model) {
		
		
		return "board_writeform";
	}
	@RequestMapping(value = "/board_write", method = RequestMethod.POST) // �궗�슜�옄媛� �엯�젰�븳 媛� 
	public String write(VOBoard board, Model model) {
		System.out.println("移댄뀒怨좊━ �뀒�뒪�듃 : "+board.getBdCategory());
		
		int result=boardService.insert(board);
		if(result==0) {
			System.out.println("Insert Error");
		}
		else {
			System.out.println("Insert Success");
		}
		
		return "redirect:board_list";
	}
	@RequestMapping(value = "/board_modiform", method = RequestMethod.GET) // �궗�슜�옄媛� �엯�젰�븳 媛� 
	public String modifyForm(VOBoard board, Model model,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard boardRST = boardService.detailView(Integer.parseInt(cnt)); // 寃뚯떆�뙋 �긽�꽭蹂닿린
		request.setAttribute("board", boardRST); // 寃뚯떆�뙋 �긽�꽭 �궡�슜 �쟾�떖
		
		return "board_modiform";
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
	public String board_comment(HttpSession session,HttpServletResponse response,VOComment comment,HttpServletRequest request) {
		PrintWriter outs;
		
//		VOMember member = (VOMember)session.getAttribute("member");
		String dno = request.getParameter("dno");
		try {
			outs = response.getWriter();
//			if(member==null) {
//				outs.println("<script>alert('NotFoundSession');</script>"); 
//			}
//			else {
			int result=boardService.insertComment(comment);
			if(result!=0) {
				outs.println("<script>alert('CommentInsertSuccess');</script>"); 
			}
			else {
				outs.println("<script>alert('CommentInsertFail');</script>"); 
			}
			
//			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return "redirect:board_detailview?cnt="+dno;
	}
	
}
