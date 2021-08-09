package kr.co.sinsa.biz.product;

import java.util.List;

public interface ProductService {
	public List<ProductVO> list(ProductVO vo) throws Exception;
	public int countAll() throws Exception;
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
	
	public List<ProductVO> listPageOnlySlip_onForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyMuleForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyConverseForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlySneakersForWomen(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageOnlySlip_onForMen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyMuleForMen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyConverseForMen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlySneakersForMen(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageBestShoes(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageNew(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageOnlyWomen(int displayPost, int PostNum, String keyword) throws Exception;
	public List<ProductVO> listPageOnlyMen(int displayPost, int PostNum, String keyword) throws Exception;
	
	public List<ProductVO> listPageAll(int displayPost, int PostNum, String keyword) throws Exception;
}
