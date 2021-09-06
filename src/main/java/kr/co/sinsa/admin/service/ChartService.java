package kr.co.sinsa.admin.service;

import java.util.List;

import kr.co.sinsa.admin.vo.TopBrandVO;
import kr.co.sinsa.biz.product.ProductVO;

public interface ChartService {

	public List<ProductVO> getProductList();
	
	public List<Integer> getSalesList();
	
	public List<Integer> getDailySalesList();
	
	public int getYear();
	
	public int getTotalSales();
	
	public int getTotalSalesAmount();
	
	public int getTotalUsers();
	
	public int getTotalQna();
	
	public List<Integer> getUsersCountList();
	
	public List<TopBrandVO> getTopBrandList();
	
}