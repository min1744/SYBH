package com.hospital.treatbreakdown;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class TreatBreakDownDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "TreatBreakDownMapper.";
	
	//입력
	public int setWrite(TreatBreakDownVO treatBreakDownVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite",treatBreakDownVO);
	}
	
	//횟수
	public int getOneTotalCount(TreatBreakDownVO treatBreakDownVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOneTotalCount",treatBreakDownVO);
	}
	
	//리스트
	public List<TreatBreakDownVO> getOneList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOneList",pageMaker);
	}
	
	public int setUpdate(TreatBreakDownVO treatBreakDownVO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate",treatBreakDownVO);
	}
}
