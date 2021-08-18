package kr.co.sinsa.biz.customer;

import java.util.Date;

public class MyOrderListVO {

private String ORDER_NUM;
private String ORDER_PRDNAME;
private String ORDER_PRDSIZE;
private int ORDER_AMOUNT;
private int ORDER_PRICE;
private String ORDER_STATE;
private Date ORDER_REGDATE;
private String ORDER_PRDCODE;
private String PRD_BRAND;
private String PRD_IMAGE;
private String ORDER_DELIVCOMP;
private String ORDER_DELIVNUM;
private int ORDER_USEPOINT ;


public int getORDER_AMOUNT() {
	return ORDER_AMOUNT;
}
public void setORDER_AMOUNT(int oRDER_AMOUNT) {
	ORDER_AMOUNT = oRDER_AMOUNT;
}
public String getORDER_DELIVCOMP() {
	return ORDER_DELIVCOMP;
}
public void setORDER_DELIVCOMP(String oRDER_DELIVCOMP) {
	ORDER_DELIVCOMP = oRDER_DELIVCOMP;
}
public String getORDER_DELIVNUM() {
	return ORDER_DELIVNUM;
}
public void setORDER_DELIVNUM(String oRDER_DELIVNUM) {
	ORDER_DELIVNUM = oRDER_DELIVNUM;
}
public int getORDER_USEPOINT() {
	return ORDER_USEPOINT;
}
public void setORDER_USEPOINT(int oRDER_USEPOINT) {
	ORDER_USEPOINT = oRDER_USEPOINT;
}
public String getORDER_NUM() {
	return ORDER_NUM;
}
public void setORDER_NUM(String oRDER_NUM) {
	ORDER_NUM = oRDER_NUM;
}
public String getORDER_PRDNAME() {
	return ORDER_PRDNAME;
}
public void setORDER_PRDNAME(String oRDER_PRDNAME) {
	ORDER_PRDNAME = oRDER_PRDNAME;
}
public String getORDER_PRDSIZE() {
	return ORDER_PRDSIZE;
}
public void setORDER_PRDSIZE(String oRDER_PRDSIZE) {
	ORDER_PRDSIZE = oRDER_PRDSIZE;
}
public int getORDER_PRICE() {
	return ORDER_PRICE;
}
public void setORDER_PRICE(int oRDER_PRICE) {
	ORDER_PRICE = oRDER_PRICE;
}
public String getORDER_STATE() {
	return ORDER_STATE;
}
public void setORDER_STATE(String oRDER_STATE) {
	ORDER_STATE = oRDER_STATE;
}
public Date getORDER_REGDATE() {
	return ORDER_REGDATE;
}
public void setORDER_REGDATE(Date oRDER_REGDATE) {
	ORDER_REGDATE = oRDER_REGDATE;
}
public String getORDER_PRDCODE() {
	return ORDER_PRDCODE;
}
public void setORDER_PRDCODE(String oRDER_PRDCODE) {
	ORDER_PRDCODE = oRDER_PRDCODE;
}
public String getPRD_BRAND() {
	return PRD_BRAND;
}
public void setPRD_BRAND(String pRD_BRAND) {
	PRD_BRAND = pRD_BRAND;
}
public String getPRD_IMAGE() {
	return PRD_IMAGE;
}
public void setPRD_IMAGE(String pRD_IMAGE) {
	PRD_IMAGE = pRD_IMAGE;
}

	 
}
