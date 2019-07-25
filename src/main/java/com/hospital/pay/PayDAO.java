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
	public int getOneTotalCount(PayVO payVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOneTotalCount", payVO);
	}
	
	//한사람 모든 결제 내역
	public List<PayVO> getOneList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOneList", pageMaker);
	}
	
	//후원 총 금액
	public int getDonationTotal() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDonationTotal");
	}
	
	//후원인 총 인원
	public int getDonationPeopleTotal() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDonationPeopleTotal");
	}
	
	//모든사람 결제 갯수(건강검진 : 0, 후원 : 1)
	public int getAllTotalCount(PayVO payVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllTotalCount",payVO );
	}
	
	//모든사람 결제내역 (건강검진 : 0, 후원 : 1)
	public List<PayVO> getAllList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAllList",pageMaker);
	}

	
}
