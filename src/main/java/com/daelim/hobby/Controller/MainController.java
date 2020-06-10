package com.daelim.hobby.Controller;

import java.util.List;

import javax.inject.Inject;

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
//--------------------------------------메인화면에 대한 컨트롤러 입니다(검색기능 포함)-------------------------------------
@Controller
public class MainController {
	
	
	@Inject
	private BoardService service;
	
	// 검색 게시물 목록 페이징
	@RequestMapping(value = "/hobby/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword", required = false, defaultValue ="") String keyword
			) throws Exception {
		VOPaging page = new VOPaging();
		
		page.setNum(num); //페이지 번호 
		page.setSearchCount(service.searchCount(keyword));  //검색된 게시물 총갯수

		List<VOBoard> searchPaging = null;    //seachPaging = 검색된 게시물 리스트
		searchPaging = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", searchPaging);   
		model.addAttribute("page", page);

		model.addAttribute("select", num);
	}

}