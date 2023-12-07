package com.pet.care;

import java.util.List;

import org.springframework.stereotype.Controller;
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
	public String review_main() {
		
		List<ReviewVO> vo = review_dao.selectList();
		
		return VIEW_PATH+"review.jsp";
	}
	
	
	
}
