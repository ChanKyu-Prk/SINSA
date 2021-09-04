package kr.co.sinsa.admin.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.admin.vo.TopBrandVO;
import kr.co.sinsa.biz.orders.OrdersVO;
import kr.co.sinsa.biz.product.ProductVO;
@Repository
public class ChartDAO  {


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

	public int getTotalUsers() {
		int totalUsers = SST.selectOne("ChartService.getTotalUsers");
		return totalUsers;
	}

	public int getTotalQna() {
		int totalQna = SST.selectOne("ChartService.getTotalQna");
		return totalQna;
	}

	public List<Integer> getUsersCountList() {
		List<Integer> usersCountList = new ArrayList<Integer>();

		usersCountList.add((Integer)SST.selectOne("ChartService.get10MaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get20MaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get30MaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get40MaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get50MaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get60MaleUsersList"));

		usersCountList.add((Integer)SST.selectOne("ChartService.get10FemaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get20FemaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get30FemaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get40FemaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get50FemaleUsersList"));
		usersCountList.add((Integer)SST.selectOne("ChartService.get60FemaleUsersList"));



		return usersCountList;
	}


	public List<TopBrandVO> getTopBrandList() {
		List<OrdersVO> orderList= SST.selectList("ChartService.getOrderList");

		System.out.println("orderList" + orderList);
		List<ProductVO> topBrandPrdList = new ArrayList<ProductVO>();

		List<String> brandList = new ArrayList<String>();


		for(int i=0; i<orderList.size(); i++) {
			topBrandPrdList.add((ProductVO)SST.selectOne("ChartService.getTopBrandPrdList", orderList.get(i).getORDER_PRDCODE()));
		}
		
		while (topBrandPrdList.remove(null)) {
        }



		System.out.println("topBrandPrdList" + topBrandPrdList);


		for(int i=0; i<topBrandPrdList.size(); i++) {
			if(!brandList.contains(topBrandPrdList.get(i).getPRD_BRAND()))
				brandList.add((String)topBrandPrdList.get(i).getPRD_BRAND());
		}


		System.out.println("brandList" + brandList);

		List<TopBrandVO> topBrandList = new ArrayList<TopBrandVO>();

		HashMap<String, Integer> topBrandMap = new HashMap<String, Integer>();

		int count = 0;
		for(int i=0; i<brandList.size(); i++) {

			count = 0;

			for(int j=0; j<topBrandPrdList.size(); j++) {
				if(brandList.get(i).equals(topBrandPrdList.get(j).getPRD_BRAND())) {
					count++;
				}
			}

			TopBrandVO topBrandVO = new TopBrandVO();
			topBrandVO.setBRAND(brandList.get(i));
			topBrandVO.setBRAND_ORDERCOUNT(count);

			System.out.println("count" + count);


			topBrandList.add(topBrandVO);

			topBrandMap.put(brandList.get(i), count);

		}

		Collections.sort(topBrandList, new Comparator<TopBrandVO>() {
			@Override
			public int compare(TopBrandVO BRAND_ORDERCOUNT1, TopBrandVO BRAND_ORDERCOUNT2) {
				return BRAND_ORDERCOUNT2.getBRAND_ORDERCOUNT()-BRAND_ORDERCOUNT1.getBRAND_ORDERCOUNT();
			}
		});


//		System.out.println("topBrandList111=" + topBrandList.get(0).getBRAND_ORDERCOUNT() + topBrandList.get(1).getBRAND_ORDERCOUNT() + topBrandList.get(2).getBRAND_ORDERCOUNT() + topBrandList.get(3).getBRAND_ORDERCOUNT());



		return topBrandList;
	}




}