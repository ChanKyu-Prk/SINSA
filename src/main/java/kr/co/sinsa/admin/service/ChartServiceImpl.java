package kr.co.sinsa.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.admin.dao.ChartDAO;
import kr.co.sinsa.biz.product.ProductVO;



@Service("ChartService")
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartDAO dao;

	
	@Override
	public List<ProductVO> getProductList() {
		return dao.getProductList();
	}






}