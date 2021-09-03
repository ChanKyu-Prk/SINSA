package kr.co.sinsa.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.OrderVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockVO;
@Repository
public class ChartDAO {


	@Autowired
	private SqlSessionTemplate SST;
	
	
	public List<ProductVO> getProductList() {
		List<ProductVO> ProductList = SST.selectList("ChartService.getProductList");
		return ProductList;
	}
	
	public List<Integer> getSalesList() {
		
		List<Integer> salesList = new ArrayList<Integer>();
		

		salesList.add((Integer) SST.selectOne("ChartService.getSales1"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales2"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales3"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales4"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales5"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales6"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales7"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales8"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales9"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales10"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales11"));
		salesList.add((Integer) SST.selectOne("ChartService.getSales12"));


		return salesList;
		
	}

	public int getYear() {
		int year = SST.selectOne("ChartService.getYear");
		return year;
	}
	
	public int getTotalSales() {
		int totalSales = SST.selectOne("ChartService.getTotalSales");
		return totalSales;
	}
	
	public int getTotalSalesAmount() {
		int totalSalesAmount = SST.selectOne("ChartService.getTotalSalesAmount");
		return totalSalesAmount;
	}

	

}