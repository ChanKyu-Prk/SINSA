package kr.co.sinsa.biz.customer.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sinsa.biz.customer.CustomerVO;
import kr.co.sinsa.biz.customer.MyOrderListVO;
import kr.co.sinsa.biz.customer.QnAVO;
import kr.co.sinsa.biz.orders.OrdersAndProductVO;
import kr.co.sinsa.biz.product.ProductVO;
import kr.co.sinsa.biz.user.UserVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate SST;
	
	public CustomerVO myInfo(UserVO vo) {
		return SST.selectOne("myInfo.myInfo",vo);
	}
	
	
	
	
	
	
	public List<MyOrderListVO> myOrderList(Map<String,Object> map) {
		return  SST.selectList("myInfo.orders", map);
	}
	public List<MyOrderListVO> myOrderListDate(Map<String,Object> map) {
		return  SST.selectList("myInfo.orderDate", map);
	}
	public int countState(Map<String,Object> map) {
		return SST.selectOne("myInfo.countState",map);
	}
	public int countStateDate(Map<String,Object> map) {
		return SST.selectOne("myInfo.countStateDate",map);
	}
	public int countmyOrderList(Map<String,Object> map) {
		return SST.selectOne("myInfo.countOders", map);
	}
	public int countmyOrderListDate(Map<String,Object> map) {
		return SST.selectOne("myInfo.countOdersDate", map);
	}
	
	
	public List<OrdersAndProductVO> orderStatus(String ORDER_NUM) {
		return SST.selectList("myInfo.orderStatus",ORDER_NUM);
	}
	
	
	
	
	
	public List<ProductVO> jjimList(Map<String,Object> map){
		return SST.selectList("myInfo.jjimList",map);
	}
	public int countJjimList(Map<String,Object> map){
		return SST.selectOne("myInfo.countJjimList",map);
	}
	
	
	
	
	
	
	public int reviewCheck(Map<String,String> map) {
	return SST.selectOne("myInfo.reviewCheck",map);
	}
	public ProductVO productSerch(String PRDCODE) {
		return SST.selectOne("myInfo.productSerch",PRDCODE);
	}
	
	
	
	
	public List<QnAVO> QnAList(Map<String,Object> map){
		return SST.selectList("myInfo.QnAList",map);
	}
	public List<QnAVO> QnAListDate(Map<String,Object> map){
		return SST.selectList("myInfo.QnAListDate",map);
	}
	public ProductVO productMatch(int prd_num){
		return SST.selectOne("myInfo.productMatch",prd_num);
	}
	public int countQnAList(Map<String,Object> map){
		return SST.selectOne("myInfo.countQnAList",map);
	}
	public int countQnAListDate(Map<String,Object> map){
		return SST.selectOne("myInfo.countQnAListDate",map);
	}
	
	
	
	
	
	
	
	
	
	public List<ProductVO> allProductNum(){
		return SST.selectList("myInfo.allProductNum") ;
	}
	public ProductVO recentView(int PRD_NUM){
		return SST.selectOne("myInfo.recentView",PRD_NUM);
	}

	
	
	
	
	
	public int passCheck(Map<String, String> map) {
	return SST.selectOne("myInfo.passCheck",map);
	}
	
	
	public void passChange(Map<String , String> map) {
		SST.update("myInfo.passChange",map);
	}
	
	public void privateInfoChange(CustomerVO vo) {
		SST.update("myInfo.privateInfoChange",vo);
	}
}