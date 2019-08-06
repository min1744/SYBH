package com.hospital.news;

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
	

}
