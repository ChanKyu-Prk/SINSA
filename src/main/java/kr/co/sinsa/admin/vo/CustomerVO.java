package kr.co.sinsa.admin.vo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
//@Entity
public class CustomerVO {
	private int CUS_NUM;
//	@Id
//	@Size(min=6, max=20, message="아이디는 6~20자리로 입력하세요.")
	private String CUS_ID;
//	@NotNull
//	@Size(min=6, max=20, message="비밀번호는 6~20자리로 입력하세요.")
//	@Pattern(regexp = "^(?=.*[a-zA-Z])((?=.*\\d)|(?=.*\\W)).{10,}$", message = "비밀번호 형식을 지켜주세요")
	private String CUS_PWD;
	private String CUS_NAME;
	private String CUS_GENDER;
	//@Pattern(regexp = "^[\\", message="이메일 형식이 아닙니다.")
	private String CUS_EMAIL;
	private String CUS_ADDR;
	private String CUS_TEL;
	private String CUS_BIRTH;
	private String CUS_DELIV_ADDR;
	private int CUS_POINT;
	private Date CUS_REGDATE;
	public int getCUS_NUM() {
		return CUS_NUM;
	}
	public void setCUS_NUM(int cUS_NUM) {
		CUS_NUM = cUS_NUM;
	}
	public String getCUS_ID() {
		return CUS_ID;
	}
	public void setCUS_ID(String cUS_ID) {
		CUS_ID = cUS_ID;
	}
	public String getCUS_PWD() {
		return CUS_PWD;
	}
	public void setCUS_PWD(String cUS_PWD) {
		CUS_PWD = cUS_PWD;
	}
	public String getCUS_NAME() {
		return CUS_NAME;
	}
	public void setCUS_NAME(String cUS_NAME) {
		CUS_NAME = cUS_NAME;
	}
	public String getCUS_GENDER() {
		return CUS_GENDER;
	}
	public void setCUS_GENDER(String cUS_GENDER) {
		CUS_GENDER = cUS_GENDER;
	}
	public String getCUS_EMAIL() {
		return CUS_EMAIL;
	}
	public void setCUS_EMAIL(String cUS_EMAIL) {
		CUS_EMAIL = cUS_EMAIL;
	}
	public String getCUS_ADDR() {
		return CUS_ADDR;
	}
	public void setCUS_ADDR(String cUS_ADDR) {
		CUS_ADDR = cUS_ADDR;
	}
	public String getCUS_TEL() {
		return CUS_TEL;
	}
	public void setCUS_TEL(String cUS_TEL) {
		CUS_TEL = cUS_TEL;
	}
	public String getCUS_BIRTH() {
		return CUS_BIRTH;
	}
	public void setCUS_BIRTH(String cUS_BIRTH) {
		CUS_BIRTH = cUS_BIRTH;
	}
	public String getCUS_DELIV_ADDR() {
		return CUS_DELIV_ADDR;
	}
	public void setCUS_DELIV_ADDR(String cUS_DELIV_ADDR) {
		CUS_DELIV_ADDR = cUS_DELIV_ADDR;
	}
	public int getCUS_POINT() {
		return CUS_POINT;
	}
	public void setCUS_POINT(int cUS_POINT) {
		CUS_POINT = cUS_POINT;
	}
	public Date getCUS_REGDATE() {
		return CUS_REGDATE;
	}
	public void setCUS_REGDATE(Date cUS_REGDATE) {
		CUS_REGDATE = cUS_REGDATE;
	}
	

}
