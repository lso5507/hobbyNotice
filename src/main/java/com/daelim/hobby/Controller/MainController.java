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
//--------------------------------------筌롫뗄�뵥占쎌넅筌롫똻肉� 占쏙옙占쎈립 �뚢뫂�뱜嚥▲끇�쑎 占쎌뿯占쎈빍占쎈뼄(野껓옙占쎄퉳疫꿸퀡�뮟 占쎈７占쎈맙)-------------------------------------
@Controller
public class MainController {


	@Inject
	public BoardService service;
	


	// 통합 게시물 검색
	@RequestMapping(value = "listpagesearch", method = RequestMethod.GET)
	public String getListPageSearch(Model model, HttpServletRequest request) throws Exception {
		//String searchType=request.getParameter("searchtype"); // 寃��깋 ���엯
		String keyword=request.getParameter("keyword");  // 寃��깋 �궎�썙�뱶


		List<VOBoard> listPageSearch = null;    //seachPaging = 野껓옙占쎄퉳占쎈쭆 野껊슣�뻻�눧占� �뵳�딅뮞占쎈뱜
		listPageSearch = service.listPageSearch(keyword);
		for (VOBoard s : listPageSearch ) {
			System.out.println(s.getValue());
		}
		model.addAttribute("list", listPageSearch);

		return "main_search_results";
	}

	// �떎瑜� �럹�씠吏� �삱�씪�삤�뒗吏� �솗�씤�슜 -�듅梨�
	@RequestMapping("/search_more")
	public String search(Model model) {
		
		return "main_search_results_more"; 
	}
}
