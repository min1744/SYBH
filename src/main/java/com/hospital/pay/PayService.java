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
	
	//모든 결제내역 (건강검진 : 0, 후원 : 1)
	public List<PayVO> getAllList(PageMaker pageMaker,PayVO payVO) throws Exception{
		pageMaker.setSearch(Integer.toString(payVO.getCategory()));
		pageMaker.setPerPage(5);
		pageMaker.makeRow();
		int totalCount = payDAO.getAllTotalCount(payVO);
		pageMaker.makePage(totalCount);
		
		return payDAO.getAllList(pageMaker);
	}
	public List<PayVO> adminDonation(PageMaker pageMaker,PayVO payVO)throws Exception{
		pageMaker.setSearch(Integer.toString(payVO.getCategory()));
		pageMaker.makeRow();
		int totalCount = payDAO.getAllTotalCount(payVO);
		pageMaker.makePage(totalCount);
		
		return payDAO.getAllList(pageMaker);
	}
	
	//총 횟수
	public int getOneTotalCount(PayVO payVO) throws Exception{
		int total;
		try {
			
			total = payDAO.getOneTotalCount(payVO);
		} catch (Exception e) {
			total = 0;
		}
		
		return total;
	}
}
