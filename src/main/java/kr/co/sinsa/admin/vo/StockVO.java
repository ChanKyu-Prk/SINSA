package kr.co.sinsa.admin.vo;

import java.util.HashMap;
import java.util.List;

public class StockVO {
	
	String stock_prdcode;
	String prd_name;
	int stock_220;
	int stock_225;
	int stock_230;
	int stock_235;
	int stock_240;
	int stock_245;
	int stock_250;
	int stock_255;
	int stock_260;
	int stock_265;
	int stock_270;
	int stock_275;
	int stock_280;
	int stock_285;
	int stock_290;
	int total;
	List<HashMap<String, Object>> listMap;
	
	public String getStock_prdcode() {
		return stock_prdcode;
	}
	public void setStock_prdcode(String stock_prdcode) {
		this.stock_prdcode = stock_prdcode;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public int getStock_220() {
		return stock_220;
	}
	public void setStock_220(int stock_220) {
		this.stock_220 = stock_220;
	}
	public int getStock_225() {
		return stock_225;
	}
	public void setStock_225(int stock_225) {
		this.stock_225 = stock_225;
	}
	public int getStock_230() {
		return stock_230;
	}
	public void setStock_230(int stock_230) {
		this.stock_230 = stock_230;
	}
	public int getStock_235() {
		return stock_235;
	}
	public void setStock_235(int stock_235) {
		this.stock_235 = stock_235;
	}
	public int getStock_240() {
		return stock_240;
	}
	public void setStock_240(int stock_240) {
		this.stock_240 = stock_240;
	}
	public int getStock_245() {
		return stock_245;
	}
	public void setStock_245(int stock_245) {
		this.stock_245 = stock_245;
	}
	public int getStock_250() {
		return stock_250;
	}
	public void setStock_250(int stock_250) {
		this.stock_250 = stock_250;
	}
	public int getStock_255() {
		return stock_255;
	}
	public void setStock_255(int stock_255) {
		this.stock_255 = stock_255;
	}
	public int getStock_260() {
		return stock_260;
	}
	public void setStock_260(int stock_260) {
		this.stock_260 = stock_260;
	}
	public int getStock_265() {
		return stock_265;
	}
	public void setStock_265(int stock_265) {
		this.stock_265 = stock_265;
	}
	public int getStock_270() {
		return stock_270;
	}
	public void setStock_270(int stock_270) {
		this.stock_270 = stock_270;
	}
	public int getStock_275() {
		return stock_275;
	}
	public void setStock_275(int stock_275) {
		this.stock_275 = stock_275;
	}
	public int getStock_280() {
		return stock_280;
	}
	public void setStock_280(int stock_280) {
		this.stock_280 = stock_280;
	}
	public int getStock_285() {
		return stock_285;
	}
	public void setStock_285(int stock_285) {
		this.stock_285 = stock_285;
	}
	public int getStock_290() {
		return stock_290;
	}
	public void setStock_290(int stock_290) {
		this.stock_290 = stock_290;
	}
	public int getTotal() {
		return stock_220+
				stock_225+
				stock_230+
				stock_235+
				stock_240+
				stock_245+
				stock_250+
				stock_255+
				stock_260+
				stock_265+
				stock_270+
				stock_275+
				stock_280+
				stock_285+
				stock_290;
	}
	public void setTotal(int total) {
		this.total =
				stock_220+
				stock_225+
				stock_230+
				stock_235+
				stock_240+
				stock_245+
				stock_250+
				stock_255+
				stock_260+
				stock_265+
				stock_270+
				stock_275+
				stock_280+
				stock_285+
				stock_290;
	}
	public List<HashMap<String, Object>> getListMap() {
		return listMap;
	}
	public void setListMap(List<HashMap<String, Object>> listMap) {
		this.listMap = listMap;
	}
	
}
