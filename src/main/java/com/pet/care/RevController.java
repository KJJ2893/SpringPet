package com.pet.care;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RevController {

	public final static String VIEW_PATH = "/WEB-INF/views/rev/";
	
	public RevController() {
		
	}
	@RequestMapping("rev_main.do")
	public String rev_main() {
		
		return VIEW_PATH + "rev_main.jsp";
	}
}
