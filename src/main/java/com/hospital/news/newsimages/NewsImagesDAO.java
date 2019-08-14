package com.hospital.news.newsimages;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class NewsImagesDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="NewsImagesMapper.";
	
	//insert
	public int setWrite(NewsImagesVO newsImagesVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setWrite", newsImagesVO);
		
	}
	
	//update
	public int setUpdate(NewsImagesVO newsImagesVO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", newsImagesVO);
	}
	//select
	public NewsImagesVO getSelect(int fnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
	//delete
	public int setDelete(int fnum)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", fnum);
	}
}
