package com.hospital.pharmacy;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PharmacyDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="PharmacyMapper.";
	
}