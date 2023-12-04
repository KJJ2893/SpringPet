package com.pet.care;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.PetDAO;
import vo.PetVO;
import vo.UserVO;

@Controller
public class PetController {

	public final static String VIEW_PATH = "/WEB-INF/views/pet/";

	PetDAO pet_dao;

	@Autowired
	HttpServletRequest request;
	
	public PetController(PetDAO pet_dao) {
		this.pet_dao = pet_dao;
		System.out.println("petController 생성자");
	}

	// 펫 정보 메인 화면 펫 리스트 보임
	@RequestMapping(value = { "petinfo_main.do" })
	public String list(Model model) {

		int idx = (((UserVO)request.getSession().getAttribute("id")).getU_idx());
		List<PetVO> list = pet_dao.selectList(idx);
		
		model.addAttribute("list", list);		

		return VIEW_PATH + "petinfo_main.jsp";
	}

	// 펫 리스트 화면
	@RequestMapping("petinfo_insert.do")
	public String petinfo_main() {
		return VIEW_PATH + "petinfo_insert.jsp";
	}
	
	// 펫 등록하기
	@RequestMapping("pet_insert.do")
	public String pet_insert(PetVO vo) {

		int res = pet_dao.insert(vo);
		
		if(res > 0) {
			return "redirect:petinfo_insert.do";
		}
			return null;
	}

	// 펫 정보 수정 화면
	@RequestMapping("petinfo_retouch.do")
	public String petinfo_retouch() {
		return VIEW_PATH + "petinfo_retouch.jsp";
	}
	
	// 펫 정보 삭제하기
	@RequestMapping("pet_del.do")
	public String delete(int p_idx)

}
