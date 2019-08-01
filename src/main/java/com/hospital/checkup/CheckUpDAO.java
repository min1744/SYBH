package com.hospital.checkup;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hospital.util.PageMaker;

@Repository
public class CheckUpDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CheckUpMapper.";
	
	//건강검진 입력
	public int setWrite(CheckUpVO checkUpVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite",checkUpVO);
	}
	
	//한사람 모든 건강검진 횟수 (count)
	public int getOneTotalCount(CheckUpVO checkUpVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOneTotalCount",checkUpVO);
	}
	
	//건강검진 리스트
	public List<CheckUpVO> getOneList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOneList",pageMaker);
	}
}
