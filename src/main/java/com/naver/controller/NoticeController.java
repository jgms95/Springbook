package com.naver.controller;








import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;
import kr.co.service.MemberService;
import kr.co.service.NoticeService;



@Controller
@RequestMapping("notice")

public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private MemberService mService;
	
	

	@RequestMapping(value="/noticelist/{curPage}",method=RequestMethod.GET)
	public String noticelist(Model model, @PathVariable("curPage") String curPage, String id) {
		int page = -1;
		if(curPage!=null){
		page = Integer.parseInt(curPage);
		}else{
		page = 1;
		}
	
		PageTO<NoticeDTO> to = new PageTO<NoticeDTO>(page);
		String authority = mService.findAuthority(id);
		
		to = nService.noticelist(to);
		model.addAttribute("authority",authority);
		model.addAttribute("to",to);
		model.addAttribute("list",to.getList());
		return "/notice/noticelist";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
	}
	
	
	
	
	
	

}
