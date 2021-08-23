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
	
	public int count(String condition, ProductVO vo) throws Exception{
		HashMap<String, Object> data = new HashMap<String, Object>();
		String white = vo.getWhite();
		String black = vo.getBlack();
		String blue = vo.getBlue();
		String gray = vo.getGray();
		String green = vo.getGreen();
		String red = vo.getRed();
		String maxamount = vo.getMaxamount();
		String minamount = vo.getMinamount();

		data.put("White", white);
		data.put("Black", black);
		data.put("Blue", blue);
		data.put("Gray", gray);
		data.put("Green", green);
		data.put("Red", red);
		data.put("Maxamount", maxamount);
		data.put("Minamount", minamount);
		
		return SST.selectOne("ProductDAO.count", data);
	}

	public ProductVO info(String PRD_CODE) {
		return SST.selectOne("ProductDAO.info", PRD_CODE);
	}
	
	public List<ProductVO> list(ProductVO vo) throws Exception{
		return SST.selectList("ProductDAO.list", vo);
	}
	public int countAll() throws Exception{
		return SST.selectOne("ProductDAO.countAll");
	}
	public int countSneakersForAll() throws Exception{
		return SST.selectOne("ProductDAO.countSneakersForAll");
	}
	public int countConverseForAll() throws Exception{
		return SST.selectOne("ProductDAO.countConverseForAll");
	}
	public int countSlip_onForAll() throws Exception{
		return SST.selectOne("ProductDAO.countSlip_onForAll");
	}
	
	public int countMuleForAll() throws Exception{
		return SST.selectOne("ProductDAO.countMuleForAll");
	}

	
	/* 구분선---------------------------------------------------------------------------------------------------------------------- */
	

	
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
	
	
	public List<ProductVO> listPage(int displayPost, int postNum, String keyword, int minamount, int maxamount, String condition, ProductVO vo) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		String white = vo.getWhite();
		String black = vo.getBlack();
		String blue = vo.getBlue();
		String gray = vo.getGray();
		String green = vo.getGreen();
		String red = vo.getRed();
		
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		data.put("minamount", minamount);
		data.put("maxamount", maxamount);
		data.put("condition", condition);
		
		data.put("White", white);
		data.put("Black", black);
		data.put("Blue", blue);
		data.put("Gray", gray);
		data.put("Green", green);
		data.put("Red", red);
		
		
		
		return SST.selectList("ProductDAO.listPage", data);
	}
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
	public List<ProductVO> listPageBestSneakers(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageBestSneakers", data);
	}
	public List<ProductVO> listPageBestConverse(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageBestConverse", data);
	}
	public List<ProductVO> listPageSlipOnForBest(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageSlipOnForBest", data);
	}
	public List<ProductVO> listPageMuleForBest(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageMuleForBest", data);
	}
	
	public List<ProductVO> listPageNew(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageNew", data);
	}
	public List<ProductVO> listPageSneakersForNew(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageSneakersForNew", data);
	}
	public List<ProductVO> listPageConverseForNew(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageConverseForNew", data);
	}
	public List<ProductVO> listPageSlipOnForNew(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageSlipOnForNew", data);
	}
	public List<ProductVO> listPageMuleForNew(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		return SST.selectList("ProductDAO.listPageMuleForNew", data);
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
	public List<ProductVO> listPageSneakersForAll(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return SST.selectList("ProductDAO.listPageSneakersForAll", data);
	}
	public List<ProductVO> listPageConverseForAll(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return SST.selectList("ProductDAO.listPageConverseForAll", data);
	}
	public List<ProductVO> listPageSlip_onForAll(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return SST.selectList("ProductDAO.listPageSlip_onForAll", data);
	}
	public List<ProductVO> listPageMuleForAll(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		
		return SST.selectList("ProductDAO.listPageMuleForAll", data);
	}

}
