package com.hospital.pay;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class PayDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "PayMapper.";
	
	//결제 입력
	public int setWrite(PayVO payVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", payVO);
	}
	
	//한사람 모든 결제 수
	public int getOneTotalCount(String id)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOneTotalCount",id);
	}
	
	//한사람 모든 결제 내역
	public List<PayVO> getOneList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOneList", pageMaker);
	}
	
	//후원 총 금액
	public int getSupportList() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSupportList");
	}
	
	//관리자용 전체 건강검진 결제 수
	public int getAllTotalCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllTotalCount");
	}
	
	//관리자페이지용 전체 건강검진 결제 내역
	public List<PayVO> getAllList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAllList",pageMaker);
	}
}
