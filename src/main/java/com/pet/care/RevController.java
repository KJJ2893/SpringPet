package com.pet.care;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.RevDAO;
import vo.RevVO;
import vo.UserVO;

@Controller
public class RevController {

	public final static String VIEW_PATH = "/WEB-INF/views/rev/";
	
	RevDAO rev_dao;
	

	public RevController() {
		this.rev_dao = rev_dao;
		System.out.println("예약컨트롤러");
	}
	@RequestMapping("rev_main.do")
	public String rev_main() {
		
		return VIEW_PATH + "rev_main.jsp";
	}
	

}
