package com.pet.care;

import java.util.ArrayList;
import java.util.Calendar;
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
	
	// 예약 확인 화면
	@RequestMapping("rev_main.do")
	public String rev_list(Model model) {
		List<RevVO> list = rev_dao.rev_selectList();
		model.addAttribute("list", list);
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
		
		List<String> time = new ArrayList<String>();
		
		int s = 10;
		
		for(int i = 0; i < 11; i++) {
			time.add((s+i)+":00");
		}
		
		List<String> list = rev_dao.rev_selectList2(rv_day);
		
		for(int i = 0; i <time.size(); i++) {
			for(int j=0; j < list.size(); j++) {
				if(time.get(i).equals(list.get(j))) {
					time.remove(i);
				} 
			}
		}
		
		/*
		 * if(list != null) { model.addAttribute("list", list); }
		 */
		model.addAttribute("time", time);
		
		return VIEW_PATH + "rev_time.jsp";
		
	}
	
	
	
	// 예약 정보 저장
	@RequestMapping("rev_insert.do")
	public String rev_insert(RevVO vo) {
		
		int res = rev_dao.rev_insert(vo);
		
		System.out.println(res);
		
		if(res > 0) {
			return "redirect:rev_insert.do";
		}
			return null;
	}
	
	// 예약 취소
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
	
    


