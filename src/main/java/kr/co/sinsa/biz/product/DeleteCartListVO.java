package kr.co.sinsa.biz.product;

public class DeleteCartListVO {
	private String userID;
	private int prdNum;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(int prdNum) {
		this.prdNum = prdNum;
	}
	@Override
	public String toString() {
		return "DeleteCartListVO [userID=" + userID + ", prdNum=" + prdNum + "]";
	}
	
	

}
