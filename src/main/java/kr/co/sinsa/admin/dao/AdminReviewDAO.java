package kr.co.sinsa.admin.dao;

import java.util.List;
import java.util.Map;

import kr.co.sinsa.admin.vo.AdminReviewVO;

public interface AdminReviewDAO {
	
	public List<AdminReviewVO> review_list(Map<String, Object> map);
	public int review_list_count(Map<String, Object> map);
	public List<AdminReviewVO> review_all_search(Map<String, Object> map);
	public int review_all_search_count(Map<String, Object> map);
	public AdminReviewVO review_info(int rev_num);
	public void review_delete(int rev_num);
	public void review_update(AdminReviewVO vo);

}
