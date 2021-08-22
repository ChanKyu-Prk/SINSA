package kr.co.sinsa.admin.vo;

import java.sql.Date;

public class OrderVO {
	
	String order_num;
	String order_cusid;
	String order_prdcode;
	String order_prdname;
	String order_prdsize;
	int order_amount;
	String order_receiver;
	String order_tel;
	String order_addr;
	int order_price;
	String order_state;
	String order_memo;
	Date order_regdate;
	String order_delivcomp;
	String order_delivnum;
	int order_usepoint;
	Date order_process;
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getOrder_cusid() {
		return order_cusid;
	}
	public void setOrder_cusid(String order_cusid) {
		this.order_cusid = order_cusid;
	}
	public String getOrder_prdcode() {
		return order_prdcode;
	}
	public void setOrder_prdcode(String order_prdcode) {
		this.order_prdcode = order_prdcode;
	}
	public String getOrder_prdname() {
		return order_prdname;
	}
	public void setOrder_prdname(String order_prdname) {
		this.order_prdname = order_prdname;
	}
	public String getOrder_prdsize() {
		return order_prdsize;
	}
	public void setOrder_prdsize(String order_prdsize) {
		this.order_prdsize = order_prdsize;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getOrder_receiver() {
		return order_receiver;
	}
	public void setOrder_receiver(String order_receiver) {
		this.order_receiver = order_receiver;
	}
	public String getOrder_tel() {
		return order_tel;
	}
	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public Date getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Date order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getOrder_delivcomp() {
		return order_delivcomp;
	}
	public void setOrder_delivcomp(String order_delivcomp) {
		this.order_delivcomp = order_delivcomp;
	}
	public String getOrder_delivnum() {
		return order_delivnum;
	}
	public void setOrder_delivnum(String order_delivnum) {
		this.order_delivnum = order_delivnum;
	}
	public int getOrder_usepoint() {
		return order_usepoint;
	}
	public void setOrder_usepoint(int order_usepoint) {
		this.order_usepoint = order_usepoint;
	}
	public Date getOrder_process() {
		return order_process;
	}
	public void setOrder_process(Date order_process) {
		this.order_process = order_process;
	}
	
	
	
}
