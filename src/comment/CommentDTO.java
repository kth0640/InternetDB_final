package comment;

public class CommentDTO {
	private int commentID;
	private int productID;
	private String content;
	private String userID;
	
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public CommentDTO() {
		
	}
	public CommentDTO(int commentID, int productID, String content, String userID) {
		super();
		this.commentID = commentID;
		this.productID = productID;
		this.content = content;
		this.userID = userID;
	}
	
	
	
	
}
