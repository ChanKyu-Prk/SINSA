package kr.co.sinsa.biz.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import kr.co.sinsa.biz.orders.OrdersAndProductVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;
import kr.co.sinsa.biz.user.UserVO;

public interface MyPageService {

	public CustomerVO myInfo(UserVO vo);
	
	public List<MyOrderListVO> myOrderList(Map<String,Object> map);
	public List<MyOrderListVO> myOrderListDate(Map<String,Object> map);
	public Map<String, Integer> countState(Map<String,Object> map); 
	public Map<String, Integer> countStateDate(Map<String,Object> map); 
	public int countmyOrderList(Map<String,Object> map);
	public int countmyOrderListDate(Map<String,Object> map);
	
	public List<OrdersAndProductVO> orderStatus(String ORDER_NUM);
	
	public List<ProductVO> jjimList(Map<String,Object> map);
	public int countJjimList(String userID);
	public List<Integer> getJjimList(String user);
	public StockVO getStock(String PRD_CODE);
	
	public List<Integer> reviewCheck(List<MyOrderListVO> orderList,String ID);
	public ProductVO productSerch(String PRDCODE);
	public void reviewInsert(ReviewVO vo);
	public List<OrdersAndProductVO> productMatchReview(List<ReviewVO> list);
	
	
	
	public List<QnAVO> QnAList(Map<String,Object> map);
	public List<QnAVO> QnAListDate(Map<String,Object> map);
	public List<ProductVO> productMatch(List<QnAVO> QnAList);
	public int countQnAListList(Map<String,Object> map);
	public int countQnAListListDate(Map<String,Object> map);
	
	
	public List<ProductVO> recentView(Cookie[] cRecentlyVieweds, int page, int listCount);
	public int countRecentView(Cookie[] cRecentlyVieweds);
	public int countReviewsDate(Map<String, Object> map);
	public int countReviews(Map<String, Object> map);
	public List<ReviewVO> myReviewsDate(Map<String, Object> map);
	public List<ReviewVO> myReviews(Map<String, Object> map);
	
	public boolean passCheck(Map<String,String> map);
	public void  passChange(Map<String, String> map);
	
	public void privateInfoChange(CustomerVO vo);
	
	public void refund(Map<String,String> map);
	public void allRefund(Map<String,String> map);
	public void cancel(Map<String,String> map);
	public void allCancel(Map<String,String> map);
	
	public JjimVO selJjimById(JjimVO jjimVO);
	public int addJjim(JjimVO vo);
	public int removeJjim(JjimVO jjimVO);
	
	public CartVO selCartById(CartVO cartVO);
	public int addCart(CartVO cartVO);
	
	public int chckDeleteCart(String CUS_ID);
	
	public void decide(Map<String,String> map);
	
	public void leave(String userID);
	public String canleave(String ORDER_CUSID);
		
	public boolean checkSNS(String id);
	public String checkSNS2(String id);
	
	public int countCart(String id);
	public int countjjim(String id);
	
	public List<ProductVO> myPageRecView(Cookie[] cRecentlyVieweds, int listCount);
	public List<ProductVO> myPageJjimList(String userID);
	public Map<String, Integer> countRecOrderState(String userID);
	public boolean naverLinkCheck(String userID);
	
}
