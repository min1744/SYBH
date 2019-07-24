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
	public List<PayVO> getOneList(PageMaker pageMaker,PayVO payVO) throws Exception{
		pageMaker.setKind(payVO.getId());
		pageMaker.setSearch(Integer.toString(payVO.getCategory()));
		
		pageMaker.makeRow();
		int totalCount = payDAO.getOneTotalCount(payVO);
		pageMaker.makePage(totalCount);
		
		List<PayVO> list = payDAO.getOneList(pageMaker);
		
		return list;
		
	}
	//후원 총금액
	public int getDonationTotal() throws Exception{
		return payDAO.getDonationTotal();
	}
	
	//후원인 총 인원
	public int getDonationPeopleTotal() throws Exception{
		return payDAO.getDonationPeopleTotal();
	}
	
	//후원 내역 전체인원
	public List<PayVO> getDonationList() throws Exception{
		return payDAO.getDonationList();
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
