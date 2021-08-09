package kr.co.sinsa.biz.user;

import java.sql.Date;

public class CustomerVO {
	public CustomerVO() {
		
	}
	
	private int CUS_NUM;
	private String CUS_ID;
	private String CUS_PWD;
	private String CUS_NAME;
	private String CUS_GENDER;
	private String CUS_EMAIL;
	private String CUS_ADDR;
	private String CUS_TEL;
	private String CUS_BIRTH;
	private String CUS_DELIV_ADDR;
	private int CUS_POINT;
	private Date CUS_REGDATE ;
	
	
	public int getCUS_NUM() {
		return CUS_NUM;
	}
	public void setCUS_NUM(int cUS_NUM) {
		CUS_NUM = cUS_NUM;
	}
	public String getCUS_ID() {
		return CUS_ID;
	}
	public void setCUS_ID(String cUS_ID) {
		CUS_ID = cUS_ID;
	}
	public String getCUS_PWD() {
		return CUS_PWD;
	}
	public void setCUS_PWD(String cUS_PWD) {
		CUS_PWD = cUS_PWD;
	}
	public String getCUS_NAME() {
		return CUS_NAME;
	}
	public void setCUS_NAME(String cUS_NAME) {
		CUS_NAME = cUS_NAME;
	}
	public String getCUS_GENDER() {
		return CUS_GENDER;
	}
	public void setCUS_GENDER(String cUS_GENDER) {
		CUS_GENDER = cUS_GENDER;
	}
	public String getCUS_EMAIL() {
		return CUS_EMAIL;
	}
	public void setCUS_EMAIL(String cUS_EMAIL) {
		CUS_EMAIL = cUS_EMAIL;
	}
	public String getCUS_ADDR() {
		return CUS_ADDR;
	}
	public void setCUS_ADDR(String cUS_ADDR) {
		CUS_ADDR = cUS_ADDR;
	}
	public String getCUS_TEL() {
		return CUS_TEL;
	}
	public void setCUS_TEL(String cUS_TEL) {
		CUS_TEL = cUS_TEL;
	}
	public String getCUS_BIRTH() {
		return CUS_BIRTH;
	}
	public void setCUS_BIRTH(String cUS_BIRTH) {
		CUS_BIRTH = cUS_BIRTH;
	}
	public String getCUS_DELIV_ADDR() {
		return CUS_DELIV_ADDR;
	}
	public void setCUS_DELIV_ADDR(String cUS_DELIV_ADDR) {
		CUS_DELIV_ADDR = cUS_DELIV_ADDR;
	}
	public int getCUS_POINT() {
		return CUS_POINT;
	}
	public void setCUS_POINT(int cUS_POINT) {
		CUS_POINT = cUS_POINT;
	}
	public Date getCUS_REGDATE() {
		return CUS_REGDATE;
	}
	public void setCUS_REGDATE(Date cUS_REGDATE) {
		CUS_REGDATE = cUS_REGDATE;
	}
	@Override
	public String toString() {
		return "CustomerVO [CUS_NUM=" + CUS_NUM + ", CUS_ID=" + CUS_ID + ", CUS_PWD=" + CUS_PWD + ", CUS_NAME="
				+ CUS_NAME + ", CUS_GENDER=" + CUS_GENDER + ", CUS_EMAIL=" + CUS_EMAIL + ", CUS_ADDR=" + CUS_ADDR
				+ ", CUS_TEL=" + CUS_TEL + ", CUS_BIRTH=" + CUS_BIRTH + ", CUS_DELIV_ADDR=" + CUS_DELIV_ADDR
				+ ", CUS_POINT=" + CUS_POINT + ", CUS_REGDATE=" + CUS_REGDATE + "]";
	}
	

}
