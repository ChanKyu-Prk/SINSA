package kr.co.sinsa.admin.vo;

import java.util.Date;

public class QnaVO {

	private int qna_num;
	private int prd_num;
	private int qna_lock;
	private String qna_cusid;
	private String qna_title;
	private String qna_content;
	private String qna_answer;
	private Date qna_regdate;
	
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getPrd_num() {
		return prd_num;
	}
	public void setPrd_num(int prd_num) {
		this.prd_num = prd_num;
	}
	public int getQna_lock() {
		return qna_lock;
	}
	public void setQna_lock(int qna_lock) {
		this.qna_lock = qna_lock;
	}
	public String getQna_cusid() {
		return qna_cusid;
	}
	public void setQna_cusid(String qna_cusid) {
		this.qna_cusid = qna_cusid;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public Date getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	
	
}
