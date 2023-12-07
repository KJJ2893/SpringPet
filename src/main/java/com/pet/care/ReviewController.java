package com.pet.care;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReviewDAO;
import vo.ReviewVO;

@Controller
public class ReviewController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/review/";
	
	ReviewDAO review_dao;
	
	public ReviewController(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	@RequestMapping("review_main.do")
	public String review_main(Model model) {
		
		List<ReviewVO> list = review_dao.selectReviews();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"review.jsp";
	}
	
	
	
}
