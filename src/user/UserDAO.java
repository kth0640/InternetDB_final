package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
	
	public String findID(String userEmail, String phone) {
		
		String SQL = "SELECT userID FROM USERTABLE WHERE userEmail=? and phone=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String userID = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail); 
			pstmt.setString(2, phone); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				userID = rs.getString(1);
				return userID;
			}
			
			
			return "no ID"; //일치하는 정보 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally{ //자원 반환
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return "DB error"; //데이터베이스오류
		
	}
	
	public int existChangePassword(String userID, String userEmail ) {//비밀번호 변경할려는 사람 정보가 존재하는지 확인
		String SQL = "SELECT userID FROM USERTABLE WHERE userID=? and userEmail=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); 
			pstmt.setString(2, userEmail); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
		
				return 1; // 정보가 DB에 존재
			}
				
			
			return -1; // 일치하는 정보 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally{ //자원 반환
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -2; //데이터베이스오류
		
	}
	
	public int resetPassword(String userID, String changePassword) {
		String SQL = "UPDATE usertable SET userPassword=? WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		//ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, changePassword); 
			pstmt.setString(2, userID); 
			int res = pstmt.executeUpdate();
			
			if(res>0) {
			
				return 1; // 비밀번호 재설정 성공
			}
				
			return -1; // 비밀번호 재설정 실패
			
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally{ //자원 반환
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			
		}
		
		return -2; //데이터베이스오류
	}

	public static ArrayList<String> showUserInfo(String userID) {
		ArrayList<String> userInfo =  new ArrayList<>();
		
		
		String SQL = "SELECT * FROM usertable WHERE userID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			
			rs.next();
		
			userInfo.add(rs.getString(1));
			userInfo.add(rs.getString(3));
			userInfo.add(rs.getString(4));
			userInfo.add(rs.getString(5));
			
			return userInfo;
			
		}catch(Exception e) {
			e.printStackTrace();
		
		}finally{ //자원 반환
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return null; //데이터베이스오류
		
		
				
	}
	
}
