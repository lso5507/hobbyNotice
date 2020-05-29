package com.lee.notice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.lee.notice.VO.VOBoard;
import com.lee.notice.VO.VOComment;
import com.lee.notice.VO.VOMember;
import com.lee.notice.service.boardService;
import com.lee.notice.service.memberService;

/**
 * Handles requests for the application home page.
 */



@Controller
public class HomeController {
	@Autowired
	memberService memberService;
	@Autowired
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home_(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		System.out.println("list");
		List<VOBoard> boards = boardService.read();
		model.addAttribute("list",boards);
		
		return "list";
	}
	@RequestMapping(value = "/joinview", method = RequestMethod.GET)
	public String joinForm(VOMember member,HttpServletResponse response) {

		
		return "joinview";
	}
	@RequestMapping(value = "/detailview", method = RequestMethod.GET)
	public String detail(VOMember member,HttpServletResponse response,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard board = boardService.detailView(Integer.parseInt(cnt)); // 게시판 상세보기
		List<VOComment> comments = boardService.detailComment(Integer.parseInt(cnt));
		request.setAttribute("board", board); // 게시판 상세 내용 전달
		request.setAttribute("comments", comments); // 댓글 내용 전달
		return "detailview";
	}
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(VOMember member,HttpServletResponse response) {
		PrintWriter outs;
		int result= memberService.memInsert(member);
		try {
			outs = response.getWriter();
			
			if(result!=0) {  //result가 0이 아니면 성공
				outs.println("<script>alert('insertSuccess.'); location.href='home';</script>"); 
			
				System.out.println("insert성공");
				
			}
			else {
				outs.println("<script>alert('insertError.'); location.href='home';</script>"); 
				
			}
			outs.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "home";
		
		
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(VOMember member,HttpSession session,HttpServletResponse response) {
		VOMember mem=memberService.memberLogin(member);
		PrintWriter outs;
		try {
			outs = response.getWriter();
			if(mem!=null) {
				System.out.println("memtest");
				session.setAttribute("member", mem);  // 세션 유지로 로그인 상태 유지
				outs.println("<script>alert('loginSuccess');</script> "); 
					
				
			}
			else {
				
				outs.println("<script>alert('LoginFail'); </script>"); 
			}
			outs.flush();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}	
	
		
		return "home";
	}
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		
		
		return "loginForm";
	}
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String writeForm(Locale locale, Model model) {
		
		
		return "writeform";
	}
	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public String team(Locale locale, Model model) {
		boardService.read("Team");
		List<VOBoard> boards = boardService.read("Team");
		model.addAttribute("list",boards);
		return "team";
	}
	@RequestMapping(value = "/tip", method = RequestMethod.GET)
	public String tip(Locale locale, Model model) {
		boardService.read("Tip");
		List<VOBoard> boards = boardService.read("Tip");
		model.addAttribute("list",boards);
		return "tip";
	}
	@RequestMapping(value = "/freeboard", method = RequestMethod.GET)
	public String freeboard(Locale locale, Model model) {
		boardService.read("FreeBoard");
		List<VOBoard> boards = boardService.read("FreeBoard");
		model.addAttribute("lists",boards);
		return "freeboard";
	}
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(HttpServletResponse response , VOBoard board,HttpSession session,HttpServletRequest request, MultipartFile uploadfile) {
		VOMember member = (VOMember)session.getAttribute("member");
		PrintWriter outs;
		String realPath=request.getSession().getServletContext().getRealPath("/upload/"+board.getDno()+"/");
		
		System.out.println(realPath);

		try{
			outs = response.getWriter();
			if(member==null)  {
				
				outs.println("<script>alert('NotFoundSession'); location.href='list';</script>"); 
			}
			else {
				int result = boardService.insert(board); // 글 정보 서비스로직
				int img_result = boardService.insertUpload(uploadfile,realPath);
				if(result==0) {
					outs.println("<script>alert('boardWriteFail'); location.href='list';</script>"); 	
				}
				else {
					outs.println("<script>alert('boardWriteSuccess'); location.href='list';</script>"); 	
				}
			}
			outs.flush();	
		}
		catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "list";
	}
	@RequestMapping(value="/comment")
	public String comment(HttpServletResponse response, HttpSession session,VOComment comment) {
		PrintWriter outs;
		
		VOMember member = (VOMember)session.getAttribute("member");

		try {
			outs = response.getWriter();
			if(member==null) {
				outs.println("<script>alert('NotFoundSession');</script>"); 
			}
			else {
				int result=boardService.insertComment(comment);
				if(result!=0) {
					outs.println("<script>alert('CommentInsertSuccess');</script>"); 
				}
				else {
					outs.println("<script>alert('CommentInsertFail');</script>"); 
				}
				
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}

		return "list";
	}
}
