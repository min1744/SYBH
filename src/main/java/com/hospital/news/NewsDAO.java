package com.hospital.news;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.hospital.util.PageMaker;



@Repository
public class NewsDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="NewsMapper.";
	
	public int getTotalCount(PageMaker pageMaker) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pageMaker);
	}
	
	public int setWrite(NewsVO newsVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", newsVO);
	}
	
	public int setDelete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}
	
	public int setUpdate(NewsVO newsVO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", newsVO);
	}
	
	public NewsVO getSelect(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", num);
	}
	
	public List<NewsVO> getList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pageMaker);
	}
	
	public int addHit(int num) throws Exception{
		return sqlSession.update(NAMESPACE+"addHit", num);
	}
	
	

}
