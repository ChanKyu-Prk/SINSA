package kr.co.sinsa.biz.customer.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.IndexService;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.orders.OrdersVO;
import kr.co.sinsa.biz.product.ProductVO;

@Service("IndexService")
public class IndexServiceImpl implements IndexService {

	@Autowired
	private IndexDAO dao;


	@Override
	public List<ProductVO> getProductList() {
		return dao.getProductList();
	}
	
	@Override
	public List<ReviewVO> getReviewList() {
		return dao.getReviewList();
	}
	
	@Override
	public List<ProductVO> getTopProductList() {
		return dao.getTopProductList();
	}
	
	@Override
	public List<ProductVO> getTopSneakersProductList() {
		return dao.getTopSneakersProductList();
	}
	
	@Override
	public List<ProductVO> getTopSportsProductList() {
		return dao.getTopSportsProductList();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@Override
//	public CustomerVO myInfo(UserVO vo) {
//		return dao.myInfo(vo);
//	}
//
//	@Override
//	public List<MyOrderListVO> myOrderList(Map<String, Object> map) {
//		return dao.myOrderList(map);
//	}
//
//	@Override
//	public List<MyOrderListVO> myOrderListDate(Map<String, Object> map) {
//
//		return dao.myOrderListDate(map);
//	}
//
//	@Override
//	public Map<String, Integer> countState(Map<String, Object> map) {
//		Map<String, Integer> countState = new HashMap<String, Integer>();
//		map.put("STATE", "결제완료");
//		int payEnd = dao.countState(map);
//		map.replace("STATE", "배송중");
//		int delivery = dao.countState(map);
//		map.replace("STATE", "배송완료");
//		int deliveryEnd = dao.countState(map);
//		map.replace("STATE", "취소");
//		int cancel = dao.countState(map);
//		map.replace("STATE", "환불신청");
//		int refund = dao.countState(map);
//		map.replace("STATE", "환불");
//		int refundEnd = dao.countState(map);
//		countState.put("payEnd", payEnd);
//		countState.put("delivery", delivery);
//		countState.put("deliveryEnd", deliveryEnd);
//		countState.put("cancel", cancel + refund + refundEnd);
//		return countState;
//	}
//
//	@Override
//	public Map<String, Integer> countStateDate(Map<String, Object> map) {
//		Map<String, Integer> countState = new HashMap<String, Integer>();
//		map.put("STATE", "결제완료");
//		int payEnd = dao.countStateDate(map);
//		map.replace("STATE", "배송중");
//		int delivery = dao.countStateDate(map);
//		map.replace("STATE", "배송완료");
//		int deliveryEnd = dao.countStateDate(map);
//		map.replace("STATE", "취소");
//		int cancel = dao.countStateDate(map);
//		map.replace("STATE", "환불신청");
//		int refund = dao.countStateDate(map);
//		map.replace("STATE", "환불");
//		int refundEnd = dao.countStateDate(map);
//		countState.put("payEnd", payEnd);
//		countState.put("delivery", delivery);
//		countState.put("deliveryEnd", deliveryEnd);
//		countState.put("cancel", cancel + refund + refundEnd);
//		return countState;
//	}
//
//	@Override
//	public int countmyOrderList(Map<String, Object> map) {
//		return dao.countmyOrderList(map);
//	}
//
//	@Override
//	public int countmyOrderListDate(Map<String, Object> map) {
//		return dao.countmyOrderListDate(map);
//	}
//
//	@Override
//	public List<OrdersAndProductVO> orderStatus(String ORDER_NUM) {
//		return dao.orderStatus(ORDER_NUM);
//	}
//
//	@Override
//	public List<ProductVO> jjimList(Map<String, Object> map) {
//		return dao.jjimList(map);
//	}
//
//	@Override
//	public int countJjimList(Map<String, Object> map) {
//		return dao.countJjimList(map);
//	}
//
//	@Override
//	public List<Integer> reviewCheck(List<MyOrderListVO> orderList, String ID) {
//		List<Integer> reviewCheckList = new ArrayList<Integer>();
//		for (int i = 0; i < orderList.size(); i++) {
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("ID", ID);
//			map.put("PRD_CODE", orderList.get(i).getORDER_PRDCODE());
//			map.put("ORDER_NUM", orderList.get(i).getORDER_NUM());
//			map.put("ORDER_PRDSIZE", orderList.get(i).getORDER_PRDSIZE());
//			int reviewCheck = dao.reviewCheck(map);
//			reviewCheckList.add(reviewCheck);
//		}
//		return reviewCheckList;
//	}
//
//	@Override
//	public ProductVO productSerch(String PRDCODE) {
//		return dao.productSerch(PRDCODE);
//	}
//
//	@Override
//	public void reviewInsert(ReviewVO vo) {
//		dao.reviewInsert(vo);
//	}
//
//	@Override
//	public List<QnAVO> QnAList(Map<String, Object> map) {
//		return dao.QnAList(map);
//	}
//
//	@Override
//	public List<QnAVO> QnAListDate(Map<String, Object> map) {
//		return dao.QnAListDate(map);
//	}
//
//	@Override
//	public List<ProductVO> productMatch(List<QnAVO> QnAList) {
//		List<ProductVO> productList = new ArrayList<ProductVO>();
//		for (int i = 0; i < QnAList.size(); i++) {
//			ProductVO product = dao.productMatch(QnAList.get(i).getPRD_NUM());
//			productList.add(product);
//		}
//
//		return productList;
//	}
//
//	@Override
//	public int countQnAListList(Map<String, Object> map) {
//		return dao.countQnAList(map);
//	}
//
//	@Override
//	public int countQnAListListDate(Map<String, Object> map) {
//		return dao.countQnAListDate(map);
//	}
//
//	@Override
//	public List<ProductVO> recentView(Cookie[] cRecentlyVieweds, int page, int listCount) {
//		List<ProductVO> list = new ArrayList<ProductVO>();
//		List<ProductVO> select = new ArrayList<ProductVO>();
//
//		List<ProductVO> allProduct = dao.allProductNum();
//		int PRD_NUM;
//		for (int i = cRecentlyVieweds.length - 1; i >= 0; i--) {
//			String str = cRecentlyVieweds[i].getName();
//			for (int j = 0; j < allProduct.size(); j++) {
//				String str2 = Integer.toString(allProduct.get(j).getPRD_NUM());
//				if (str.equals(str2)) {
//					PRD_NUM = Integer.parseInt(cRecentlyVieweds[i].getValue());
//					list.add(dao.recentView(PRD_NUM));
//				}
//			}
//		}
//		int end = page + 6;
//		if ((page + 1) * 6 > listCount) {
//			end = page + (listCount % 6);
//		}
//		for (int i = page; i < end; i++) {
//			select.add(list.get(i));
//		}
//		return select;
//	}
//
//	@Override
//	public int countRecentView(Cookie[] cRecentlyVieweds) {
//		int listcount = 0;
//		List<ProductVO> allProduct = dao.allProductNum();
//		for (int i = 0; i < cRecentlyVieweds.length; i++) {
//			String str = cRecentlyVieweds[i].getName();
//			for (int j = 0; j < allProduct.size(); j++) {
//				String str2 = Integer.toString(allProduct.get(j).getPRD_NUM());
//				if (str.equals(str2)) {
//
//					listcount++;
//				}
//			}
//		}
//		return listcount;
//	}
//
//	@Override
//	public boolean passCheck(Map<String, String> map) {
//		int passCheck = dao.passCheck(map);
//		if (passCheck == 1) {
//			return true;
//		} else {
//			return false;
//		}
//	}
//
//	@Override
//	public void passChange(Map<String, String> map) {
//		dao.passChange(map);
//	}
//
//	@Override
//	public void privateInfoChange(CustomerVO vo) {
//		dao.privateInfoChange(vo);
//
//	}
//
//	@Override
//	public void refund(Map<String, String> map) {
//		dao.refund(map);
//		
//	}
//	
//	@Override
//	public void cancel(Map<String, String> map) {
//		dao.cancel(map);
//		
//	}
//
//	@Override
//	public int addJjim(JjimVO vo) {
//		return dao.addJjim(vo);
//	}
//
//	@Override
//	public JjimVO selJjimById(JjimVO jjimVO) {
//		return dao.selJjimById(jjimVO);
//	}
//
//	@Override
//	public int removeJjim(JjimVO jjimVO) {
//		return dao.removeJjim(jjimVO);
//	}

}