package com.oasys.admin.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oasys.common.faq.dao.FaqDao;
import com.oasys.common.faq.vo.FaqVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImpl implements FaqService{
	
	@Setter(onMethod_=@Autowired)
	private FaqDao faqDao;
	

	//�۸��
	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		log.info("faqList...........");
		
		List<FaqVO> myList = null;
		myList = faqDao.faqList(fvo);
		
		return myList;
	}

	@Override
	public int faqInsert(FaqVO fvo) {
		log.info("faqInsert...........");
		
		int result = 0;
		result = faqDao.faqInsert(fvo);
		
		return result;
	}
	
	//게시판 세부사항
	@Override
	public FaqVO faqDetail(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDao.faqDetail(fvo);
		if(detail!=null) {
			detail.setFa_content(detail.getFa_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}
	
	@Override
	public FaqVO updateForm(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDao.faqDetail(fvo);
		return detail;
	}

	
	@Override
	public int faqUpdate(FaqVO fvo) {
		int result = 0;
		result = faqDao.faqUpdate(fvo);
		return result;
	}
	
	
	@Override
	public int faqDelete(int fa_num) {
		int result = 0;
		result = faqDao.faqDelete(fa_num);
		return result;
	}
	
}
