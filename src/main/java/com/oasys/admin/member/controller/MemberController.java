package com.oasys.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oasys.admin.member.service.MemberService;
import com.oasys.common.member.vo.MemberVO;
import com.oasys.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/admin/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService memberService;
	
	@RequestMapping(value="/memberList")
	public String memberList(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("memberList 호출...");
		log.info("search : " + mvo.getSearch());
		log.info("keyword : " + mvo.getKeyword());
		
		List<MemberVO> memberList = memberService.memberList(mvo);
		List<MemberVO> adminList = memberService.adminList(mvo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("adminList", adminList);
		
		int total = memberService.memberListCnt(mvo);
		log.info("membercnt : " + total);
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/member/memberList";
	}
	
	
	@RequestMapping(value="/mgrade")
	public String memberGrade() {
		return "admin/member/adminExample";
	}
}