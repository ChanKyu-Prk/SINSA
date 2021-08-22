package kr.co.sinsa.biz.product;

import java.util.List;

public interface ProductService {
	public ProductVO info(String PRD_CODE);
	
	public List<ProductVO> list(ProductVO vo) throws Exception;
	
	public int count(String condition, ProductVO vo) throws Exception;
	
	public int countAll() throws Exception;
	public int countSneakersForAll() throws Exception;
	public int countConverseForAll() throws Exception;
	public int countSlip_onForAll() throws Exception;
	public int countMuleForAll() throws Exception;

	
	public int countOnlyMen() throws Exception;
	public int countOnlyWomen() throws Exception;
	
	public int countOnlySneakersForMen() throws Exception;
	public int countOnlyConverseForMen() throws Exception;
	public int countOnlySlip_onForMen() throws Exception;
	public int countOnlyMuleForMen() throws Exception;

	public int countOnlySneakersForWomen() throws Exception;
	public int countOnlyConverseForWomen() throws Exception;
	public int countOnlySlip_onForWomen() throws Exception;
	public int countOnlyMuleForWomen() throws Exception;
	
	public List<ProductVO> listPage(int displayPost, int PostNum, String keyword, ProductVO vo, String condition) throws Exception;

	
	public List<ProductVO> listPageOnlySlip_onForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyMuleForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyConverseForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlySneakersForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageOnlySlip_onForMen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyMuleForMen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyConverseForMen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlySneakersForMen(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageBestShoes(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageBestSneakers(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageBestConverse(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageSlipOnForBest(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageMuleForBest(int displayPost, int PostNum, String keyword) throws Exception;
	
	
	public List<ProductVO> listPageNew(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageSneakersForNew(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageConverseForNew(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageSlipOnForNew(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageMuleForNew(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageOnlyWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyMen(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageAll(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageSneakersForAll(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageConverseForAll(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageSlip_onForAll(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageMuleForAll(int displayPost, int postNum, String keyword) throws Exception;
}
