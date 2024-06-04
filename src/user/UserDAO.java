package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USERTABLE WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //로그인 실패
				}
			}
			
			return -1; //id 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally{ //자원 반환
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -2; //데이터베이스오류
		
	}
	
	public int join(UserDTO user) { //회원가입
		String SQL = "INSERT INTO USERTABLE VALUES(?,?,?,?,?)";
		//INSERT INTO USERLIST VALUES(userID, userPassword, userEmail, phone, adress)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID()); //sql의 첫번째 물음표에 넣는값 
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAdress());
			return pstmt.executeUpdate(); //영향을 받은 데이터의 개수반환 1명이면 1 반환
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;//회원가입 실패
	}
	
	
}
