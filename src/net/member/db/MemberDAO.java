package net.member.db;


import net.member.base64.base64;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class MemberDAO {


    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
//    DataSource ds; 
    String ds = "jdbc:oracle:thin:@localhost:1521:orcl";
    // 1踰�
    public MemberDAO() {
        try {
//            Context init = new InitialContext();
//            ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB/summer");
             Class.forName("oracle.jdbc.driver.OracleDriver");
             con = DriverManager.getConnection(ds, "summer", "1234");
             
        } catch (Exception e) {
            System.out.println("[1] DB 연결 실패 " + e);
            return;
        }
    }
    
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
    
    // 2踰�
    public int isMember(MemberBean member) {
		setConnect();
		Connection conTemp = getCon();
		
        try {
           
            pstmt = conTemp.prepareStatement("SELECT MEMBER_PW FROM MEMBERSHIP WHERE MEMBER_ID = ?");
            pstmt.setString(1, member.getMEMBER_ID());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getString("MEMBER_PW").equals(base64.encrypt256(member.getMEMBER_PW(),"project"))) {
                    return 1; // 일치
                } else {
                    return 0; // 비밀번호 불일치
                }
            } else {
                return -1; // 아이디가 존재 하지 않음
            }
        } catch (SQLException e) {
            System.out.println("[2] isMember 에러 " + e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conTemp != null) try { conTemp.close(); } catch (SQLException e) { e.printStackTrace(); }

        }
        return -2;
    }
    
    
    // 3踰�
    public int joinMember(MemberBean member) {
    	setConnect();
		Connection conTemp = getCon();
        int result = -1;
        try {
       
            pstmt = conTemp.prepareStatement("INSERT INTO MEMBERSHIP(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_AGE, MEMBER_GENDER, MEMBER_ADDRESS, MEMBER_PHONE, "
            		+ "MEMBER_EMAIL, MEMBER_INTEREST, MEMBER_RECENT_LOGIN, MEMBER_ROLE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, to_date(sysdate,'yyyy-mm-dd hh24:mi:ss'), 0)");
            pstmt.setString(1,member.getMEMBER_ID());
            pstmt.setString(2,base64.encrypt256(member.getMEMBER_PW(),"project"));
            pstmt.setString(3,member.getMEMBER_NAME());
            pstmt.setInt(4,member.getMEMBER_AGE());
            pstmt.setString(5,member.getMEMBER_GENDER());
            pstmt.setString(6,member.getMEMBER_ADDRESS());
            pstmt.setString(7,member.getMEMBER_PHONE());
            pstmt.setString(8,member.getMEMBER_EMAIL());
            pstmt.setString(9,member.getMEMBER_INTEREST());
   
            pstmt.executeUpdate();
            if (result != 0) {
                return 1;
            }

        } catch (SQLException e) {
            System.out.println("[3踰�] joinMember �뿉�윭 " + e);
            return -1;
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conTemp != null) try { conTemp.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return -1;
    }

    public int isAdmin(MemberBean member) {
    	setConnect();
		Connection conTemp = getCon();
        String sql="SELECT MEMBER_ROLE FROM MEMBERSHIP WHERE MEMBER_ID = ?";
        try {
            
            pstmt = conTemp.prepareStatement(sql);
            pstmt.setString(1,member.getMEMBER_ID());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getInt("MEMBER_ROLE") == 1) {
                    return 1;
                }
                return  0;
            }
        } catch (SQLException e) {
            System.out.println("isAdmin �뿉�윭 " + e);
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conTemp != null) try { conTemp.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return 0;
    }

    public int recentDate(MemberBean member) {
    	
    	setConnect();
		Connection conTemp = getCon();
		
        String sql= "UPDATE MEMBERSHIP set MEMBER_RECENT_LOGIN = to_date(sysdate,'yyyy-mm-dd hh24:mi:ss') WHERE MEMBER_ID = ?";
        int result = 0;

        try {
         
            pstmt = conTemp.prepareStatement(sql);
            pstmt.setString(1,member.getMEMBER_ID());
            result = pstmt.executeUpdate();

            if (result == 1) {
                return 0;
            }
            return 1;
        } catch (SQLException e) {
            System.out.println("recentDate 에러 " + e);
            return 1;
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conTemp != null) try { conTemp.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
    
    public List goMemberList() {
    	setConnect();
		Connection conTemp = getCon();
        String sql = "SELECT * FROM MEMBERSHIP";
        List memberlist = new ArrayList();

        try {
 
            pstmt = conTemp.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberBean mb = new MemberBean();
                mb.setMEMBER_ID(rs.getString("MEMBER_ID"));
                mb.setMEMBER_PW(rs.getString("MEMBER_PW"));
                mb.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
                mb.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
                mb.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
                mb.setMEMBER_ADDRESS(rs.getString("MEMBER_ADDRESS"));
                mb.setMEMBER_PHONE(rs.getString("MEMBER_PHONE"));
                mb.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
                mb.setMEMBER_INTEREST(rs.getString("MEMBER_INTEREST"));
                mb.setMEMBER_RECENT_LOGIN(rs.getDate("MEMBER_RECENT_LOGIN"));
                mb.setMEMBER_ROLE(rs.getInt("MEMBER_ROLE"));
                mb.setMEMBER_NOTIFY_COUNT(rs.getInt("MEMBER_NOTIFY_COUNT"));
                memberlist.add(mb);
            }
        } catch (SQLException e) {
            System.out.println("goMemberList 에러 " + e);
        } finally {
            try {
                if(rs != null)  rs.close();
                if(pstmt != null) pstmt.close();
                if(conTemp != null) conTemp.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return memberlist;
        }
    }

    public MemberBean memberInfo(String id) {
    	setConnect();
		Connection conTemp = getCon();

        String sql ="SELECT * FROM MEMBERSHIP WHERE MEMBER_ID = ?";

        try {

            pstmt = conTemp.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            rs.next();
            MemberBean md = new MemberBean();
            md.setMEMBER_ID(rs.getString("MEMBER_ID"));
            md.setMEMBER_PW(base64.decrypt256(rs.getString("MEMBER_PW"),"fiveTeam"));
            md.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
            md.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
            md.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
            md.setMEMBER_ADDRESS(rs.getString("MEMBER_ADDRESS"));
            md.setMEMBER_PHONE(rs.getString("MEMBER_PHONE"));
            md.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
            md.setMEMBER_INTEREST(rs.getString("MEMBER_INTEREST"));
            md.setMEMBER_NOTIFY_COUNT(rs.getInt("MEMBER_NOTIFY_COUNT"));
            return md;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null)  rs.close();
                if(pstmt != null) pstmt.close();
                if(conTemp != null) conTemp.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
//    public MemberBean getDetailMember(String id) {
//        String sql = "SELECT * FROM MEMBER2 WHERE MEMBER_ID = ?";
//
//        try {
//            con = ds.getConnection();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, id);
//            rs = pstmt.executeQuery();
//
//            rs.next();
//            MemberBean mb = new MemberBean();
//            mb.setMEMBER_ID(rs.getString("MEMBER_ID"));
//            mb.setMEMBER_PW(rs.getString("MEMBER_PW"));
//            mb.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
//            mb.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
//            mb.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
//            mb.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
//
//            return mb;
//        } catch (SQLException e) {
//            System.out.println("getDetailMember �뿉�윭 " + e);
//        } finally {
//            try {
//                if(rs != null)  rs.close();
//                if(pstmt != null) pstmt.close();
//                if(con != null) con.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return null;
//    }
//
    //    public boolean deleteMember(String id) {
//        String sql1 = "DELETE FROM MEMBERBOARD WHERE BOARD_ID = ?";
//        String sql2 = "DELETE FROM MEMBER2 WHERE MEMBER_ID = ?";
//        boolean isSuccess = false;
//        int result1 = 0;
//        int result2 = 0;
//
//        boolean result = false;
//        System.out.println("deleteId" + id);
//
//        try {
//            con = ds.getConnection();
//            con.setAutoCommit(false); /* �옄�룞 而ㅻ컠 醫낅즺 (�듃�옖�젥�뀡�쓣 �쐞�븯�뿬 �븿) */
//            pstmt = con.prepareStatement(sql1);
//            pstmt.setString(1,id);
//            result1 = pstmt.executeUpdate();
//
//            pstmt = con.prepareStatement(sql2);
//            pstmt.setString(1,id);
//            result2 = pstmt.executeUpdate();
//
//            if (result1 > 0 && result2 > 0) {
//                result = true;
//            }
//                isSuccess = true;
//        } catch (Exception e) {
//            System.out.println("deleteMember �뿉�윭 " + e);
//        } finally {
//            try {
//                if (isSuccess) {
//                    con.commit();
//                } else {
//                    con.rollback();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//            try {
//                if(pstmt != null) pstmt.close();
//                if(con != null) con.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return result;
//    }
    public boolean deleteMember(String id) {
    	
    	setConnect();
		Connection conTemp = getCon();
		
        String sql = "DELETE FROM MEMBERSHIP WHERE MEMBER_ID = ?";
        int result = 0;
        try {
      

            pstmt = conTemp.prepareStatement(sql);
            pstmt.setString(1,id);
            result = pstmt.executeUpdate();

            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("deleteMember �뿉�윭 " + e);
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(conTemp != null) conTemp.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public Boolean userId(String id) {
    	
		setConnect();
		Connection conTemp = getCon();
		
        String sql = "SELECT * FROM MEMBERSHIP WHERE MEMBER_ID = ?";
        try {
   
            pstmt = conTemp.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if (rs.next() || id.equals("")) {
                return false;
            }else {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conTemp != null) {
                	conTemp.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean membermodify(MemberBean memberdata) {
    	
		setConnect();
		Connection conTemp = getCon();
		
        String sql ="update MEMBERSHIP set MEMBER_PW=?, MEMBER_NAME=?,MEMBER_AGE=?,MEMBER_GENDER=?, MEMBER_ADDRESS=?, MEMBER_PHONE=?, MEMBER_EMAIL=?,MEMBER_INTEREST=? where MEMBER_ID=?";

        try{

            pstmt = conTemp.prepareStatement(sql);
            pstmt.setString(1, memberdata.getMEMBER_PW());
            pstmt.setString(2, memberdata.getMEMBER_NAME());
            pstmt.setInt(3, memberdata.getMEMBER_AGE());
            pstmt.setString(4, memberdata.getMEMBER_GENDER());
            pstmt.setString(5, memberdata.getMEMBER_ADDRESS());
            pstmt.setString(6, memberdata.getMEMBER_PHONE());
            pstmt.setString(7, memberdata.getMEMBER_EMAIL());
            pstmt.setString(8, memberdata.getMEMBER_INTEREST());
            pstmt.setString(9, memberdata.getMEMBER_ID());

            pstmt.executeQuery();

            return true;
        } catch (SQLException e) {
            System.out.println("[7] 실행오류 membermodify() :" + e);
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conTemp != null) {
                	conTemp.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
