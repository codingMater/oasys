package com.oasys.client.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oasys.client.review.service.ReviewService;
import com.oasys.common.member.vo.MemberVO;
import com.oasys.common.review.vo.ReviewVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
	private ReviewService reviewService;
	
	//리뷰 리스트
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList(@ModelAttribute("data") ReviewVO rvo, Model model) {
		log.info("client reviewList 호출 성공");
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		//model.addAllAttributes("pageMaker", new )
		
		//전체 레코드수 구현
		int total = reviewService.reviewListCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "client/review/reviewList";
	}
	
	//상세보기
	@RequestMapping(value="/reviewDetail", method=RequestMethod.GET)
	public String reviewDetail(ReviewVO rvo, Model model) {
		log.info("client reviewDetail 호출 성공");
		
		ReviewVO detail = reviewService.reviewDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "client/review/reviewDetail";
	}
	
	//글쓰기 폼
	@RequestMapping(value="/reviewWrite")
	public String reviewWrite(MemberVO mvo, Model model, String m_id) {
		log.info("client reviewWrite 호출 성공");
		//MemberVO vo = memberClientService.memberSelect(m_id);
		return "client/review/reviewWrite";
	}
	
	//글쓰기 처리
	@RequestMapping(value="reviewInsert")
	public String reviewInsert(@ModelAttribute ReviewVO rvo, Model model) {
		log.info("client reviewInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = reviewService.reviewInsert(rvo);
		if(result == 1) {
			url = "review/reviewList";
		}
		
		return "redirect:/"+url;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/reviewDelete", method=RequestMethod.POST)
	public String reviewDelete(@ModelAttribute("detail") ReviewVO rvo) {
		log.info("client reviewDelete 호출 성공");
		int result = 0;
		String url = "";
		
		result = reviewService.reviewDelete(rvo);
		
		if(result == 1) {
			url="/review/reviewList";
		}
		
		return "redirect:"+url;
	}
}
