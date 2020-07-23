package com.naver.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import kr.co.domain.ItemDTO;
import kr.co.service.BookSaleService;



@Controller
@RequestMapping("booksale")
public class BookSaleController {
	@Inject
	private BookSaleService bService;
	
	
	
	
@RequestMapping(value = "/insert", method = RequestMethod.GET)
public void insert() {
}
	
	
	@RequestMapping(value= "/list" ,method = RequestMethod.GET)
	public String list(Model model) {
	
		
		List<ItemDTO> list = bService.list();
		
		model.addAttribute("list", list);
		return "/booksale/list";
	}
	
	
	/*
	 
    @RequestMapping(value= "/list" ,method = RequestMethod.GET)
	public void list(Model model) {
	
		List<ItemDTO> list = bService.list();
		model.addAttribute("list", list);
		
	}
	  
	*/

	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert( MultipartHttpServletRequest multi) {
	    
    
		String root = multi.getSession().getServletContext().getRealPath("/");

		String path = root+"resources/img/";
	
		String newFileName = ""; // 업로드 되는 파일명
	    String ititle = multi.getParameter("ititle");
	    String iwriter = multi.getParameter("iwriter");
	    String publishDay = multi.getParameter("publishDay");
	    String publisher = multi.getParameter("publisher");
	    String cateCode = multi.getParameter("cateCode");
	    String content = multi.getParameter("content");
	    String sprice = multi.getParameter("price");
	    String spercent = multi.getParameter("percent");
	    
	    int percent = 0;
	    if(spercent!=null) {
	    	percent = Integer.parseInt(spercent);
	    }
	    
	    
	 
	    
	    int price =0;
	    
	    if(sprice!=null) {
	    	price = Integer.parseInt(sprice);
	    }
	    
	    
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		ItemDTO dto = null;
				
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()){
			String uploadFile = files.next();
						
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
		
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			dto = new ItemDTO(0, ititle, iwriter, publishDay, publisher, cateCode, newFileName, content, price, 0, null, percent);
		
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		bService.insert(dto);
		
		
	
		return "redirect:/booksale/list";
	}
	
	@RequestMapping(value="/delete/{ino}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("ino") int ino) {
		bService.delete(ino);
		System.out.println(ino);
		return "redirect:/booksale/list";
	}
}
	
	