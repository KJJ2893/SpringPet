package com.pet.care;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/main/";
	
	
	public MainController() {
		System.out.println("메인 컨트롤러 생성자");
	}
	
	// 메인페이지
	@RequestMapping(value= {"/","main_home.do"}) 
	public String main() {
		return VIEW_PATH+"main_home.jsp";
	}
}
