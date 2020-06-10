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

import com.daelim.hobby.Service.BoardService;
import com.daelim.hobby.Vo.VOBoard;
import com.daelim.hobby.Vo.VOComment;








//   ----------------------------------게시판에 대한 컨트롤러입니다 --------------------------------------
@Controller
@RequestMapping(value="/board/")
public class BoardController {

	@Autowired 
	BoardService boardService;  // BoardService 빈  등록
	
	
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)  // 게시판 전체보기
	public String list(Locale locale, Model model) {
		System.out.println("list");
		List<VOBoard> boards = boardService.read();
		model.addAttribute("list",boards);
		
		return "board/board_list";
	}
	@RequestMapping(value = "/board_detailview", method = RequestMethod.GET) // 게시판 상세보기 
	public String detail(HttpServletResponse response,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard board = boardService.detailView(Integer.parseInt(cnt)); // 게시판 상세보기
		List<VOComment> comments = boardService.detailComment(Integer.parseInt(cnt));
		request.setAttribute("board", board); // 게시판 상세 내용 전달
		request.setAttribute("comments", comments); // 댓글 내용 전달
		return "board/board_detailview";
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
		model.addAttribute("lists",boards);
		return "board/board_list";
	}
	@RequestMapping(value = "/board_qa", method = RequestMethod.GET)
	public String qa(Locale locale, Model model,HttpServletRequest request) {
		String value=request.getParameter("val");
		List<VOBoard> boards = boardService.read(Integer.parseInt(value),"QA"); //"QA"는 게시판 카테고
		model.addAttribute("lists",boards);
		return "board/board_list";
	}
	

	@RequestMapping(value = "/board_writeform", method = RequestMethod.GET)
	public String writeForm(Locale locale, Model model) {
		
		
		return "board/board_writeform";
	}
	@RequestMapping(value = "/board_write", method = RequestMethod.POST) // 사용자가 입력한 값 
	public String write(VOBoard board, Model model) {
		System.out.println("카테고리 테스트 : "+board.getBdCategory());
		
		int result=boardService.insert(board);
		if(result==0) {
			System.out.println("Insert Error");
		}
		else {
			System.out.println("Insert Success");
		}
		
		return "redirect:board_list";
	}
	@RequestMapping(value = "/board_modiform", method = RequestMethod.GET) // 사용자가 입력한 값 
	public String modifyForm(VOBoard board, Model model,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard boardRST = boardService.detailView(Integer.parseInt(cnt)); // 게시판 상세보기
		request.setAttribute("board", boardRST); // 게시판 상세 내용 전달
		
		return "board/board_modiform";
	}
	@RequestMapping(value = "/board_delform", method = RequestMethod.GET) // 사용자가 입력한 값 
	public String delete(VOBoard board, Model model,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		int result=boardService.delete(Integer.parseInt(cnt));
		if(result!=0)
			System.out.println("DeleteSuccess");
		else
			System.out.println("DeleteFail");
		
		return "redirect:board_list";
	}
	@RequestMapping(value = "/board_modify", method = RequestMethod.POST) // 사용자가 입력한 값 
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
				outs.println("<script>alert('게시글수정완료');</script>"); 
			}
			else {
				outs.println("<script>alert('게시글수정실패');</script>"); 
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
