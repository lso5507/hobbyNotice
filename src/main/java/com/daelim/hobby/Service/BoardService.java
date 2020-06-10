package com.daelim.hobby.Service;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.daelim.hobby.Dao.BoardDao;
import com.daelim.hobby.Vo.VOBoard;
import com.daelim.hobby.Vo.VOComment;



@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	
	
	public List<VOBoard> read() {
		
		List<VOBoard> boards =dao.boardRead();
		return boards;
		
	}
	public List<VOBoard> read(String category) {
		
		List<VOBoard> boards =dao.boardRead(category);
		return boards;
		
	}
	public int insert(VOBoard board) {
		int result=dao.boardInsert(board);
		
		return result;
	}
	public int update(VOBoard board, int cnt) {
		System.out.println("�뾽�뜲�씠�듃 �뀒�뒪�듃");
		int result=dao.boardUpdate(board,cnt);
		
		return result;
	}
	public VOBoard detailView(int cnt) {
		VOBoard board=dao.detailRead(cnt);
		
		return board;
		
	}
	public List<VOComment> detailComment(int cnt) {
		
		List<VOComment> comments = dao.detailComment(cnt);
		
		return comments;
		
	}
	public int insertComment(VOComment comment) {
		int result = dao.insertComment(comment);
		
		return result;
		
		
	}
	public int insertUpload(MultipartFile uploadfile,String path) {
	    String saveName = getCurrentDate("yyyyMMddHHmm") + "_" + uploadfile.getOriginalFilename();
	    File saveFile = new File(path,saveName); 
	    File filePath = new File(path);
	    
	    if(!filePath.exists()) {
	    	filePath.mkdirs();   // 留뚯빟�뿉 path �빐�떦�븯�뒗 寃쎈줈媛� �뾾�쑝硫� �뤃�뜑瑜� 留뚮벉
	    }
	    try {
	    	uploadfile.transferTo(saveFile); // �뙆�씪 ���옣 
	    }
	    catch(Exception e) {
	    	System.out.println("Error:"+e);
	    }

		return 0;
	}
	public static String getCurrentDate(String format) {  // �씠誘몄��뙆�씪�씠由� 以묐났諛⑹�
	       String dtStr = "";
	       SimpleDateFormat sdf = new SimpleDateFormat(format);
	       Date dt1 = new Date();

	       dtStr = sdf.format(dt1);

	       return dtStr;
	}
	public int delete(int cnt) {
		int result=dao.boardDelete(cnt);
		return result;
	}

}
