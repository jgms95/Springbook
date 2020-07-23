package com.naver.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.ItemDTO;
import kr.co.domain.PickupDTO;
import kr.co.service.PickupService;

@Controller
@RequestMapping("pickup")
public class PickupController {

	@Inject
	private PickupService pickupService;

	@RequestMapping(value = "/pickupList/{id}", method = RequestMethod.GET)
	public String pickupList(ItemDTO dto, Model model, @PathVariable("id") String id) {

		List<PickupDTO> pickupList = pickupService.pickupList(id);

		model.addAttribute("pickupList", pickupList);

		return "pickup/pickupList";
	}

	@RequestMapping(value = "/pickupDelete/{pno}", method = RequestMethod.GET)
	public String pickupDelete(@PathVariable("pno") int pno, Model model, String id, HttpSession session) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		pickupService.pickupDelete(pno);
		System.out.println(id);

		return "redirect:/pickup/pickupList/" + id;// 주소줄에 유저 아이디 필요
	}

}