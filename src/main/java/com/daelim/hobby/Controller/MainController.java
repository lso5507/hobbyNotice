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
//--------------------------------------硫붿씤�솕硫댁뿉 ���븳 而⑦듃濡ㅻ윭 �엯�땲�떎(寃��깋湲곕뒫 �룷�븿)-------------------------------------
@Controller
public class MainController {
	
	
	@Inject
	private BoardService service;
	
	// 寃��깋 寃뚯떆臾� 紐⑸줉 �럹�씠吏�
	@RequestMapping(value = "/hobby/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword", required = false, defaultValue ="") String keyword
			) throws Exception {
		VOPaging page = new VOPaging();
		
		page.setNum(num); //�럹�씠吏� 踰덊샇 
		page.setSearchCount(service.searchCount(keyword));  //寃��깋�맂 寃뚯떆臾� 珥앷갗�닔

		List<VOBoard> searchPaging = null;    //seachPaging = 寃��깋�맂 寃뚯떆臾� 由ъ뒪�듃
		searchPaging = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", searchPaging);   
		model.addAttribute("page", page);

		model.addAttribute("select", num);
	}

}