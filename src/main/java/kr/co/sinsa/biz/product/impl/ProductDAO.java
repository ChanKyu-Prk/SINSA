package kr.co.sinsa.biz.product.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.product.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate SST;
	
	public List<ProductVO> list(ProductVO vo) throws Exception{
		return SST.selectList("ProductDAO.list", vo);
	}
	public int countAll() throws Exception{
		return SST.selectOne("ProductDAO.countAll");
	}
	public int countOnlyMen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlyMen");
	}
	public int countOnlyWomen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlyWomen");
	}
	/* 구분선---------------------------------------------------------------------------------------------------------------------- */
	public int countOnlySneakersForMen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlySneakersForMen");
	}
	public int countOnlyConverseForMen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlyConverseForMen");
	}
	public int countOnlySlip_onForMen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlySlip_onForMen");
	}
	public int countOnlyMuleForMen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlyMuleForMen");
	}
	
/* 구분선---------------------------------------------------------------------------------------------------------------------- */

	public int countOnlySneakersForWomen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlySneakersForWomen");
	}
	public int countOnlyConverseForWomen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlyConverseForWomen");
	}
	public int countOnlySlip_onForWomen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlySlip_onForWomen");
	}
	public int countOnlyMuleForWomen() throws Exception{
		return SST.selectOne("ProductDAO.countOnlyMuleForWomen");
	}
	
	
	
	/* 구분선---------------------------------------------------------------------------------------------------------------------- */
	
	
	public List<ProductVO> listPageOnlySlip_onForMen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlySlip_onForMen", data);
	}
	public List<ProductVO> listPageOnlyMuleForMen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlyMuleForMen", data);
	}
	public List<ProductVO> listPageOnlyConverseForMen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlyConverseForMen", data);
	}
	public List<ProductVO> listPageOnlySneakersForMen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlySneakersForMen", data);
	}
	
	/* 구분선---------------------------------------------------------------------------------------------------------------------- */

	public List<ProductVO> listPageOnlySlip_onForWomen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlySlip_onForWomen", data);
	}
	public List<ProductVO> listPageOnlyMuleForWomen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlyMuleForWomen", data);
	}
	public List<ProductVO> listPageOnlyConverseForWomen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlyConverseForWomen", data);
	}
	public List<ProductVO> listPageOnlySneakersForWomen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlySneakersForWomen", data);
	}
	
	
	
	
	
	/* 구분선---------------------------------------------------------------------------------------------------------------------- */
	public List<ProductVO> listPageBestShoes(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageBestShoes", data);
	}
	
	public List<ProductVO> listPageNew(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageNew", data);
	}
	public List<ProductVO> listPageOnlyWomen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageOnlyWomen", data);
	}

	
	
	
	
	public List<ProductVO> listPageOnlyMen(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return SST.selectList("ProductDAO.listPageOnlyMen", data);
	}
	public List<ProductVO> listPageAll(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return SST.selectList("ProductDAO.listPageAll", data);
	}

}
