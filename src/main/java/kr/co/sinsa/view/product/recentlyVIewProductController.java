package kr.co.sinsa.view.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.RecViewProdService;

@Controller
public class recentlyVIewProductController {
	@Autowired
	private RecViewProdService service;

	@RequestMapping(value = "recentlyview/{page}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String recentlyviewInfo(@PathVariable("page") String pageR,HttpServletRequest request) {
		Cookie[] cRecentlyVieweds = request.getCookies();
		int page = Integer.parseInt(pageR);
		int limit = 3;
		int listCount;
		int maxPage;
		listCount = service.countRecentView(cRecentlyVieweds);
		maxPage = (int) ((double) listCount / limit + 0.95);

		
		Gson gson = new Gson();

		List<ProductVO> list = service.recentView(cRecentlyVieweds,(page - 1) * limit, listCount);
		
		List<Map<String, Object>> retrunList = new 	ArrayList<Map<String, Object>>();
		for (int i = 0 ; i < list.size() ; i ++) {
		Map<String, Object> map = new HashMap<String, Object>();
		String[] imgs = list.get(i).getPRD_IMAGE().split("/");
		String thumbpic = imgs[0];
		map.put("prdimg", thumbpic);
		map.put("prdname", list.get(i).getPRD_NAME());
		map.put("prdcode", list.get(i).getPRD_CODE());
		map.put("prdprice", String.format("%,d", list.get(i).getPRD_PRICE()));
		map.put("prdbrand", list.get(i).getPRD_BRAND());
		map.put("listCount",listCount);
		map.put("maxPage", maxPage);
		map.put("page", page);
		retrunList.add(map);
		}
		return gson.toJson(retrunList);
	}

}
