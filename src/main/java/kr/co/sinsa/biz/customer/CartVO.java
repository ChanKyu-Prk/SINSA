package kr.co.sinsa.biz.customer;

import java.sql.Date;

public class CartVO {

	private int CART_NUM;
	private String CART_CUSID;
	private int CART_PRDNUM;
	private String CART_PRDSIZE;
	private int CART_PRDCOUNT;
	private Date CART_REGDATE;

	public int getCART_NUM() {
		return CART_NUM;
	}

	public void setCART_NUM(int cART_NUM) {
		CART_NUM = cART_NUM;
	}

	public String getCART_CUSID() {
		return CART_CUSID;
	}

	public void setCART_CUSID(String cART_CUSID) {
		CART_CUSID = cART_CUSID;
	}

	public int getCART_PRDNUM() {
		return CART_PRDNUM;
	}

	public void setCART_PRDNUM(int cART_PRDNUM) {
		CART_PRDNUM = cART_PRDNUM;
	}

	public String getCART_PRDSIZE() {
		return CART_PRDSIZE;
	}

	public void setCART_PRDSIZE(String cART_PRDSIZE) {
		CART_PRDSIZE = cART_PRDSIZE;
	}

	public int getCART_PRDCOUNT() {
		return CART_PRDCOUNT;
	}

	public void setCART_PRDCOUNT(int cART_PRDCOUNT) {
		CART_PRDCOUNT = cART_PRDCOUNT;
	}

	public Date getCART_REGDATE() {
		return CART_REGDATE;
	}

	public void setCART_REGDATE(Date cART_REGDATE) {
		CART_REGDATE = cART_REGDATE;
	}

	@Override
	public String toString() {
		return "CartVO [CART_NUM=" + CART_NUM + ", CART_CUSID=" + CART_CUSID + ", CART_PRDNUM=" + CART_PRDNUM
				+ ", CART_PRDSIZE=" + CART_PRDSIZE + ", CART_PRDCOUNT=" + CART_PRDCOUNT + ", CART_REGDATE="
				+ CART_REGDATE + "]";
	}

}