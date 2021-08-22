package kr.co.sinsa.biz.product;

public class ProductVO {
	private int PRD_NUM;
	private String PRD_CODE;
	private String PRD_NAME;
	private String PRD_CATEGORY;
	private String PRD_IMAGE;
	private String PRD_GENDER;
	private int PRD_PRICE;
	private String PRD_BRAND;
	private String PRD_COLOR;
	private String PRD_DETAIL;
	private int PRD_DISRATE;

	
	private String minamount;
	private String maxamount;
	
	private String white;
	private String gray;
	private String red;
	private String black;
	private String blue;
	private String green;
	
	public String getWhite() {
		return white;
	}

	public void setWhite(String white) {
		this.white = white;
	}

	public String getGray() {
		return gray;
	}

	public void setGray(String gray) {
		this.gray = gray;
	}

	public String getRed() {
		return red;
	}

	public void setRed(String red) {
		this.red = red;
	}

	public String getBlack() {
		return black;
	}

	public void setBlack(String black) {
		this.black = black;
	}

	public String getBlue() {
		return blue;
	}

	public void setBlue(String blue) {
		this.blue = blue;
	}

	public String getGreen() {
		return green;
	}

	public void setGreen(String green) {
		this.green = green;
	}



	public String getMinamount() {
		return minamount;
	}

	public void setMinamount(String minamount) {
		this.minamount = minamount;
	}

	public String getMaxamount() {
		return maxamount;
	}

	public void setMaxamount(String maxamount) {
		this.maxamount = maxamount;
	}

	
	public int getPRD_NUM() {
		return PRD_NUM;
	}

	public void setPRD_NUM(int pRD_NUM) {
		PRD_NUM = pRD_NUM;
	}

	public String getPRD_CODE() {
		return PRD_CODE;
	}

	public void setPRD_CODE(String pRD_CODE) {
		PRD_CODE = pRD_CODE;
	}

	public String getPRD_NAME() {
		return PRD_NAME;
	}

	public void setPRD_NAME(String pRD_NAME) {
		PRD_NAME = pRD_NAME;
	}

	public String getPRD_CATEGORY() {
		return PRD_CATEGORY;
	}

	public void setPRD_CATEGORY(String pRD_CATEGORY) {
		PRD_CATEGORY = pRD_CATEGORY;
	}

	public String getPRD_IMAGE() {
		return PRD_IMAGE;
	}

	public void setPRD_IMAGE(String pRD_IMAGE) {
		PRD_IMAGE = pRD_IMAGE;
	}

	public String getPRD_GENDER() {
		return PRD_GENDER;
	}

	public void setPRD_GENDER(String pRD_GENDER) {
		PRD_GENDER = pRD_GENDER;
	}

	public int getPRD_PRICE() {
		return PRD_PRICE;
	}

	public void setPRD_PRICE(int pRD_PRICE) {
		PRD_PRICE = pRD_PRICE;
	}

	public String getPRD_BRAND() {
		return PRD_BRAND;
	}

	public void setPRD_BRAND(String pRD_BRAND) {
		PRD_BRAND = pRD_BRAND;
	}

	public String getPRD_COLOR() {
		return PRD_COLOR;
	}

	public void setPRD_COLOR(String pRD_COLOR) {
		PRD_COLOR = pRD_COLOR;
	}

	public String getPRD_DETAIL() {
		return PRD_DETAIL;
	}

	public void setPRD_DETAIL(String pRD_DETAIL) {
		PRD_DETAIL = pRD_DETAIL;
	}

	public int getPRD_DISRATE() {
		return PRD_DISRATE;
	}

	public void setPRD_DISRATE(int pRD_DISRATE) {
		PRD_DISRATE = pRD_DISRATE;
	}

	@Override
	public String toString() {
		return "ProductVO [PRD_NUM=" + PRD_NUM + ", PRD_CODE=" + PRD_CODE + ", PRD_NAME=" + PRD_NAME + ", PRD_CATEGORY="
				+ PRD_CATEGORY + ", PRD_IMAGE=" + PRD_IMAGE + ", PRD_GENDER=" + PRD_GENDER + ", PRD_PRICE=" + PRD_PRICE
				+ ", PRD_BRAND=" + PRD_BRAND + ", PRD_COLOR=" + PRD_COLOR + ", PRD_DETAIL=" + PRD_DETAIL
				+ ", PRD_DISRATE=" + PRD_DISRATE + "]";
	}

}