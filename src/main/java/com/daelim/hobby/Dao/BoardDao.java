package com.daelim.hobby.Dao;
////int category=(board.getBdCategory().equals("Team"))?0:(board.getBdCategory().equals("Tip"))?1:
//(board.getBdCategory().equals("FreeBoard"))?2:null;  移댄뀒怨좊━ DB而щ읆�뿉 ���옣 諛⑹떇.
import java.beans.PropertyVetoException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale.Category;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import com.daelim.hobby.Vo.VOBoard;
import com.daelim.hobby.Vo.VOComment;
import com.mchange.v2.c3p0.ComboPooledDataSource;

//  Category Team==0   Tip==1 FreeBoard==2 else Null


@Repository
public class BoardDao {
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://61.84.24.210:3306/hobby33?useSSL=false&serverTimezone=UTC";
	private String userid = "hobby33";
	private String userpw = "hobby33!!";
	private ComboPooledDataSource dataSource;
    public final  Map<Integer, String> categorys = new HashMap<Integer,String>() {
        {
            put(0, "Team");
            put(1, "Tip");
            put(2, "FreeBoard");
            put(9, "Notice");
        }
    };
    //-------------------김정태 추가----------------
    @Inject
	private SqlSession sqlSession;

	private static String namespace = "com.hobby.mappers.board";
	//------------------------------------------
	private JdbcTemplate template;
	public BoardDao() {  //ComboPool�쓣 �씠�슜�븯�뿬 DB�젒洹�

		dataSource = new ComboPooledDataSource();
		try {
			dataSource.setDriverClass(driver);
			dataSource.setJdbcUrl(url);
			dataSource.setUser(userid);
			dataSource.setPassword(userpw);
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}

		template = new JdbcTemplate();
		template.setDataSource(dataSource);
	}



//	public int memberRemove(VOBoard member) {
//		int result = 0;
//
//		final String sql = "DELETE from member_ WHERE memId = ? AND memPw=?";
//		result = template.update(sql,member.getMemId(),member.getMemPw());
//
//
//		return result;
//
//	}
	public List<VOBoard> boardRead() {
		List<VOBoard> boards = null;

		//媛� 寃뚯떆�뙋 留덈떎�쓽 �뙎湲� �닔瑜� �룷�븿�븳 �젙蹂� select
		final String sql = "select m.*,count(c.dno) dnoCount from board as m LEFT join `comment` as c  ON  m.bdCno=c.dno group by m.bdCno";
		// select * from mainboard
		//select m.*,count(C.dno) from mainboard as m LEFT join `comment` as c  ON  m.count=c.dno
		boards = template.query(sql, new Object[]{}, new RowMapper<VOBoard>() {

			@Override
			public VOBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
				VOBoard board = new VOBoard();
				board.setBdName(rs.getString("bdName"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setBdContent(rs.getString("bdContent"));
				board.setBdHit(rs.getInt("bdHit"));
				board.setBdDate(rs.getTimestamp("bdDate"));
				board.setBdCno(rs.getInt("bdCno"));
				board.setBdCategory(categorys.get(rs.getInt("bdCategory")));

				return board;

			}

		});

		if(boards.isEmpty()) {
			System.out.println("board is null");
			return null;
		}
		return boards;

	}


	public List<VOBoard> boardRead(int value,String category) {
		List<VOBoard> boards = null;
		String sql="";
		if(category.equals("Team")) {
			 sql = "SELECT * FROM board WHERE bdCategory=0 AND bdValue="+value;  // bdValue=0�씠硫� e�뒪�룷痢� 寃뚯떆�뙋留� 媛��졇�샂
		}
		else if(category.equals("Tip")) {
			sql = "SELECT * FROM board WHERE bdCategory=1 AND bdValue="+value;
		}
		else if(category.equals("FreeBoard")) {
			sql = "SELECT * FROM board WHERE bdCategory=2 AND bdValue="+value;
		}
		else if(category.equals("QA")) {
			sql = "SELECT * FROM board WHERE bdCategory=3 AND bdValue="+value;
		}
		else if(category.equals("Notice")) {
			sql = "SELECT * FROM board WHERE bdCategory=9 AND bdValue="+value;
		}
		else {
			System.out.println("select�뿉�윭"); 
			return null;
		}

		boards = template.query(sql, new Object[]{}, new RowMapper<VOBoard>() {

			@Override
			public VOBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
				VOBoard board = new VOBoard();
				board.setBdName(rs.getString("bdName"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setBdContent(rs.getString("bdContent"));
				board.setBdHit(rs.getInt("bdHit"));
				board.setBdDate(rs.getTimestamp("bdDate"));
				board.setBdCno(rs.getInt("bdcno"));
				board.setBdCategory(categorys.get(rs.getInt("bdCategory")));

				return board;
			}

		});

		if(boards.isEmpty()) {
			System.out.println("board is null");
			return null;
		}
		return boards;

	}



	public int boardInsert(final VOBoard board) {
		int result = 0;
//		HttpServletRequest request = getCurrentRequest();
//		HttpSession session = request.getSession();     濡쒓렇�씤 湲곕뒫 援ы쁽�릺硫� 洹몃븣 �궗�슜
//		VOMember member = (VOMember) session.getAttribute("member");
//		if(member!=null) {  //�꽭�뀡�씠 �뾾�쑝硫� 濡쒓렇�씤 �긽�깭媛� �븘�떂
//			final String sql = "INSERT INTO mainboard (name, title,content,category) values (?,?,?,?)";
//			// 移댄뀒怨좊━媛� Team�씠硫� 0 Tip�씠硫� 1 FreeBoard硫� 3 �븘�땲硫� null
//			int category=(board.getCategory().equals("Team"))?0:(board.getCategory().equals("Tip"))?1:
//				(board.getCategory().equals("FreeBoard"))?2:null;
//			result = template.update(sql,"testId",board.getTitle(),board.getContent(),category);
//
//
//		}
//		else {
//			System.out.println("Not Found Session");
//			return 0;
//		}
		final String sql = "INSERT INTO board (bdName, bdTitle,bdContent,bdCategory,bdValue) values (?,?,?,?,?)";
		// 移댄뀒怨좊━媛� Team�씠硫� 0 Tip�씠硫� 1 FreeBoard硫� 2 吏덈Ц�씠硫� 3 �븘�땲硫� null
		int category=(board.getBdCategory().equals("Team"))?0:(board.getBdCategory().equals("Tip"))?1:
			(board.getBdCategory().equals("FreeBoard"))?2:(board.getBdCategory().equals("QA"))?3:(board.getBdCategory().equals("Notice"))?9:null;
		result = template.update(sql,"testId",board.getBdTitle(),board.getBdContent(),category,board.getValue());


		return result;
	}


	public static HttpServletRequest getCurrentRequest() {// 濡쒓렇�씤 �꽭�뀡 �솗�씤�쓣 �쐞�븳 硫붿냼�뱶

	       ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder
	               .currentRequestAttributes();

	       HttpServletRequest hsr = sra.getRequest();

	       return hsr;
	   }



	public VOBoard detailRead(int cnt) {

	List<VOBoard> boards = null;

		final String sql = "SELECT * FROM board where bdCno=?";

		boards = template.query(sql, new Object[]{cnt}, new RowMapper<VOBoard>() {

			@Override
			public VOBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
				VOBoard board = new VOBoard();
				board.setBdName(rs.getString("bdName"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setBdContent(rs.getString("bdContent"));
				board.setBdHit(rs.getInt("bdHit"));
				board.setBdDate(rs.getTimestamp("bdDate"));
				board.setBdCno(rs.getInt("bdCno"));
				board.setBdLike(rs.getInt("bdLike"));
				board.setBdCategory(categorys.get(rs.getInt("bdCategory")));

				return board;
			}

		});

		if(boards.isEmpty()) {
			System.out.println("board is null");
			return null;
		}
		return boards.get(0);
	}


	public List<VOComment> detailComment(int cnt) {  // 寃뚯떆湲�留덈떎 �뙎湲� 異�
		List<VOComment> comments = null;
		incrementHit(cnt);
		final String sql = "SELECT * FROM `comment` where dno=?";
		comments = template.query(sql, new Object[]{cnt}, new RowMapper<VOComment>() {

			@Override
			public VOComment mapRow(ResultSet rs, int rowNum) throws SQLException {
				VOComment comment = new VOComment();

				comment.setComm_name(rs.getString("comm_name"));

				comment.setComm_content(rs.getString("comm_content"));

				comment.setComm_regDate(rs.getTimestamp("comm_regDate"));


				return comment;
			}

		});

		if(comments.isEmpty()) {
			System.out.println("board is null");
			return null;
		}
		return comments;

	}



	public int insertComment(VOComment comment) {

		int result = 0;
//		HttpServletRequest request = getCurrentRequest(); //�슂泥�媛� 媛��졇�삤湲�
//		HttpSession session = request.getSession();  // �꽭�뀡 遺덈윭�삤湲�
//		VOMember member = (VOMember) session.getAttribute("member");  // �샊�떆 紐곕씪�꽌 �꽭�뀡 泥댄겕 �븳踰� �뜑

//		if(member!=null) {  //�꽭�뀡�씠 �뾾�쑝硫� 濡쒓렇�씤 �긽�깭媛� �븘�떂
//			final String sql = "INSERT INTO comment (name,content,dno) values (?,?,?)";
//			// 移댄뀒怨좊━媛� Team�씠硫� 0 Tip�씠硫� 1 FreeBoard硫� 3 �븘�땲硫� null
//			result = template.update(sql,member.getMemId(),comment.getContent(),comment.getDno());
//
//
//		}
//		else {
//			System.out.println("Not Found Session");
//			return 0;
//		}
		final String sql = "INSERT INTO comment (comm_name,comm_content,dno) values (?,?,?)";

		result = template.update(sql,"testId",comment.getComm_content(),comment.getDno());

		return result;
	}



	public int boardUpdate(VOBoard board,int cnt) {
		int result=0;
		int category=(board.getBdCategory().equals("Team"))?0:(board.getBdCategory().equals("Tip"))?1:
			(board.getBdCategory().equals("FreeBoard"))?2:null; // 移댄뀒怨좊━ ���옣
		final String sql = "UPDATE board SET bdTitle = ? , bdContent = ? , bdCategory = ? WHERE bdCno = ?";
		System.out.println(sql);
		result = template.update(sql,board.getBdTitle(),board.getBdContent(),category,cnt);

		return result;
	}



	public int boardDelete(int cnt) {
		int result = 0;

		final String sql = "DELETE from board WHERE bdCno=?";
		result = template.update(sql,cnt);


		return result;
	}
	public void incrementHit(int cnt) { //議고쉶�닔 利앷� 硫붿냼�뱶
		int result=0;
		final String sql = "UPDATE board SET bdHit = bdHit+1 WHERE bdCno = ?";
		result = template.update(sql,cnt);

	}
	//-----------------------김정태 추가-----------------------------------------

	// 게시물 검색
	public List<VOBoard> listPageSearch(String keyword)
			throws Exception {


		String data = new String();

		data = keyword;

		return sqlSession.selectList(namespace + ".listPageSearch", data);
	}
	//검색된 게시물 총 갯수(0605추가)

	public int searchCount(String keyword) throws Exception {
		int test=sqlSession.selectOne(namespace + ".searchCount", keyword);

		System.out.println("test:"+test);
		return sqlSession.selectOne(namespace + ".searchCount", keyword);

	}

}
