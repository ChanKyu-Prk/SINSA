package kr.co.sinsa.biz.orders;

import java.util.Date;

public class OrdersVO {
private String ORDER_NUM;
private String ORDER_CUSID;
private String ORDER_PRDCODE;
private String ORDER_PRDNAME;
private String ORDER_PRDSIZE;
private int ORDER_AMOUNT;
private String ORDER_RECEIVER;
private String ORDER_TEL;
private String ORDER_ADDR;
private int ORDER_PRICE;
private String ORDER_STATE;
private String ORDER_MEMO;
private Date ORDER_REGDATE;
private String ORDER_DELIVCOMP;
private String ORDER_DELIVNUM;
private int ORDER_USEPOINT;
private Date ORDER_PROCESS;

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
public int getORDER_AMOUNT() {
	return ORDER_AMOUNT;
}
public void setORDER_AMOUNT(int oRDER_AMOUNT) {
	ORDER_AMOUNT = oRDER_AMOUNT;
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

public String getORDER_MEMO() {
	return ORDER_MEMO;
}
public void setORDER_MEMO(String oRDER_MEMO) {
	ORDER_MEMO = oRDER_MEMO;
}
public void setORDER_REGDATE(Date oRDER_REGDATE) {
	ORDER_REGDATE = oRDER_REGDATE;
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
public Date getORDER_PROCESS() {
	return ORDER_PROCESS;
}
public void setORDER_PROCESS(Date oRDER_PROCESS) {
	ORDER_PROCESS = oRDER_PROCESS;
}
@Override
public String toString() {
	return "OrdersVO [ORDER_NUM=" + ORDER_NUM + ", ORDER_CUSID=" + ORDER_CUSID + ", ORDER_PRDCODE=" + ORDER_PRDCODE
			+ ", ORDER_PRDNAME=" + ORDER_PRDNAME + ", ORDER_PRDSIZE=" + ORDER_PRDSIZE + ", ORDER_AMOUNT=" + ORDER_AMOUNT
			+ ", ORDER_RECEIVER=" + ORDER_RECEIVER + ", ORDER_TEL=" + ORDER_TEL + ", ORDER_ADDR=" + ORDER_ADDR
			+ ", ORDER_PRICE=" + ORDER_PRICE + ", ORDER_STATE=" + ORDER_STATE + ", ORDER_MEMO=" + ORDER_MEMO
			+ ", ORDER_REGDATE=" + ORDER_REGDATE + ", ORDER_DELIVCOMP=" + ORDER_DELIVCOMP + ", ORDER_DELIVNUM="
			+ ORDER_DELIVNUM + ", ORDER_USEPOINT=" + ORDER_USEPOINT + ", ORDER_PROCESS=" + ORDER_PROCESS + "]";
}
}
