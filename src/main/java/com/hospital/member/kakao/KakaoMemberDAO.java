package com.hospital.member.kakao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class KakaoMemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="KakaoMemberMapper.";
	
	
}