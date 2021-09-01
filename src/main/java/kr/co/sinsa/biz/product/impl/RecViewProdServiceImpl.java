package kr.co.sinsa.biz.product.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.customer.impl.MyPageDAO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.RecViewProdService;

@Service("recViewProdService")
public class RecViewProdServiceImpl implements RecViewProdService{


	
	@Autowired
	private MyPageDAO cusdao;
	
	@Override
	public List<ProductVO> recentView(Cookie[] cRecentlyVieweds, int page, int listCount) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		List<ProductVO> select = new ArrayList<ProductVO>();

		List<ProductVO> allProduct = cusdao.allProductNum();
		int PRD_NUM;
		for (int i = cRecentlyVieweds.length - 1; i >= 0; i--) {
			String str = cRecentlyVieweds[i].getName();
			for (int j = 0; j < allProduct.size(); j++) {
				String str2 = Integer.toString(allProduct.get(j).getPRD_NUM());
				if (str.equals(str2)) {
					PRD_NUM = Integer.parseInt(cRecentlyVieweds[i].getValue());
					list.add(cusdao.recentView(PRD_NUM));
				}
			}
		}
		int end = page + 3;
		if ((page + 3)  > listCount) {
			end = page + (listCount % 3);
		}
		for (int i = page; i < end; i++) {
			select.add(list.get(i));
		}
		return select;
	}
	
	@Override
	public int countRecentView(Cookie[] cRecentlyVieweds) {
		int listcount = 0;
		List<ProductVO> allProduct = cusdao.allProductNum();
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
