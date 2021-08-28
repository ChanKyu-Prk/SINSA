package kr.co.sinsa.biz.customer.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.ReviewVO;
import kr.co.sinsa.biz.orders.OrdersVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;
import kr.co.sinsa.biz.product.UserCartProductStockVO;

@Repository
public class IndexDAO {

	@Autowired
	private SqlSessionTemplate SST;
	
	
	
	public List<ProductVO> getProductList() {
		return SST.selectList("IndexService.getProductList");
	}
	
	public List<ReviewVO> getReviewList() {
		return SST.selectList("IndexService.getReviewList");
	}
	
	public List<ProductVO> getTopProductList() {
		List<OrdersVO> orderList = SST.selectList("IndexService.getOrderList");
		List<ProductVO> topProductList = new ArrayList<ProductVO>();
		ProductVO productVO = new ProductVO();
		
		if(orderList != null) {
			if(orderList.size() != 0) {
				for(int i=0; i<orderList.size(); i++) {
					
					productVO.setPRD_CODE(orderList.get(i).getORDER_PRDCODE());
					topProductList.add((ProductVO) SST.selectOne("IndexService.getTopProductList", productVO));
					
				}
			}
		}
		
		
		return topProductList;
	}

	
	public List<ProductVO> getTopSneakersProductList() {
		List<OrdersVO> orderList = SST.selectList("IndexService.getOrderList");
		List<ProductVO> topSneakersProductList = new ArrayList<ProductVO>();
		ProductVO productVO = new ProductVO();

		
		if(orderList != null) {
			if(orderList.size() != 0) {
				for(int i=0; i<orderList.size(); i++) {
					
					productVO.setPRD_CODE(orderList.get(i).getORDER_PRDCODE());
					topSneakersProductList.add((ProductVO) SST.selectOne("IndexService.getTopSneakersProductList", productVO));
					
				}
			}
		}
		
		for(int i=0; i<topSneakersProductList.size(); i++) {
			if(topSneakersProductList.get(i) == null) {
				topSneakersProductList.remove(i);
			}
		}
		
		
		return topSneakersProductList;
	}
	
	
	
	
	
	
	public List<ProductVO> getTopSportsProductList() {
		List<OrdersVO> orderList = SST.selectList("IndexService.getOrderList");
		List<ProductVO> topSportsProductList = new ArrayList<ProductVO>();
		ProductVO productVO = new ProductVO();

		
		if(orderList != null) {
			if(orderList.size() != 0) {
				for(int i=0; i<orderList.size(); i++) {
					
					productVO.setPRD_CODE(orderList.get(i).getORDER_PRDCODE());
					topSportsProductList.add((ProductVO) SST.selectOne("IndexService.getTopSportsProductList", productVO));
					
				}
			}
		}
		
		
		for(int i=0; i<topSportsProductList.size(); i++) {
			if(topSportsProductList.get(i) == null) {
				topSportsProductList.remove(i);
			}
		}
		
//		List<ProductVO> topSportsList = new ArrayList<ProductVO>();
//		for(int i=0; i<topSportsProductList.size(); i++) {
//			if(topSportsProductList.get(i).getPRD_CATEGORY().equals("런닝화")) {
//				topSportsList.add(topSportsProductList.get(i));
//			}
//		}
		
		
		return topSportsProductList;
	}



	
}