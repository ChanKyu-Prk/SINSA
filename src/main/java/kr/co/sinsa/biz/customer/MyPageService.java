package kr.co.sinsa.biz.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

public interface MyPageService {

	public CustomerVO myInfo(UserVO vo);
	
	public List<MyOrderListVO> myOrderList(Map<String,Object> map);
	public List<MyOrderListVO> myOrderListDate(Map<String,Object> map);
	public int countmyOrderList(Map<String,Object> map);
	public int countmyOrderListDate(Map<String,Object> map);
	
	public List<ProductVO> jjimList(Map<String,Object> map);
	public int countJjimList(Map<String,Object> map);
	
	public List<ReviewVO> reviewList(Map<String,Object> map);
	public List<ReviewVO> reviewListDate(Map<String,Object> map);
	public int countReviewList(Map<String,Object> map);
	public int countReviewListDate(Map<String,Object> map);
	
	public List<QnAVO> QnAList(Map<String,Object> map);
	public List<QnAVO> QnAListDate(Map<String,Object> map);
	public int countQnAListList(Map<String,Object> map);
	public int countQnAListListDate(Map<String,Object> map);
	
	
	public List<ProductVO> recentView(Cookie[] cRecentlyVieweds, int page, int listCount);
	public int countRecentView(Cookie[] cRecentlyVieweds);
	
	public boolean passCheck(Map<String,String> map);
	public void  passChange(Map<String, String> map);
	
	public void privateInfoChange(CustomerVO vo);
}
