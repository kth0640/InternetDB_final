package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import product.ProductDTO;
import util.DatabaseUtil;

public class ProductDAO {
	
	public int addProduct(ProductDTO product) { //회원가입
		String SQL = "INSERT INTO product VALUES(PRODUCT_SEQ.nextval,?,?,?,?,to_date(sysdate,'yyyy-mm-dd'),?)";
		//insert into product values(PRODUCT_SEQ.nextval, 'pknu1234', '제목',가격, '내용', 날짜,'url');
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, product.getUserID()); //sql의 첫번째 물음표에 넣는값 
			pstmt.setString(2, product.getTitle());
			pstmt.setString(3, product.getPrice());
			pstmt.setString(4, product.getContent());
			pstmt.setString(5, product.getImageUrl());
			return pstmt.executeUpdate(); //영향을 받은 데이터의 개수반환 1개이면 1 반환
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try{ if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{ if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;//상품등록 실패
	}
	 
}
