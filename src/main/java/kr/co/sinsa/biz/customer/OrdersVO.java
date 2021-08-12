package kr.co.sinsa.biz.customer;

import java.util.Date;

public class OrdersVO {
private String ORDER_NUM;
private String ORDER_CUSID;
private String ORDER_PRDCODE;
private String ORDER_PRDNAME;
private String ORDER_PRDSIZE;
private String ORDER_RECEIVER;
private String ORDER_TEL;
private String ORDER_ADDR;
private int ORDER_PRICE;
private String ORDER_STATE;
private Date ORDER_REGDATE;


public String getORDER_PRDCODE() {
	return ORDER_PRDCODE;
}
public void setORDER_PRDCODE(String oRDER_PRDCODE) {
	ORDER_PRDCODE = oRDER_PRDCODE;
}
public String getORDER_NUM() {
	return ORDER_NUM;
}
public void setORDER_NUM(String oRDER_NUM) {
	ORDER_NUM = oRDER_NUM;
}
public String getORDER_CUSID() {
	return ORDER_CUSID;
}
public void setORDER_CUSID(String oRDER_CUSID) {
	ORDER_CUSID = oRDER_CUSID;
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
public String getORDER_RECEIVER() {
	return ORDER_RECEIVER;
}
public void setORDER_RECEIVER(String oRDER_RECEIVER) {
	ORDER_RECEIVER = oRDER_RECEIVER;
}
public String getORDER_TEL() {
	return ORDER_TEL;
}
public void setORDER_TEL(String oRDER_TEL) {
	ORDER_TEL = oRDER_TEL;
}
public String getORDER_ADDR() {
	return ORDER_ADDR;
}
public void setORDER_ADDR(String oRDER_ADDR) {
	ORDER_ADDR = oRDER_ADDR;
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



}
