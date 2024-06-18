package product;

public class ProductDTO {	
	private int productID;
	private String userID;
	private String title;
	private String price;
	private String content;
	private int createdAt;
	private String imageUrl;
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(int createdAt) {
		this.createdAt = createdAt;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public ProductDTO() {
		
	}
	public ProductDTO(int productID, String userID, String title, String price, String content, int createdAt,
			String imageUrl) {
		super();
		this.productID = productID;
		this.userID = userID;
		this.title = title;
		this.price = price;
		this.content = content;
		this.createdAt = createdAt;
		this.imageUrl = imageUrl;
	}
	
	
	
}