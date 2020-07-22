package com.naver.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
	
	@Autowired
	private MailSender mailSender;
	 
	public void setMailSender(MailSender mailSender) {
	    this.mailSender = mailSender;
	}
	
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
		sendPWEmail(result.getEmail(), result.getPw());
		return "회원님의 이메일로 비밀번호를 전송해드렸습니다.";
	}
	
	

	@RequestMapping(value="/emailAuth" , produces="text/plain;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(HttpServletRequest request) {
	    
	    String email = request.getParameter("email");
	    String authNum = "";
	        
	    System.out.println(email);
	    authNum = randomNum();
	    //가입승인에 사용될 인증키 난수 발생    
	    sendEmail(email, authNum);
	    //이메일전송
	    String str = authNum;
	        
	        
	    return str;
	}
	    
	private String randomNum() {
	    StringBuffer buffer = new StringBuffer();
	        
	    for( int i = 0 ; i <= 6 ; i++) {
	        int n = (int)(Math.random()*10);
	        buffer.append(n);
	    }
	    return buffer.toString();
	}
	 
	public void sendEmail(String email , String authNum ) {
	    //이메일 발송 메소드
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("Spring Book 회원가입 안내 .[이메일 제목]");
	    mailMessage.setFrom("jgms95@naver.com");
	    mailMessage.setText("[이메일 내용]회원가입을 환영합니다. 인증번호를 확인해주세요. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	public void sendPWEmail(String email , String pw ) {
	    //이메일 발송 메소드
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("Spring Book 비밀번호 안내 .[이메일 제목]");
	    mailMessage.setFrom("jgms95@naver.com");
	    mailMessage.setText("[이메일 내용]회원님의 비밀번호는 [ "+pw+" ]입니다.");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	

	
	

	



}
