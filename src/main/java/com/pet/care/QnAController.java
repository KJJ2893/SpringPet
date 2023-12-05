package com.pet.care;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.QnaDAO;
import vo.QnaVO;
import vo.UserVO;

@Controller
public class QnAController {
	
	QnaDAO qna_dao;
	
	@Autowired
	HttpSession session;

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
		List<QnaVO> list = qna_dao.qna_selectList();
		model.addAttribute("list", list);
		return VIEW_PATH + "qna_main.jsp";
	}
	
	@RequestMapping("qna_insert.do")
	public String qna_insert(QnaVO vo) {
		UserVO userVO = (UserVO)session.getAttribute("id");
		
		return null;
	}
	
	
}
