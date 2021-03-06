package kr.co.sinsa.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.ChartDAO;
import kr.co.sinsa.admin.vo.TopBrandVO;
import kr.co.sinsa.biz.product.ProductVO;



@Service("ChartService")
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartDAO dao;

	
//	@Override
//	public List<ProductVO> getProductList() {
//		return dao.getProductList();
//	}
	
	@Override
	public List<Integer> getSalesList() {
		return dao.getSalesList();
	}
	
	@Override
	public List<Integer> getDailySalesList(){
		return dao.getDailySalesList();
	}
	
	@Override
	public int getYear() {
		return dao.getYear();
	}
	
	@Override
	public int getTotalSales() {
		return dao.getTotalSales();
	}
	
	@Override
	public int getTotalSalesAmount() {
		return dao.getTotalSalesAmount();
	}
	
	@Override
	public int getTotalUsers() {
		return dao.getTotalUsers();
	}
	
	@Override
	public int getTotalQna() {
		return dao.getTotalQna();
	}
	
	@Override
	public List<Integer> getUsersCountList() {
		return dao.getUsersCountList();
	}
	
	@Override
	public List<TopBrandVO> getTopBrandList() {
		return dao.getTopBrandList();
	}



}