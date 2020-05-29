package com.daelim.hobby.Controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daelim.hobby.Service.BoardService;
import com.daelim.hobby.Vo.VOBoard;
import com.daelim.hobby.Vo.VOComment;







//   ----------------------------------寃뚯떆�뙋�뿉 ���븳 而⑦듃濡ㅻ윭�엯�땲�떎 --------------------------------------
@Controller
public class BoardController {

	@Autowired 
	BoardService boardService;  // BoardService 鍮�  �벑濡�
	
	@RequestMapping(value = "/", method = RequestMethod.GET)  // main화면 
	public String main(Locale locale, Model model) {
		
		return "main";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)  // 寃뚯떆�뙋 �쟾泥대낫湲�
	public String list(Locale locale, Model model) {
		System.out.println("list");
		List<VOBoard> boards = boardService.read();
		model.addAttribute("list",boards);
		
		return "list";
	}
	@RequestMapping(value = "/detailview", method = RequestMethod.GET) // 寃뚯떆�뙋 �긽�꽭蹂닿린 
	public String detail(HttpServletResponse response,HttpServletRequest request) {
		String cnt = request.getParameter("cnt");
		VOBoard board = boardService.detailView(Integer.parseInt(cnt)); // 寃뚯떆�뙋 �긽�꽭蹂닿린
		List<VOComment> comments = boardService.detailComment(Integer.parseInt(cnt));
		request.setAttribute("board", board); // 寃뚯떆�뙋 �긽�꽭 �궡�슜 �쟾�떖
		request.setAttribute("comments", comments); // �뙎湲� �궡�슜 �쟾�떖
		return "detailview";
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
	
	
}
