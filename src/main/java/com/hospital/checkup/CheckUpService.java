package com.hospital.checkup;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class CheckUpService {
	@Inject
	private CheckUpDAO checkUpDAO;
	
	//건강검진 입력
	public int setWrite(CheckUpVO checkUpVO) throws Exception{
		return checkUpDAO.setWrite(checkUpVO);
	}
	
	//건강검진 리스트
	public List<CheckUpVO> getOneList(PageMaker pageMaker,CheckUpVO checkUpVO) throws Exception{
		pageMaker.setKind(checkUpVO.getId());
		pageMaker.setPerPage(5);
		pageMaker.makeRow();
		int totalCount = checkUpDAO.getOneTotalCount(checkUpVO);
		pageMaker.makePage(totalCount);
		
		List<CheckUpVO> list = checkUpDAO.getOneList(pageMaker);
		
		return list;
	}
	//예약상태 업뎃
	public int setUpdate(CheckUpVO checkUpVO)throws Exception{
		return checkUpDAO.setUpdate(checkUpVO);
	}
	//총 횟수
	public int getOneTotalCount(CheckUpVO checkUpVO)throws Exception{
		int total;
		try {
			total = checkUpDAO.getOneTotalCount(checkUpVO);
		} catch (Exception e) {
			total = 0;
		}
		return total;
	}
}
