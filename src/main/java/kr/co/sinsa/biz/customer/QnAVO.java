package kr.co.sinsa.biz.customer;

import java.util.Date;

public class QnAVO {
private int QNA_NUM;
private int	PRD_NUM;
private int	QNA_LOCK;
private String QNA_CUSID;
private String QNA_TITLE;
private String QNA_CONTENT;
private String QNA_ANSWER;
private Date QNA_REGDATE;
public int getQNA_NUM() {
	return QNA_NUM;
}
public void setQNA_NUM(int qNA_NUM) {
	QNA_NUM = qNA_NUM;
}
public int getPRD_NUM() {
	return PRD_NUM;
}
public void setPRD_NUM(int pRD_NUM) {
	PRD_NUM = pRD_NUM;
}
public int getQNA_LOCK() {
	return QNA_LOCK;
}
public void setQNA_LOCK(int qNA_LOCK) {
	QNA_LOCK = qNA_LOCK;
}
public String getQNA_CUSID() {
	return QNA_CUSID;
}
public void setQNA_CUSID(String qNA_CUSID) {
	QNA_CUSID = qNA_CUSID;
}
public String getQNA_TITLE() {
	return QNA_TITLE;
}
public void setQNA_TITLE(String qNA_TITLE) {
	QNA_TITLE = qNA_TITLE;
}
public String getQNA_CONTENT() {
	return QNA_CONTENT;
}
public void setQNA_CONTENT(String qNA_CONTENT) {
	QNA_CONTENT = qNA_CONTENT;
}
public String getQNA_ANSWER() {
	return QNA_ANSWER;
}
public void setQNA_ANSWER(String qNA_ANSWER) {
	QNA_ANSWER = qNA_ANSWER;
}
public Date getQNA_REGDATE() {
	return QNA_REGDATE;
}
public void setQNA_REGDATE(Date qNA_REGDATE) {
	QNA_REGDATE = qNA_REGDATE;
}


}
