package kr.co.sinsa.admin.service;

import java.util.List;

import kr.co.sinsa.biz.product.ProductVO;

public interface ChartService {

	public List<ProductVO> getProductList();
	
	public List<Integer> getSalesList();
	
	public int getYear();
	
	public int getTotalSales();
	
	public int getTotalSalesAmount();

}