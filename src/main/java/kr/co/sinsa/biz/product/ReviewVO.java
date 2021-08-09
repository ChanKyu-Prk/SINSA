package kr.co.sinsa.biz.product;

import java.util.Date;

public class ReviewVO {
	private int REV_NUM;
	private Date REV_REGDATE;
	private String REV_CUSID;
	private String PRDCODE;
	private int REV_STAR;
	private String REV_IMAGE;
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
	public String getPRDCODE() {
		return PRDCODE;
	}
	public void setPRDCODE(String pRDCODE) {
		PRDCODE = pRDCODE;
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
	@Override
	public String toString() {
		return "ReviewVO [REV_NUM=" + REV_NUM + ", REV_REGDATE=" + REV_REGDATE + ", REV_CUSID=" + REV_CUSID
				+ ", PRDCODE=" + PRDCODE + ", REV_STAR=" + REV_STAR + ", REV_IMAGE=" + REV_IMAGE + "]";
	}

	
}
