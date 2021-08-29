package kr.co.sinsa.biz.customer;

import java.util.Date;

public class ReviewColorSizeVO {
	private int REV_NUM;
	private String REV_ORDERNUM;
	private String REV_ORDERPRDSIZE ;
	private Date REV_REGDATE;
	private String REV_CUSID;
	private String REV_PRDCODE;
	private String REV_TITLE; 
	private String REV_CONTENT; 
	private int REV_STAR;
	private String REV_IMAGE;
	
	private String ORDER_PRDSIZE;
	private String PRD_COLOR ;
	
	public String getPRD_NAME() {
		return PRD_NAME;
	}
	public void setPRD_NAME(String pRD_NAME) {
		PRD_NAME = pRD_NAME;
	}
	private String PRD_NAME ;
	
	
	public String getORDER_PRDSIZE() {
		return ORDER_PRDSIZE;
	}
	public void setORDER_PRDSIZE(String oRDER_PRDSIZE) {
		ORDER_PRDSIZE = oRDER_PRDSIZE;
	}
	public String getPRD_COLOR() {
		return PRD_COLOR;
	}
	public void setPRD_COLOR(String pRD_COLOR) {
		PRD_COLOR = pRD_COLOR;
	}
	public String getREV_ORDERNUM() {
		return REV_ORDERNUM;
	}
	public void setREV_ORDERNUM(String rEV_ORDERNUM) {
		REV_ORDERNUM = rEV_ORDERNUM;
	}
	public String getREV_ORDERPRDSIZE() {
		return REV_ORDERPRDSIZE;
	}
	public void setREV_ORDERPRDSIZE(String rEV_ORDERPRDSIZE) {
		REV_ORDERPRDSIZE = rEV_ORDERPRDSIZE;
	}
	public String getREV_TITLE() {
		return REV_TITLE;
	}
	public void setREV_TITLE(String rEV_TITLE) {
		REV_TITLE = rEV_TITLE;
	}
	public String getREV_CONTENT() {
		return REV_CONTENT;
	}
	public void setREV_CONTENT(String rEV_CONTENT) {
		REV_CONTENT = rEV_CONTENT;
	}
	public int getREV_NUM() {
		return REV_NUM;
	}
	public void setREV_NUM(int rEV_NUM) {
		REV_NUM = rEV_NUM;
	}
	public Date getREV_REGDATE() {
		return REV_REGDATE;
	}
	public void setREV_REGDATE(Date rEV_REGDATE) {
		REV_REGDATE = rEV_REGDATE;
	}
	public String getREV_CUSID() {
		return REV_CUSID;
	}
	public void setREV_CUSID(String rEV_CUSID) {
		REV_CUSID = rEV_CUSID;
	}
	public String getREV_PRDCODE() {
		return REV_PRDCODE;
	}
	public void setREV_PRDCODE(String rEV_PRDCODE) {
		REV_PRDCODE = rEV_PRDCODE;
	}
	public int getREV_STAR() {
		return REV_STAR;
	}
	public void setREV_STAR(int rEV_STAR) {
		REV_STAR = rEV_STAR;
	}
	public String getREV_IMAGE() {
		return REV_IMAGE;
	}
	public void setREV_IMAGE(String rEV_IMAGE) {
		REV_IMAGE = rEV_IMAGE;
	}


}
