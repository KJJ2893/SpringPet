package com.pet.care;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.RevDAO;
import vo.RevVO;

@Controller
public class RevController {

	public final static String VIEW_PATH = "/WEB-INF/views/rev/";
	
	RevDAO rev_dao;
	
	 @Autowired
	    HttpServletRequest request;

	
	public RevController(RevDAO rev_dao) {
		this.rev_dao = rev_dao;
		System.out.println("예약컨트롤러");
	}
	/*
	 * @RequestMapping("rev_main.do") public String rev_main() {
	 * 
	 * return VIEW_PATH + "rev_main.jsp"; }
	 */
	
	@RequestMapping("rev_main.do")
	public String rev_list(Model model) {
		List<RevVO> list = rev_dao.rev_selectList();
		model.addAttribute("list", list);
		return VIEW_PATH + "rev_main.jsp";
	}
	
	@RequestMapping("rev_insert.do")
	public String rev_insert(RevVO vo) {
		
		int res = rev_dao.rev_insert(vo);
		
		System.out.println(res);
		
		if(res > 0) {
			return "redirect:rev_insert.do";
		}
			return null;
	}
	@RequestMapping("rev_del.do")
    public String delete(int rv_idx) {
        System.out.println(rv_idx);

       int res = rev_dao.delete(rv_idx);

       if(res == 0) {
           System.out.println("실패");
           return null;
       }
        return "redirect:rev_main.do";

    }
}
	
    


