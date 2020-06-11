package com.daelim.hobby.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.daelim.hobby.Dao.BoardDao;
import com.daelim.hobby.Service.BoardService;
import com.daelim.hobby.Vo.VOBoard;
import com.daelim.hobby.Vo.VOPaging;
//--------------------------------------硫붿씤�솕硫댁뿉 ���븳 而⑦듃濡ㅻ윭 �엯�땲�떎(寃��깋湲곕뒫 �룷�븿)-------------------------------------
@Controller
public class MainController {


	@Inject
	private BoardService service;

	// 검색 게시물 목록


	// 검색 게시물 목록 페이징
	@RequestMapping(value = "listpagesearch", method = RequestMethod.GET)
	public String getListPageSearch(Model model, HttpServletRequest request) throws Exception {
		VOPaging page = new VOPaging();
		String searchType=request.getParameter("searchtype");
		String keyword=request.getParameter("keyword");  //

		page.setSearchCount(service.searchCount(keyword));  //검색된 게시물 총갯수

		List<VOBoard> searchPaging = null;    //seachPaging = 寃��깋�맂 寃뚯떆臾� 由ъ뒪�듃
		searchPaging = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", searchPaging);
		model.addAttribute("page", page);


		return "main_search_results";


	}

}
