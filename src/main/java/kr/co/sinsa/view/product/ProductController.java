package kr.co.sinsa.view.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sinsa.biz.customer.JjimVO;
import kr.co.sinsa.biz.customer.MyPageService;
import kr.co.sinsa.biz.product.PageInfo;
import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.product.StockService;
import kr.co.sinsa.biz.product.StockVO;
import kr.co.sinsa.biz.user.UserVO;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private MyPageService myService;
	
	// 상세페이지	
	@RequestMapping("/product/prdCode={prdCode}")
    public String getInfo(Model model, @PathVariable("prdCode") String PRD_CODE, JjimVO jjimVO, HttpServletResponse response, HttpSession session) {
		String CUS_ID = null;
		if((UserVO) session.getAttribute("user") != null) {
			UserVO user = (UserVO) session.getAttribute("user");
			CUS_ID = (String)user.getCUS_ID();
			
			ProductVO productVO = service.info(PRD_CODE);		
			int PRD_NUM = productVO.getPRD_NUM();

	    	jjimVO.setJJIM_CUSID(CUS_ID);
			jjimVO.setJJIM_PRDNUM(PRD_NUM);
			JjimVO chckJjim = myService.selJjimById(jjimVO);
			if(chckJjim != null) {
				model.addAttribute("jjimInfo", chckJjim);
			} 
		}
		
    	ProductVO vo = service.info(PRD_CODE);
    	model.addAttribute("prdInfo", vo);
    	String prdnum = Integer.toString(vo.getPRD_NUM());
		Cookie recentlyViewed = new Cookie(prdnum,null);
		recentlyViewed.setPath("/");
		recentlyViewed.setMaxAge(0);
		response.addCookie(recentlyViewed);
		recentlyViewed = new Cookie(prdnum , prdnum);
		recentlyViewed.setPath("/");
		recentlyViewed.setMaxAge(60*60*24*3);
		response.addCookie(recentlyViewed);
    	
    	StockVO stockVO = stockService.sizeInStock(PRD_CODE);
    	model.addAttribute("stockInfo", stockVO);
    	
    	

//    	List<ReviewVO> reviewVO = reviewDAO.reviewList(PRD_CODE);
//    	model.addAttribute("reviewInfo", reviewVO);

    	return "/product/product-details";
    }
		
	@RequestMapping(value = "/getProductBrandPage")
	public String getProductBrandPage(Model model) {
		return "product/Product-brandPage";
	}
	
	@RequestMapping(value = "/getModal")
	public String getModal(Model model) {
		return "modaltest";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxToCart", method = RequestMethod.POST)
	public Map<String, Object> ajaxToCart(Model model, String code){
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/listToCart", method = RequestMethod.POST)
	public Map<String,Object> listToCart(Model model, String code, StockVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		List<StockVO> stock = service.getStock(map);
		String stockStr = stock.get(0).toString();
		String cutStr = "StockVO [STOCK_PRDCODE=" + code + ", ";
		stockStr = stockStr.replace(cutStr, "");
		String[] STOCK_size = stockStr.split(", "); 
		STOCK_size[14] = STOCK_size[14].replace("]", "");
		String STOCK_220 = STOCK_size[0].replace("STOCK_220=", "");
		String STOCK_225 = STOCK_size[1].replace("STOCK_225=", "");
		String STOCK_230 = STOCK_size[2].replace("STOCK_230=", "");
		String STOCK_235 = STOCK_size[3].replace("STOCK_235=", "");
		String STOCK_240 = STOCK_size[4].replace("STOCK_240=", "");
		String STOCK_245 = STOCK_size[5].replace("STOCK_245=", "");
		String STOCK_250 = STOCK_size[6].replace("STOCK_250=", "");
		String STOCK_255 = STOCK_size[7].replace("STOCK_255=", "");
		String STOCK_260 = STOCK_size[8].replace("STOCK_260=", "");
		String STOCK_265 = STOCK_size[9].replace("STOCK_265=", "");
		String STOCK_270 = STOCK_size[10].replace("STOCK_270=", "");
		String STOCK_275 = STOCK_size[11].replace("STOCK_275=", "");
		String STOCK_280 = STOCK_size[12].replace("STOCK_280=", "");
		String STOCK_285 = STOCK_size[13].replace("STOCK_285=", "");
		String STOCK_290 = STOCK_size[14].replace("STOCK_290=", "");
		List<String> stocks = new ArrayList<String>();
		stocks.add(STOCK_220);
		stocks.add(STOCK_225);
		stocks.add(STOCK_230);
		stocks.add(STOCK_235);
		stocks.add(STOCK_240);
		stocks.add(STOCK_245);
		stocks.add(STOCK_250);
		stocks.add(STOCK_255);
		stocks.add(STOCK_260);
		stocks.add(STOCK_265);
		stocks.add(STOCK_270);
		stocks.add(STOCK_275);
		stocks.add(STOCK_280);
		stocks.add(STOCK_285);
		stocks.add(STOCK_290);
	
		map.put("stocks", stocks);
		map.put("code", code);
		
	    return map;
	}
	
	@RequestMapping(value = "/product/List/{condition}/{orderby}/{category}/{page}", method = RequestMethod.GET)
	public String getProductList(Model model, @PathVariable("condition") String condition,
			@PathVariable("category") String category, @PathVariable("orderby") String orderby,
			@PathVariable("page") String pageR,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "brand", required = false, defaultValue = "") String brand,
			@RequestParam(value = "color", required = false, defaultValue = "") String color,
			@RequestParam(value = "minPrice", required = false, defaultValue = "0") String minPriceR,
			@RequestParam(value = "maxPrice", required = false, defaultValue = "150000") String maxPriceR,
			HttpSession session) throws Exception {
		Map<String, String> info = new HashMap<String, String>();
		info.put("condition", condition);
		info.put("orderby", orderby);
		info.put("category", category);
		info.put("keyWord", keyword);
		info.put("brand", brand);
		info.put("color", color);
		info.put("minPrice", minPriceR);
		info.put("maxPrice", maxPriceR);
		model.addAttribute("info", info);
		int page = Integer.parseInt(pageR);
		int limit = 12;
		int listCount;
		int startPage;
		int endPage;
		int maxPage;
		int minPrice = Integer.parseInt(minPriceR);
		int maxPrice = Integer.parseInt(maxPriceR);
		
		
		
		String[] colors=color.split("_");
		for(int i = 0 ; i < colors.length ; i++) {
			if(colors[i].equals("white") || colors[i] == "white" ) {
				colors[i] = "WH";
			}else if(colors[i].equals("black") || colors[i] == "black") {
				colors[i] = "BK";
			}else if(colors[i].equals("grey") || colors[i] == "grey") {
				colors[i] = "GREY";
			}else if(colors[i].equals("red") || colors[i] == "red") {
				colors[i] = "RED";
			}else if(colors[i].equals("blue") || colors[i] == "blue") {
				colors[i] = "BLUE";
			}else if(colors[i].equals("green") || colors[i] == "green") {
				colors[i] = "GREEN";
			}else if(colors[i].equals("multi") || colors[i] == "multi") {
				colors[i] = "MULTI";
			}
		}
		String colorQuerry = "select PRD_COLOR from product ";
		if(colors[0].length()>0) {
			colorQuerry += "where ";
		for(int i = 0 ; colors.length>i;i++) {
			colorQuerry += "PRD_COLOR='"+colors[i] +"' or ";	
		}
			colorQuerry = colorQuerry.substring(0, (colorQuerry.length()-3));
		}
		
		String gender = "";

		if (condition.equals("men") || condition == "men") {
			gender = "남";
		} else if (condition.equals("women") || condition == "women") {
			gender = "여";
		} else if (condition.equals("new")) {

		} else if (condition.equals("best")) {

		}

		String prdCategory = "";
		if (category.equals("sneakers")) {
			prdCategory = "스니커즈";
		} else if (category.equals("converse")) {
			prdCategory = "캔버스화";
		} else if (category.equals("slipon")) {
			prdCategory = "슬립온";
		} else if (category.equals("mule")) {
			prdCategory = "뮬";
		}

		String ascdesc = "";
		if (orderby.equals("newest") || orderby == "newest") {
			orderby = "PRD_NUM";
			ascdesc = "desc";
		} else if (orderby.equals("lowprice") || orderby == "lowprice") {
			orderby = "PRD_PRICE";
			ascdesc = "asc";
		} else if (orderby.equals("highprice") || orderby == "highprice") {
			orderby = "PRD_PRICE";
			ascdesc = "desc";
		}

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", keyword);
		map.put("category", prdCategory);
		map.put("gender", gender);
		map.put("minPrice", minPrice);
		map.put("maxPrice", maxPrice);
		map.put("orderby", orderby);
		map.put("ascdesc", ascdesc);
		map.put("color", colorQuerry);
		map.put("brand", brand);
		map.put("page", (page - 1) * limit);
		listCount = service.countProductList(map);
		
		List<ProductVO> list = null;
		if(condition.equals("best")) {
			System.out.println(map.get("category"));
			list = service.listPageBestShoes(map);
		}else {
			list = service.getList(map);	
		}
		List<Integer> jjimcheck = new ArrayList<Integer>();
		UserVO user = (UserVO) session.getAttribute("user");
		if(user !=null) {
			List<Integer> jjimList = service.getJjimList(user.getCUS_ID());
			for(int i = 0 ; i < list.size() ; i ++) {
				int jjim = 0;
				int prdnum = list.get(i).getPRD_NUM();
				for (int j = 0 ; j < jjimList.size(); j ++) {
					int jjjim = jjimList.get(j);
					
					if(jjjim == prdnum) {
						jjim =1 ;
					}
				}
				jjimcheck.add(jjim);
			}
		}else {
			for(int i = 0 ; i < list.size() ; i ++) {
					jjimcheck.add(0);
			}
		}
		model.addAttribute("jjimcheck", jjimcheck);
		
//		service.getStock(list);
		model.addAttribute("list", list);


		maxPage = (int) ((double) listCount / limit + 0.95);
		startPage = (((int) ((double) page / 5 + 0.8)) - 1) * 5 + 1;
		endPage = startPage + 4;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setEndPage(endPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		model.addAttribute("pageInfo", pageInfo);
		
		if (keyword != "") {
			model.addAttribute("keyword", keyword);
		}
		
		return "product/ProductList";
	}
	
	@RequestMapping(value = "/dojjim", method = RequestMethod.POST)
	@ResponseBody
	public String doJjim(HttpSession session,String prdnum) throws Exception{
		UserVO user = (UserVO) session.getAttribute("user");

		if(user ==  null) {
			return "login";
		}else {
		
		JjimVO jjimVO = new JjimVO();
		jjimVO.setJJIM_CUSID(user.getCUS_ID());
		jjimVO.setJJIM_PRDNUM(Integer.parseInt(prdnum));
		if(myService.selJjimById(jjimVO) == null) {
			myService.addJjim(jjimVO);
		} else {
			myService.removeJjim(jjimVO);
		}
		
		
		return "success";}
	}
	
	
}
