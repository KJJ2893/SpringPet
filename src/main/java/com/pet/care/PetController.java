package com.pet.care;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.PetDAO;
import vo.PetVO;

@Controller
public class PetController {
	
	
	public final static String VIEW_PATH = "/WEB-INF/views/pet/";
	
	PetDAO pet_dao;
	
	public PetController(PetDAO pet_dao) {
		this.pet_dao = pet_dao;
		System.out.println("petController 생성자");
	}
	
	// 펫 정보 메인 화면 펫 리스트 보임
	@RequestMapping(value={"petinfo_main.do"})
	public String list(Model model) {
		List<PetVO> list = pet_dao.selectList();
		
		model.addAttribute("list", list);		
		return VIEW_PATH + "petinfo_main.jsp";
	}
	
	// 펫 정보 수정 화면
	@RequestMapping("petinfo_retouch.do")
	public String petinfo_retouch() {
		return VIEW_PATH + "petinfo_retouch.jsp";
	}
	
	// 펫 정보 등록 화면
	@RequestMapping("petinfo_insert.do")
	public String petinfo_insert() {
		return VIEW_PATH + "petinfo_insert.jsp";
	}
	

}
