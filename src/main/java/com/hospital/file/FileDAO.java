package com.hospital.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="FileMapper.";
	
	public int setWrite(List<FileVO> files) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"setWrite", files);
		return result;
		
	}
	
	public int setUpdate(FileVO fileVO)throws Exception{
		int result = sqlSession.update(NAMESPACE+"setUpdate", fileVO);
		return result;
	}
	
	public int setDelete(int fnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", fnum);
	}
	
	public int setDeleteAll(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteAll", num);
	}
	
	public FileVO getSelect(int fnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", fnum);
	}
	
	public List<FileVO> getList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", num);
	}
	
}
