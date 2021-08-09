package kr.co.sinsa.biz.user;

import java.sql.Date;

public class UserVO {
	public UserVO() {
		
	}
	
	private String CUS_ID;
	private String CUS_NAME;
	
	public String getCUS_ID() {
		return CUS_ID;
	}
	public void setCUS_ID(String cUS_ID) {
		CUS_ID = cUS_ID;
	}
	public String getCUS_NAME() {
		return CUS_NAME;
	}
	public void setCUS_NAME(String cUS_NAME) {
		CUS_NAME = cUS_NAME;
	}
	@Override
	public String toString() {
		return "UserVO [CUS_ID=" + CUS_ID + ", CUS_NAME=" + CUS_NAME + "]";
	}
	

}
