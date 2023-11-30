package com.pet.care;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDAO;

@Controller
public class MainController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/main/";
	
	UserDAO user_dao;
	
	public MainController(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	// 메인페이지
	@RequestMapping(value= {"/","main_home.do"}) 
	public String main() {
		return VIEW_PATH+"main_home.jsp";
	}
}
