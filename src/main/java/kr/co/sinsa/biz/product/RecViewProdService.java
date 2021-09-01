package kr.co.sinsa.biz.product;

import java.util.List;

import javax.servlet.http.Cookie;

public interface RecViewProdService {
	
	public List<ProductVO> recentView(Cookie[] cRecentlyVieweds, int page, int listCount);
	public int countRecentView(Cookie[] cRecentlyVieweds);
}