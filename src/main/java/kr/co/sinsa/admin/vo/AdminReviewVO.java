package kr.co.sinsa.admin.vo;

import java.util.Date;

public class AdminReviewVO {
	private int rev_num;
	private String rev_cusid;
	private String rev_prdcode;
	private String rev_title; 
	private String rev_content; 
	private int rev_star;
	private String rev_image;
	private Date rev_regdate;
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public String getRev_cusid() {
		return rev_cusid;
	}
	public void setRev_cusid(String rev_cusid) {
		this.rev_cusid = rev_cusid;
	}
	public String getRev_prdcode() {
		return rev_prdcode;
	}
	public void setRev_prdcode(String rev_prdcode) {
		this.rev_prdcode = rev_prdcode;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public int getRev_star() {
		return rev_star;
	}
	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}
	public String getRev_image() {
		return rev_image;
	}
	public void setRev_image(String rev_image) {
		this.rev_image = rev_image;
	}
	public Date getRev_regdate() {
		return rev_regdate;
	}
	public void setRev_regdate(Date rev_regdate) {
		this.rev_regdate = rev_regdate;
	}
	
	
	
	
	
}
