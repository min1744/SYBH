package com.hospital.pay;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class PayService {
	@Inject
	private PayDAO payDAO;
	
	//결제 입력
	public int setWrite(PayVO payVO) throws Exception{
		return payDAO.setWrite(payVO);
	}
	
	//한사람 모든 결제 내역
	public List<PayVO> getOneList(PageMaker pageMaker,String id) throws Exception{
		pageMaker.makeRow();
		int totalCount = payDAO.getOneTotalCount(id);
		pageMaker.makePage(totalCount);
		
		List<PayVO> list = payDAO.getOneList(pageMaker);
		
		return list;
		
	}
	//후원 총금액
	public int getSupportList() throws Exception{
		return payDAO.getSupportList();
	}
	
	//관리자용 전체 건강검진 결제내역
	public List<PayVO> getAllList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<PayVO> list = payDAO.getAllList(pageMaker);
		
		int totalCount = payDAO.getAllTotalCount();
		pageMaker.makePage(totalCount);
		return list;
	}
	
}
