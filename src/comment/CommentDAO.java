package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import comment.CommentDTO;
import util.DatabaseUtil;

public class CommentDAO {
	public int addComment(CommentDTO comment) { //회원가입
		String SQL = "INSERT INTO comments VALUES(COMMENT_SEQ.nextval,?,?,?)";
		//insert into comments VALUES(PRODUCT_SEQ.nextval,?,?,?);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, comment.getProductID()); //sql의 첫번째 물음표에 넣는값 
			pstmt.setString(2, comment.getContent());
			pstmt.setString(3, comment.getUserID());
			
			
			return pstmt.executeUpdate(); //영향을 받은 데이터의 개수반환 1개이면 1 반환
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;//댓글등록 실패
	}
}
