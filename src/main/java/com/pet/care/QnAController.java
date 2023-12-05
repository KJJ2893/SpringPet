package com.pet.care;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.QnaDAO;
import vo.QnaVO;

@Controller
public class QnAController {
	
	QnaDAO qna_dao;

	public final static String VIEW_PATH = "/WEB-INF/views/qna/";
	
	public QnAController(QnaDAO qna_dao) {
		this.qna_dao = qna_dao;
	}

	@RequestMapping("qna_form.do")
	public String qna_form() {
		
		return VIEW_PATH + "qna_form.jsp";
	}
	
	@RequestMapping("qna_main.do")
	public String qna_main(Model model) {
		List<QnaVO> qna_list = qna_dao.qna_select_list();
		
		model.addAttribute("qna_list", qna_list);
		return VIEW_PATH + "qna_main.jsp";
	}
	
	
}
