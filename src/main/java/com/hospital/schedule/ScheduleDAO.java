package com.hospital.schedule;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ScheduleDAO {
	@Inject
	public SqlSession sqlSession;
	public static final String NAMESPACE = "ScheduleMapper.";
	
	//의사 한명 스케쥴표
	public List<ScheduleVO> getOneList(int num)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOneList",num);
	}
	
}
