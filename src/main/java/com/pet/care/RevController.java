package com.pet.care;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.RevDAO;
import vo.RevVO;

@Controller
public class RevController {

	public final static String VIEW_PATH = "/WEB-INF/views/rev/";
	
	RevDAO rev_dao;
	
	 @Autowired
	    HttpServletRequest request;
	 
	 
	 @Autowired
	  	HttpSession session;

	
	public RevController(RevDAO rev_dao) {
		this.rev_dao = rev_dao;
		System.out.println("예약컨트롤러");
	}
	
	// 예약 메인 화면
	@RequestMapping("rev_main.do")
	public String rev_list() {
		
		return VIEW_PATH + "rev_main.jsp";
	}
	
	// 예약 하는 화면
	@RequestMapping("revInsert.do")
	public String revInsert(Model model) {
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String toDay = year+"-"+month+"-"+date;
		
		model.addAttribute("today", toDay);
		
		return VIEW_PATH + "rev_insert.jsp";
	}
	
	// 예약 시간 설정
	@RequestMapping("rev_time.do")
	public String rev_time(Model model, String rv_day , String userId) {
		
		System.out.println(1);
		
		List<String> time = new ArrayList<String>();
		
		System.out.println(3);
		
		int s = 10;
		
		for(int i = 0; i < 11; i++) {
			time.add((s+i)+":00");
		}
		
		System.out.println(2);
		
		List<String> list = rev_dao.rev_selectList2(rv_day);
		
		System.out.println(5);
		
		for(int i = 0; i < time.size(); i++) {
			for(int j=0; j < list.size(); j++) {
				if(time.get(i) != null || list.get(j) != null) {
					if(time.get(i).equals(list.get(j))) {
						time.remove(i);
					} else {
						continue;
					}
				} else {
					continue;
				}
				
			}
		}
		
		System.out.println(4);
		System.out.println("time.size()  "+time.size());
		
		model.addAttribute("time", time);
		model.addAttribute("rv_day", rv_day);
		
		
		return VIEW_PATH + "rev_time.jsp";
	}
	
	@RequestMapping("rev_info.do")
	public String rev_info(Model model, String rv_day, String rv_time) {

		System.out.println(rv_time);

		String date[] = { rv_day, rv_time/* .substring(1) */};

		model.addAttribute("date", date);
		
		return VIEW_PATH + "rev_info.jsp";
	}
	
	// 예약 추가하기
	@RequestMapping("rev_done.do")
	public String rev_done(RevVO vo) {
		
		int res = rev_dao.rev_insert(vo);
		
		if(res == 1) {
			return VIEW_PATH + "rev_one.jsp";
		}
		return null;
		
	}
	
	// 예약조회
	@RequestMapping("rev_select.do")
	public String rev_select (Model model, @RequestParam("u_idx") int u_idx) {
		
		List<RevVO> list = rev_dao.rev_selectList(u_idx);
		model.addAttribute("list", list);
		
		return VIEW_PATH + "rev_select.jsp";
	}
	
	

	// 예약 취소
	@RequestMapping("rev_cancle.do") 
	public String delete(RedirectAttributes redirect, int rv_idx, int u_idx) {
		
		System.out.println(rv_idx);
	  
		int res = rev_dao.delete(rv_idx);
	 
		if(res == 1) { 
			
			redirect.addAttribute("u_idx", u_idx);
			return "redirect:rev_select.do";
		} 
		
		return null;
	}


	
	
	
	
	
}
	
    


