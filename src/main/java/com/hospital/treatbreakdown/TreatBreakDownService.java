package com.hospital.treatbreakdown;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class TreatBreakDownService {
	@Inject
	private TreatBreakDownDAO treatBreakDownDAO;
	
	//입력
	public int setWrite(TreatBreakDownVO treatBreakDownVO)throws Exception{
		
		return treatBreakDownDAO.setWrite(treatBreakDownVO);
	}
	
	//리스트
	public List<TreatBreakDownVO> getOneList(PageMaker pageMaker,TreatBreakDownVO treatBreakDownVO) throws Exception{
		pageMaker.setKind(treatBreakDownVO.getId());
		pageMaker.setPerPage(5);
		pageMaker.makeRow();
		int totalCount = treatBreakDownDAO.getOneTotalCount(treatBreakDownVO);
		pageMaker.makePage(totalCount);
		List<TreatBreakDownVO> list = treatBreakDownDAO.getOneList(pageMaker);
		return list;
	}
	
	public int getOneTotalCount(TreatBreakDownVO treatBreakDownVO) throws Exception{
		int total;
		try {
			total = treatBreakDownDAO.getOneTotalCount(treatBreakDownVO);
		} catch (Exception e) {
			total = 0;
		}
		return total;
	}
	
	public int setUpdate(TreatBreakDownVO treatBreakDownVO)throws Exception{
		return treatBreakDownDAO.setUpdate(treatBreakDownVO);
	}
	
	//관리자용
	public int getAllTotalCount() throws Exception{
		return treatBreakDownDAO.getAllTotalCount();
	}
	
	public List<TreatBreakDownVO> getAllList(PageMaker pageMaker)throws Exception{
		pageMaker.makeRow();
		int totalCount = treatBreakDownDAO.getAllTotalCount();
		pageMaker.makePage(totalCount);
		List<TreatBreakDownVO> list = treatBreakDownDAO.getAllList(pageMaker);
		return list;
	}
}
