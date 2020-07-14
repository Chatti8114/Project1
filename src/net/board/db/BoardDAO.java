package net.board.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
//      DataSource ds; 
	String ds = "jdbc:oracle:thin:@localhost:1521:orcl";

	/*
	 * public BoardDAO() { try { // Context init = new InitialContext(); // ds =
	 * (DataSource) init.lookup("java:comp/env/jdbc/OracleDB/summer");
	 * Class.forName("oracle.jdbc.driver.OracleDriver"); con =
	 * DriverManager.getConnection(ds, "summer", "1234");
	 * 
	 * } catch (Exception e) { System.out.println("[1] DB 연결 실패 " + e); return; } }
	 */

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public boolean setConnect() {

		try {
//              Context init = new InitialContext();
//              ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB/summer");
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Connection conTemp = getCon();

			if (Objects.isNull(conTemp)) {
				conTemp = DriverManager.getConnection(ds, "summer", "1234");
				setCon(conTemp);
			}

			return true;

		} catch (SQLException e) {

			System.out.println("[1] DB 연결 실패 " + e);

			return false;

		}
	}

	public boolean closeConnect() {

		try {

			Connection conTemp = getCon();

			if (conTemp != null)
				conTemp.close();
			
			setCon(null);

			return true;

		} catch (SQLException e) {
			System.out.println("[2] DB close 실패 " + e);
			return false;
		}
	}

	//
	public int getListCount() {
		int x = 0;
		setConnect();
		Connection conTemp = getCon();

		try {

			pstmt = conTemp.prepareStatement("select count(*) from BOARDTABLE");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 실패 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return x;
	}

	@SuppressWarnings("finally")
	public List getBoardList(int page, int limit) {

		setConnect();
		Connection conTemp = getCon();

		String board_list_sql = "select * from "
				+ "(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_DATE, BOARD_TITLE, BOARD_CATEGORY, BOARD_PRICE, BOARD_AREA, BOARD_STATE, BOARD_REFUND , BOARD_DELIVERY "
				+ ", BOARD_FILE1, BOARD_FILE2 ,BOARD_FILE3,BOARD_RE_REF, BOARD_RE_LEV,"
				+ "BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_SOLD_OUT from " + "(select * from BOARDTABLE order by "
				+ "BOARD_RE_REF desc, BOARD_RE_SEQ asc)) " + "where rnum>=? and rnum<=?";

		@SuppressWarnings("rawtypes")
		List list = new ArrayList();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;

		try {

			pstmt = conTemp.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				board.setBOARD_ID(rs.getString("BOARD_ID"));
				board.setBOARD_CATEGORY(rs.getString("BOARD_CATEGORY"));
				board.setBOARD_PRICE(rs.getString("BOARD_PRICE"));
				board.setBOARD_AREA(rs.getString("BOARD_AREA"));
				board.setBOARD_STATE(rs.getString("BOARD_STATE"));
				board.setBOARD_REFUND(rs.getString("BOARD_REFUND"));
				board.setBOARD_DELIVERY(rs.getString("BOARD_DELIVERY"));
				board.setBOARD_FILE1(rs.getString("BOARD_FILE1"));
				board.setBOARD_FILE2(rs.getString("BOARD_FILE2"));
				board.setBOARD_FILE3(rs.getString("BOARD_FILE3"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				board.setBOARD_SOLD_OUT((rs.getString("BOARD_SOLD_OUT")));

				list.add(board);

			}

		} catch (SQLException e) {
			System.out.println("getBoardList 실패 : " + e);
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conTemp != null)
				closeConnect();

			return list;
		}
	}

	public boolean boardInsert(BoardBean board) {
//            int num = 0;
		setConnect();
		Connection conTemp = getCon();
		String sql = "";
		int result = 0;

		try {

//                pstmt = con.prepareStatement("SELECT MAX(BOARD_NUM) FROM BOARDTABLE");
//                rs = pstmt.executeQuery();

//                if (rs.next()) num = rs.getInt(1) + 1;
//                else num = 1;

			pstmt = conTemp.prepareStatement(
					"INSERT INTO BOARDTABLE VALUES (BBSNUM.nextval,?,?,?,sysdate,?,?,?,?,?,?,?,?,?,BBSNUM.currval,0,0,0,0,?,?,?)");
//                pstmt.setInt(1,num);
			pstmt.setString(1, board.getBOARD_TITLE());
			pstmt.setString(2, board.getBOARD_CONTENT());
			pstmt.setString(3, board.getBOARD_ID());
			pstmt.setString(4, board.getBOARD_CATEGORY());
			pstmt.setString(5, board.getBOARD_PRICE());
			pstmt.setString(6, board.getBOARD_FILE1());
			pstmt.setString(7, board.getBOARD_FILE2());
			pstmt.setString(8, board.getBOARD_FILE3());
			pstmt.setString(9, board.getBOARD_STATE());
			pstmt.setString(10, board.getBOARD_REFUND());
			pstmt.setString(11, board.getBOARD_DELIVERY());
			pstmt.setString(12, board.getBOARD_AREA());
			pstmt.setString(13, board.getBOARD_OG_FILE1());
			pstmt.setString(14, board.getBOARD_OG_FILE2());
			pstmt.setString(15, board.getBOARD_OG_FILE3());
			result = pstmt.executeUpdate();

			if (result == 0)
				return false;

			return true;

		} catch (SQLException e) {
			System.out.println("boardInsert DAO 실패 " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conTemp != null)
					closeConnect();
			} catch (SQLException ex) {
			}
		}
		return false;
	}

	public void setReadCountUpdate(int num) throws Exception {
		setConnect();
		Connection conTemp = getCon();
		try {

			pstmt = conTemp.prepareStatement(
					"UPDATE BOARDTABLE SET BOARD_READCOUNT =  BOARD_READCOUNT + 1 WHERE BOARD_NUM = " + num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setReadCountUpdate 실패 " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conTemp != null)
					closeConnect();
			} catch (SQLException ex) {
			}
		}
	}

	//
	@SuppressWarnings("finally")
	public BoardBean getDetail(int num) throws Exception {
		BoardBean board = new BoardBean();
		setConnect();
		Connection conTemp = getCon();
		try {

			pstmt = conTemp.prepareStatement(
					"SELECT MEMBER_NAME, MEMBER_PHONE, MEMBER_AGE FROM MEMBERSHIP WHERE MEMBER_ID = (SELECT BOARD_ID FROM BOARDTABLE WHERE BOARD_NUM = ?)");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			board.setBOARD_MEMBER_NAME(rs.getString("MEMBER_NAME"));
			board.setBOARD_MEMBER_PHONE(rs.getString("MEMBER_PHONE"));
			board.setBOARD_MEMBER_AGE(rs.getString("MEMBER_AGE"));
			System.out.println("실행됨");

			pstmt = conTemp.prepareStatement("SELECT * FROM BOARDTABLE WHERE BOARD_NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_ID(rs.getString("BOARD_ID"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				board.setBOARD_CATEGORY(rs.getString("BOARD_CATEGORY"));
				board.setBOARD_PRICE(rs.getString("BOARD_PRICE"));
				board.setBOARD_FILE1(rs.getString("BOARD_FILE1"));
				board.setBOARD_FILE2(rs.getString("BOARD_FILE2"));
				board.setBOARD_FILE3(rs.getString("BOARD_FILE3"));
				board.setBOARD_STATE(rs.getString("BOARD_STATE"));
				board.setBOARD_REFUND(rs.getString("BOARD_REFUND"));
				board.setBOARD_DELIVERY(rs.getString("BOARD_DELIVERY"));
				board.setBOARD_AREA(rs.getString("BOARD_AREA"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_SOLD_OUT((rs.getString("BOARD_SOLD_OUT")));
				board.setBOARD_OG_FILE1(rs.getString("BOARD_OG_FILE1"));
				board.setBOARD_OG_FILE2(rs.getString("BOARD_OG_FILE2"));
				board.setBOARD_OG_FILE3(rs.getString("BOARD_OG_FILE3"));
			}

		} catch (Exception e) {
			System.out.println("getDetail 실패 " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conTemp != null)
					closeConnect();
			} catch (SQLException ex) {
			}

			return board;
		}
	}

	public int boardReply(BoardReplyBean board) {

		setConnect();
		Connection conTemp = getCon();

		String board_max_sql = "select max(CB_NUM) from COMMENTBOARD";
		String sql = "";
		int num = 0;
		int result = 0;

//            int re_ref = board.getBOARD_RE_REF(); /*�쁽�옱 由ы뵆媛��닔*/
//            int re_lev = board.getBOARD_RE_LEV(); /*�쁽�옱 由ы뵆�쓽 �젅踰�*/
//            int re_seq = board.getBOARD_RE_SEQ(); /*�쁽�옱 由ы뵆�쓽 �떆���뒪*/

		try {

			pstmt = conTemp.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

//                pstmt = con.prepareStatement("UPDATE BOARDTABLE set BOARD_RE_REF = BOARD_RE_REF + 1 where BOARD_NUM = ?");
//                pstmt.setInt(1,board.getCB_RE_REF()); /* 寃뚯떆湲�踰덊샇 */

//                result = pstmt.executeUpdate();

//                if(result==0) return -1; /* �빐�떦 寃뚯떆湲��쓣 李얠쓣�닔 �뾾�뒿�땲�떎! */

			pstmt = conTemp.prepareStatement(
					"INSERT INTO COMMENTBOARD(CB_NUM, CB_ID, CB_CONTENT, CB_DATE, CB_RE_REF, CB_RE_LEV, CB_RE_SEQ) VALUES(?, ?, ?, SYSDATE, ?, 0, 0) ");
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getCB_ID());
			pstmt.setString(3, board.getCB_CONTENT());
			pstmt.setInt(4, board.getCB_RE_REF());
			result = pstmt.executeUpdate();

			System.out.println("2222--------------------------\n" + result);
			if (result != 0)
				return 1;

			System.out.println("3333--------------------------\n" + result);
			return 0;

		} catch (SQLException e) {
			System.out.println("[6번] 글 답변 에러 boardReply()�뿉�윭 : " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conTemp != null) {
					closeConnect();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public boolean isBoardWriter(int num, String board_id) {
		String sql = "select BOARD_ID from BOARDTABLE where board_num = ?";
		setConnect();
		Connection conTemp = getCon();
		try {

			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			rs.next();
			if (board_id.equals(rs.getString("BOARD_ID"))) {
				return true;
			}

		} catch (SQLException e) {
			System.out.println("[10번] isBoardWriter: " + e);
		} finally {
			try {
				rs.close();

				if (pstmt != null) {
					pstmt.close();
				}
				if (conTemp != null) {
					closeConnect();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public Boolean boardSoldOut(int num) {
		String sql = "UPDATE BOARDTABLE set BOARD_SOLD_OUT = 1 where BOARD_NUM = ?";
		int result = 0;
		setConnect();
		Connection conTemp = getCon();

		try {

			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();

			if (result != 0) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			System.out.println("boardSoldOut 실패 " + e);
			return false;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conTemp != null) {
					closeConnect();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean boardModify(BoardBean boarddata) {
		String sql = "update BOARDTABLE set BOARD_CATEGORY = ?, BOARD_TITLE = ?, BOARD_AREA = ?, BOARD_STATE = ?, BOARD_PRICE = ?, BOARD_REFUND = ?, BOARD_DELIVERY = ?, BOARD_CONTENT = ?, BOARD_FILE1 = ?, BOARD_FILE2 = ?, BOARD_FILE3 = ? where board_num = ?";
		int result = 0;
		setConnect();
		Connection conTemp = getCon();

		try {

			pstmt = conTemp.prepareStatement(sql);
			pstmt.setString(1, boarddata.getBOARD_CATEGORY());
			pstmt.setString(2, boarddata.getBOARD_TITLE());
			pstmt.setString(3, boarddata.getBOARD_AREA());
			pstmt.setString(4, boarddata.getBOARD_STATE());
			pstmt.setString(5, boarddata.getBOARD_PRICE());
			pstmt.setString(6, boarddata.getBOARD_REFUND());
			pstmt.setString(7, boarddata.getBOARD_DELIVERY());
			pstmt.setString(8, boarddata.getBOARD_CONTENT());
			pstmt.setString(9, boarddata.getBOARD_FILE1());
			pstmt.setString(10, boarddata.getBOARD_FILE2());
			pstmt.setString(11, boarddata.getBOARD_FILE3());
			pstmt.setInt(12, boarddata.getBOARD_NUM());

			result = pstmt.executeUpdate();

			if (result != 0)
				return true;
			return false;
		} catch (SQLException e) {
			System.out.println("[7번] 실행오류 boardModify() :" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conTemp != null) {
					closeConnect();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean boardDelete(int num) {
		String sql_delete_sql = "delete from BOARDTABLE where board_num = ?";
		int result = 0;

		setConnect();
		Connection conTemp = getCon();

		try {

			pstmt = conTemp.prepareStatement(sql_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();

			if (result == 0)
				return false; /* 由ы꽩�씠 �릺硫� �씠 諛묒쑝濡� �븞�궡�젮媛�怨� �븿�닔媛� 醫낅즺�맖 */

			return true;
		} catch (SQLException e) {
			System.out.println("[8번] boardDelete : " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conTemp != null) {
					closeConnect();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public int getNotifyListCount() {
		int x = 0;
		setConnect();
		Connection conTemp = getCon();
		try {
			pstmt = conTemp.prepareStatement("select count(*) from NOTIFY_BOARD");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getNotifyListCount 실패 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
			}
		return x;
	}

	public int notifyInsert(BoardNotifyBean boarddata) {
		int num = 0;
		int result = 0;
		
		setConnect();
		Connection conTemp = getCon();
		
		try {

			pstmt = conTemp.prepareStatement("SELECT * FROM NOTIFY_BOARD WHERE NB_ID = ? AND NB_RE_REF = ?");
			pstmt.setString(1, boarddata.getNB_ID());
			pstmt.setInt(2, boarddata.getNB_RE_REF());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 0;
			}

			pstmt = conTemp.prepareStatement("SELECT MAX(NB_NUM) FROM NOTIFY_BOARD");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			pstmt = conTemp.prepareStatement("INSERT INTO NOTIFY_BOARD VALUES (?, ?, ?, sysdate, ?, 0, ?)");
			pstmt.setInt(1, num);
			pstmt.setString(2, boarddata.getNB_CONTENT());
			pstmt.setString(3, boarddata.getNB_ID());
			pstmt.setInt(4, boarddata.getNB_RE_REF());
			pstmt.setString(5, boarddata.getNB_REASON());

			result = pstmt.executeUpdate();

			pstmt = conTemp.prepareStatement(
					"UPDATE MEMBERSHIP SET MEMBER_NOTIFY_COUNT = MEMBER_NOTIFY_COUNT + 1 WHERE MEMBER_ID = ?");
			System.out.println("신고자 아이디 : " + boarddata.getNB_ID());
			System.out.println("신고 대상자의 아이디 : " + boarddata.getNB_TARGET_ID());
			pstmt.setString(1, boarddata.getNB_TARGET_ID());
			pstmt.executeUpdate();

			if (result != 0)
				return 1;

			return -1;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				;
				if (pstmt != null) {
					pstmt.close();
				}
				if (conTemp != null) {
					closeConnect();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -2;
	}

	public String getNewBoard() {
		String sql = "SELECT * FROM (SELECT BOARD_NUM, BOARD_FILE1 , BOARD_FILE2,  BOARD_FILE3, BOARD_TITLE from BOARDTABLE order by BOARD_DATE desc) where rownum< = ?";
		String msg = null;
		setConnect();
		Connection conTemp = getCon();
		
		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, 12); // 출력갯수
			rs = pstmt.executeQuery();
			msg = "[";
			while (rs.next()) {
				String images = rs.getString(2) != null ? rs.getString(2)
						: (rs.getString(3) != null ? rs.getString(3)
								: (rs.getString(4) != null ? rs.getString(4) : "noneImage.jpg"));
				if (!rs.isFirst())
					msg += ",";
				msg += "{";
				msg += "\"num\" : \"" + rs.getString(1) + "\","; /* 게시글번호 */
				msg += "\"image\" : \"boardupload/" + images + "\","; /* 파일명 */
				msg += "\"title\" : \"" + rs.getString(5) + "\""; /* 게시글제목 */
				msg += "}";
			}
			msg += "]";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}

	public String getCloth() {
		setConnect();
		Connection conTemp = getCon();
		
		String sql = "select BOARD_NUM, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_TITLE from (select * from BOARDTABLE order by BOARD_READCOUNT desc) where rownum<=? and BOARD_CATEGORY= ? and BOARD_DATE>sysdate - ?";
		String msg = null;
		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, 4); /* 출력 갯수 */
			pstmt.setString(2, "옷"); /* 카테고리 */
			pstmt.setInt(3, 7); /* 7일 이내 */
			rs = pstmt.executeQuery();
			msg = "[";
			while (rs.next()) {
				String images = rs.getString(2) != null ? rs.getString(2)
						: (rs.getString(3) != null ? rs.getString(3)
								: (rs.getString(4) != null ? rs.getString(4) : "noneImage.jpg"));
				if (!rs.isFirst())
					msg += ",";
				msg += "{";
				msg += "\"num\" : \"" + rs.getString(1) + "\","; /* 게시글번호 */
				msg += "\"image\" : \"boardupload/" + images + "\",";/* 파일명 */
				msg += "\"title\" : \"" + rs.getString(5) + "\""; /* 게시글제목 */
				msg += "}";
			}
			msg += "]";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}

	public String getAppliances() {
		setConnect();
		Connection conTemp = getCon();
		String sql = "select BOARD_NUM, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_TITLE from (select * from BOARDTABLE order by BOARD_READCOUNT desc) where rownum<=? and BOARD_CATEGORY= ? and BOARD_DATE>sysdate - ?";
		String msg = null;
		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, 4);/* 출력 갯수 */
			pstmt.setString(2, "가전기기"); /* 카테고리 */
			pstmt.setInt(3, 7);/* 7일 이내 */
			rs = pstmt.executeQuery();
			msg = "[";
			while (rs.next()) {
				String images = rs.getString(2) != null ? rs.getString(2)
						: (rs.getString(3) != null ? rs.getString(3)
								: (rs.getString(4) != null ? rs.getString(4) : "noneImage.jpg"));
				if (!rs.isFirst())
					msg += ",";
				msg += "{";
				msg += "\"num\" : \"" + rs.getString(1) + "\",";
				msg += "\"image\" : \"boardupload/" + images + "\",";
				msg += "\"title\" : \"" + rs.getString(5) + "\"";
				msg += "}";
			}
			msg += "]";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}

	public String getTicket() {
		setConnect();
		Connection conTemp = getCon();
		
		String sql = "select BOARD_NUM, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_TITLE from (select * from BOARDTABLE order by BOARD_READCOUNT desc) where rownum<=? and BOARD_CATEGORY= ? and BOARD_DATE>sysdate - ?";
		String msg = null;
		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, 4);
			pstmt.setString(2, "티켓");
			pstmt.setInt(3, 7);
			rs = pstmt.executeQuery();
			msg = "[";
			while (rs.next()) {
				String images = rs.getString(2) != null ? rs.getString(2)
						: (rs.getString(3) != null ? rs.getString(3)
								: (rs.getString(4) != null ? rs.getString(4) : "noneImage.jpg"));
				if (!rs.isFirst())
					msg += ",";
				msg += "{";
				msg += "\"num\" : \"" + rs.getString(1) + "\","; /* 寃뚯떆湲�踰덊샇 */
				msg += "\"image\" : \"boardupload/" + images + "\","; /* �뙆�씪紐� */
				msg += "\"title\" : \"" + rs.getString(5) + "\""; /* 寃뚯떆湲��젣紐� */
				msg += "}";
			}
			msg += "]";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}

	public String getHouseholdGoods() {
		setConnect();
		Connection conTemp = getCon();
		
		String sql = "select BOARD_NUM, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_TITLE from (select * from BOARDTABLE order by BOARD_READCOUNT desc) where rownum<=? and BOARD_CATEGORY= ? and BOARD_DATE>sysdate - ?";
		String msg = null;
		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, 4); /* 異쒕젰 媛��닔 */
			pstmt.setString(2, "생활용품"); /* 移댄뀒怨좊━ */
			pstmt.setInt(3, 7); /* 7�씪 �씠�궡 */
			rs = pstmt.executeQuery();
			msg = "[";
			while (rs.next()) {
				String images = rs.getString(2) != null ? rs.getString(2)
						: (rs.getString(3) != null ? rs.getString(3)
								: (rs.getString(4) != null ? rs.getString(4) : "noneImage.jpg"));
				if (!rs.isFirst())
					msg += ",";
				msg += "{";
				msg += "\"num\" : \"" + rs.getString(1) + "\","; /* 寃뚯떆湲�踰덊샇 */
				msg += "\"image\" : \"boardupload/" + images + "\","; /* �뙆�씪紐� */
				msg += "\"title\" : \"" + rs.getString(5) + "\""; /* 寃뚯떆湲��젣紐� */
				msg += "}";
			}
			msg += "]";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}

	public String getEtc() {
		
		setConnect();
		Connection conTemp = getCon();
		
		String sql = "select BOARD_NUM, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_TITLE from (select * from BOARDTABLE order by BOARD_READCOUNT desc) where rownum<=? and BOARD_CATEGORY= ? and BOARD_DATE>sysdate - ? ";
		String msg = null;
		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, 4); /* 異쒕젰 媛��닔 */
			pstmt.setString(2, "기타"); /* 移댄뀒怨좊━ */
			pstmt.setInt(3, 7); /* 7�씪 �씠�궡 */
			rs = pstmt.executeQuery();
			msg = "[";
			while (rs.next()) {
				String images = rs.getString(2) != null ? rs.getString(2)
						: (rs.getString(3) != null ? rs.getString(3)
								: (rs.getString(4) != null ? rs.getString(4) : "noneImage.jpg"));
				if (!rs.isFirst())
					msg += ",";
				msg += "{";
				msg += "\"num\" : \"" + rs.getString(1) + "\","; /* 寃뚯떆湲�踰덊샇 */
				msg += "\"image\" : \"boardupload/" + images + "\","; /* �뙆�씪紐� */
				msg += "\"title\" : \"" + rs.getString(5) + "\""; /* 寃뚯떆湲��젣紐� */
				msg += "}";
			}
			msg += "]";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}

	public String getReply(int cb_num, int b_num) {
		setConnect();
		Connection conTemp = getCon();
		
		String sql = "select * from (SELECT rownum rnn, CB_NUM, CB_ID, CB_CONTENT, CB_DATE, CB_RE_REF, CB_RE_LEV, CB_RE_SEQ FROM COMMENTBOARD WHERE CB_RE_REF = ?) where rnn >= ? and rnn <= ?";
		String msg = null;

		try {
			pstmt = conTemp.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.setInt(2, cb_num);
			pstmt.setInt(3, cb_num + 5); /* 가져올 댓글 수 */
			rs = pstmt.executeQuery();

			msg = "[";
			while (rs.next()) {
				if (!rs.isFirst())
					msg += ","; /* rs가 첫번째가 아닐 때 마다 반복한다 */
//                    String dateCalc = net.board.timeCalc.timeCalc.formatTimeString(new Date(""+rs.getTimestamp(5)));
//                        String sqlDate=""+rs.getDate(4);
				BoardReplyBean board = new BoardReplyBean(); /* 빈즈를 이용해서 하는 방법밖에 외에는 전부 오류 발생함.. */
				board.setCB_PRINT_DATE(rs.getTimestamp(5));
				String dateCalc = net.board.timeCalc.timeCalc.formatTimeString(board.getCB_PRINT_DATE());

				msg += "{";
				msg += "\"num\" : \"" + rs.getInt(2) + "\",";
				msg += "\"id\" : \"" + rs.getString(3) + "\",";
				msg += "\"content\" : \"" + rs.getString(4) + "\",";
				msg += "\"date\" : \"" + dateCalc + "\",";
				msg += "\"ref\" : \"" + rs.getInt(6) + "\",";
				msg += "\"lev\" : \"" + rs.getInt(7) + "\",";
				msg += "\"seq\" : \"" + rs.getInt(8) + "\"";
				msg += "}";
			}
			msg += "]";
			return msg;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conTemp != null)
				closeConnect();
		}
		return null;
	}
}