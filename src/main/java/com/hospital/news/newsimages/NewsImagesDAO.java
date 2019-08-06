package com.hospital.news.newsimages;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class NewsImagesDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="NewsImagesMapper.";
	
	//insert
	public int setWrite(NewsImagesVO newsImagesVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", newsImagesVO);
	}
	public int setUpdate(NewsImagesVO newsImagesVO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", newsImagesVO);
	}

	public NewsImagesVO getSelect(int fnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
}
