package kr.co.sinsa.biz.product.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.StockService;
import kr.co.sinsa.biz.product.StockVO;

@Service("stockService")
public class StockServiceImpl implements StockService {
	@Autowired
	private StockDAO stockDAO;

	@Override
	public StockVO sizeInStock(String STOCK_PRDCODE) {
		return stockDAO.sizeInStock(STOCK_PRDCODE);
	}
	
	
}
