package com.daelim.hobby.Dao;
////int category=(board.getBdCategory().equals("Team"))?0:(board.getBdCategory().equals("Tip"))?1:
//(board.getBdCategory().equals("FreeBoard"))?2:null;  燁삳똾�믤�⑥쥓�봺 DB�뚎됱쓥占쎈퓠 占쏙옙占쎌삢 獄쎻뫗�뻼.
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

import com.daelim.hobby.Vo.MemberVO;
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
    //-------------------源��젙�깭 異붽�----------------
    @Inject
	private SqlSession sqlSession;

	private static String namespace = "com.hobby.mappers.board";
	//------------------------------------------
	private JdbcTemplate template;
	public BoardDao() {  //ComboPool占쎌뱽 占쎌뵠占쎌뒠占쎈릭占쎈연 DB占쎌젔域뱄옙

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

		//揶쏉옙 野껊슣�뻻占쎈솇 筌띾뜄�뼄占쎌벥 占쎈솊疫뀐옙 占쎈땾�몴占� 占쎈７占쎈맙占쎈립 占쎌젟癰귨옙 select
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
		int cate=(category.equals("Team"))?0:(category.equals("Tip"))?1:
			(category.equals("FreeBoard"))?2:(category.equals("QA"))?3:(category.equals("Notice"))?9:null;
		sql = String.format("SELECT * FROM board WHERE bdCategory='%d' AND bdValue=%d",cate,value);  // bdValue=0占쎌뵠筌롳옙 e占쎈뮞占쎈７筌ο옙 野껊슣�뻻占쎈솇筌랃옙 揶쏉옙占쎌죬占쎌긾
		System.out.println(cate);

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
		HttpServletRequest request = getCurrentRequest();
		HttpSession session = request.getSession();    // 嚥≪뮄�젃占쎌뵥 疫꿸퀡�뮟 �뤃�뗭겱占쎈┷筌롳옙 域밸챶釉� 占쎄텢占쎌뒠
		MemberVO member = (MemberVO) session.getAttribute("mVo");
		if(member!=null) {  //占쎄쉭占쎈�∽옙�뵠 占쎈씨占쎌몵筌롳옙 嚥≪뮄�젃占쎌뵥 占쎄맒占쎄묶揶쏉옙 占쎈툡占쎈뻷
			final String sql = "INSERT INTO board (bdName, bdTitle,bdContent,bdCategory,bdValue) values (?,?,?,?,?)";
			int category=(board.getBdCategory().equals("Team"))?0:(board.getBdCategory().equals("Tip"))?1:
				(board.getBdCategory().equals("FreeBoard"))?2:(board.getBdCategory().equals("QA"))?3:(board.getBdCategory().equals("Notice"))?9:null;
			result = template.update(sql,member.getMemId(),board.getBdTitle(),board.getBdContent(),category,board.getValue());



		}
		else {
			System.out.println("Not Found Session");
			return 0;
		}
		
		// 燁삳똾�믤�⑥쥓�봺揶쏉옙 Team占쎌뵠筌롳옙 0 Tip占쎌뵠筌롳옙 1 FreeBoard筌롳옙 2 筌욌뜄揆占쎌뵠筌롳옙 3 占쎈툡占쎈빍筌롳옙 null

		return result;
	}


	public static HttpServletRequest getCurrentRequest() {// 嚥≪뮄�젃占쎌뵥 占쎄쉭占쎈�� 占쎌넇占쎌뵥占쎌뱽 占쎌맄占쎈립 筌롫뗄�꺖占쎈굡

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


	public List<VOComment> detailComment(int cnt) {  // 野껊슣�뻻疫뀐옙筌띾뜄�뼄 占쎈솊疫뀐옙 �빊占�
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
		HttpServletRequest request = getCurrentRequest(); //占쎌뒄筌ｏ옙揶쏉옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
		HttpSession session = request.getSession();  // 占쎄쉭占쎈�� �겫�뜄�쑎占쎌궎疫뀐옙
		MemberVO member = (MemberVO) session.getAttribute("mVo");  // 占쎌깏占쎈뻻 筌뤾퀡�뵬占쎄퐣 占쎄쉭占쎈�� 筌ｋ똾寃� 占쎈립甕곤옙 占쎈쐭

		if(member!=null) {  //占쎄쉭占쎈�∽옙�뵠 占쎈씨占쎌몵筌롳옙 嚥≪뮄�젃占쎌뵥 占쎄맒占쎄묶揶쏉옙 占쎈툡占쎈뻷
			
			// 燁삳똾�믤�⑥쥓�봺揶쏉옙 Team占쎌뵠筌롳옙 0 Tip占쎌뵠筌롳옙 1 FreeBoard筌롳옙 3 占쎈툡占쎈빍筌롳옙 null
			final String sql = "INSERT INTO comment (comm_name,comm_content,dno) values (?,?,?)";
			result = template.update(sql,member.getMemId(),comment.getComm_content(),comment.getDno());

		}
		else {
			System.out.println("Not Found Session");
			return 0;
		}
		

		

		return result;
	}



	public int boardUpdate(VOBoard board,int cnt) {
		int result=0;
		int category=(board.getBdCategory().equals("Team"))?0:(board.getBdCategory().equals("Tip"))?1:
			(board.getBdCategory().equals("FreeBoard"))?2:null; // 燁삳똾�믤�⑥쥓�봺 占쏙옙占쎌삢
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
	public void incrementHit(int cnt) { //鈺곌퀬�돳占쎈땾 筌앹빓占� 筌롫뗄�꺖占쎈굡
		int result=0;
		final String sql = "UPDATE board SET bdHit = bdHit+1 WHERE bdCno = ?";
		result = template.update(sql,cnt);

	}
	//-----------------------源��젙�깭 異붽�-----------------------------------------

	// 寃뚯떆臾� 寃��깋
	public List<VOBoard> listPageSearch(String keyword)
			throws Exception {


		String data = new String();

		data = keyword;

		return sqlSession.selectList(namespace + ".listPageSearch", data);
	}
	//寃��깋�맂 寃뚯떆臾� 珥� 媛��닔(0605異붽�)

	public int searchCount(String keyword) throws Exception {
		int test=sqlSession.selectOne(namespace + ".searchCount", keyword);

		System.out.println("test:"+test);
		return sqlSession.selectOne(namespace + ".searchCount", keyword);

	}

}
