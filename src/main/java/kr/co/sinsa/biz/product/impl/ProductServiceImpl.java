package kr.co.sinsa.biz.product.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.sinsa.biz.product.ProductService;
import kr.co.sinsa.biz.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO DAO;
	
	@Override
	public ProductVO info(String PRD_CODE) {
		return DAO.info(PRD_CODE);
	}
	
	@Override
	public List<ProductVO> list(ProductVO vo) throws Exception {
		return DAO.list(vo);
	}
	
	@Override
	public int countAll() throws Exception {
		return DAO.countAll();
	}
	
	@Override
	public int countOnlyMen() throws Exception {
		return DAO.countOnlyMen();
	}
	@Override
	public int countOnlyWomen() throws Exception {
		return DAO.countOnlyWomen();
	}
	
	@Override
	public int countOnlySneakersForMen() throws Exception {
		return DAO.countOnlySneakersForMen();
	}
	@Override
	public int countOnlyConverseForMen() throws Exception {
		return DAO.countOnlyConverseForMen();
	}
	@Override
	public int countOnlySlip_onForMen() throws Exception {
		return DAO.countOnlySlip_onForMen();
	}
	@Override
	public int countOnlyMuleForMen() throws Exception {
		return DAO.countOnlyMuleForMen();
	}
	
	
	@Override
	public int countOnlySneakersForWomen() throws Exception {
		return DAO.countOnlySneakersForWomen();
	}
	@Override
	public int countOnlyConverseForWomen() throws Exception {
		return DAO.countOnlyConverseForWomen();
	}
	@Override
	public int countOnlySlip_onForWomen() throws Exception {
		return DAO.countOnlySlip_onForWomen();
	}
	@Override
	public int countOnlyMuleForWomen() throws Exception {
		return DAO.countOnlyMuleForWomen();
	}
	
	
	
	@Override
	public List<ProductVO> listPageOnlyMuleForMen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlyMuleForMen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlySneakersForMen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlySneakersForMen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlySlip_onForMen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlySlip_onForMen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlyConverseForMen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlyConverseForMen(displayPost, postNum, keyword);
	}
	
	
	@Override
	public List<ProductVO> listPageOnlyMuleForWomen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlyMuleForWomen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlySneakersForWomen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlySneakersForWomen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlySlip_onForWomen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlySlip_onForWomen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlyConverseForWomen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlyConverseForWomen(displayPost, postNum, keyword);
	}
	
	
	@Override
	public List<ProductVO> listPageBestShoes(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageBestShoes(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageNew(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageNew(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageOnlyWomen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlyWomen(displayPost, postNum, keyword);
	}

	
	
	@Override
	public List<ProductVO> listPageOnlyMen(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageOnlyMen(displayPost, postNum, keyword);
	}
	@Override
	public List<ProductVO> listPageAll(int displayPost, int postNum, String keyword) throws Exception {
		return DAO.listPageAll(displayPost, postNum, keyword);
	}
	

}
