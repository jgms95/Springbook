package com.naver.controller;



import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member") // http://localhost:8089/member
@SessionAttributes({"login"})
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	
	@RequestMapping(value="/loginpost", method=RequestMethod.POST)
	public String loginpost(LoginDTO login, Model model, HttpSession session) {
		
		MemberDTO dto = memberService.loginpost(login);
		if(dto!=null) {
			model.addAttribute("login",dto);
			String path = (String) session.getAttribute("path");
			if(path != null) {
				return "redirect:" + path;
			}
			return "redirect:/";
		}else {
			return "redirect:/member/login";
		}

	} 
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET) // http://localhost:8089/member/insert
	public String insert() {
		return "member/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		
		int result = memberService.checkId(dto);
		try{
		if(result==0){
		memberService.insert(dto);
		}else{
		return "/member/insert";
		}
		}catch(Exception e){
			throw new RuntimeException();
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/findId", produces="application/json;charset=utf8", method = RequestMethod.POST)
	public String findId(MemberDTO dto) {
		MemberDTO result = memberService.findId(dto);
		if(result==null) {
			return "해당 정보에 맞는 아이디가 없습니니다.";
		}
		return "아이디: "+ result.getId() + "입니다.";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.POST)
	public int checkId(MemberDTO dto) {
		int result = memberService.checkId(dto);
		return result;
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "member/findPw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findPw", produces="application/json;charset=utf8", method = RequestMethod.POST)
	public String findPw(MemberDTO dto) {
		MemberDTO result = memberService.findPw(dto);
		if(result==null) {
			return "해당 정보에 맞는 비밀번호가 없습니니다.";
		}
		return "비밀번호: "+ result.getPw() + "입니다.";
	}
	
	

	

	



}
