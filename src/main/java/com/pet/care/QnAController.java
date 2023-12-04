package com.pet.care;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {

	public final static String VIEW_PATH = "/WEB-INF/views/qna/";
	
	public QnAController() {
		
	}
	
	@RequestMapping("qna_form.do")
	public String qna_form() {
		
		return VIEW_PATH + "qna_form.jsp";
	}
	
	@RequestMapping("qna_main.do")
	public String qna_main() {
		
		return VIEW_PATH + "qna_main.jsp";
	}
}
