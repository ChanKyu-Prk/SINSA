package kr.co.sinsa.biz.customer.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.MyPageService;
import kr.co.sinsa.biz.customer.OrdersVO;
import kr.co.sinsa.biz.customer.QnAVO;
import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;

	@Override
	public CustomerVO myInfo(UserVO vo) {
		return dao.myInfo(vo);
	}
	
	
	
	

	@Override
	public List<OrdersVO> myOrderList(Map<String, Object> map) {
		return dao.myOrderList(map);
	}
	@Override
	public List<OrdersVO> myOrderListDate(Map<String, Object> map) {
		return dao.myOrderListDate(map);
	}
	@Override
	public int countmyOrderList(Map<String, Object> map) {
		return dao.countmyOrderList(map);
	}
	@Override
	public int countmyOrderListDate(Map<String, Object> map) {
		return dao.countmyOrderListDate(map);
	}

	
	
	
	
	
	
	
	@Override
	public List<ProductVO> jjimList(Map<String,Object> map) {
		return dao.jjimList(map);
	}
	@Override
	public int countJjimList(Map<String,Object> map) {
		return dao.countJjimList(map);
	}

	
	
	
	
	@Override
	public List<ReviewVO> reviewList(Map<String, Object> map) {
		return dao.reviewList(map);
	}
	@Override
	public List<ReviewVO> reviewListDate(Map<String, Object> map) {
		return dao.reviewListDate(map);
	}
	@Override
	public int countReviewList(Map<String, Object> map) {
		return dao.countReviewList(map);
	}
	@Override
	public int countReviewListDate(Map<String, Object> map) {
		return dao.countReviewListDate(map);
	}
	
	

	
	
	@Override
	public List<QnAVO> QnAList(Map<String, Object> map) {
		return dao.QnAList(map);
	}
	@Override
	public List<QnAVO> QnAListDate(Map<String, Object> map) {
		return dao.QnAListDate(map);
	}
	@Override
	public int countQnAListList(Map<String, Object> map) {
		return dao.countQnAList(map);
	}
	@Override
	public int countQnAListListDate(Map<String, Object> map) {
		return dao.countQnAListDate(map);
	}
	
	
	
	
	
	
	@Override
	public List<ProductVO> recentView(Cookie[] cRecentlyVieweds, int page, int listCount) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		int PRD_NUM;
		List<ProductVO> allProduct = dao.allProductNum();

		for (int i = 0; i < cRecentlyVieweds.length; i++) {
			String str = cRecentlyVieweds[i].getName();
			for (int j = 0; j < allProduct.size(); j++) {
				String str2 = Integer.toString(allProduct.get(j).getPRD_NUM());
				if (str.equals(str2)) {
					PRD_NUM = Integer.parseInt(cRecentlyVieweds[i].getValue());
					if (listCount <= 20) {
						int end = listCount % 20;
						for (int k = 0; k < end; k++) {
							list.add(dao.recentView(PRD_NUM));
						}
					} else {
						int end = page + (listCount % 20);
						for (int k = page; k < end; k++) {
							list.add(dao.recentView(PRD_NUM));
						}

					}
				}
			}
		}
		return list;
	}

	@Override
	public int countRecentView(Cookie[] cRecentlyVieweds) {
		int listcount = 0;
		List<ProductVO> allProduct = dao.allProductNum();
		for (int i = 0; i < cRecentlyVieweds.length; i++) {
			String str = cRecentlyVieweds[i].getName();
			for (int j = 0; j < allProduct.size(); j++) {
				String str2 = Integer.toString(allProduct.get(j).getPRD_NUM());
				if (str.equals(str2)) {
					listcount++;
				}
			}
		}
		return listcount;
	}





}