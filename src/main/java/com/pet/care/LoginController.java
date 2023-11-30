package com.pet.care;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class LoginController {

	
	public final static String VIEW_PATH = "/WEB-INF/views/login/";
	
	UserDAO user_dao;
	
	@Autowired
	HttpSession session;
	
	public LoginController(UserDAO user_dao) {
		this.user_dao = user_dao;
		System.out.println("loginCotroller 생성자");
	}

	// 로그인창
	@RequestMapping("login_main.do")
	public String login_main() {

		return VIEW_PATH + "login_main.jsp";
	}
	
	// 로그인
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String u_email, String u_pwd) {
		
		// id의 존재여부 검증
		UserVO vo = user_dao.loginCheck(u_email);
		
		// id 없는 경우
		if(vo == null) {
			return "[{'param':'no_id'}]";
		}
		
		// 비밀번호가 일치하지 않는 경우
		if(!vo.getU_pwd().equals(u_pwd)) {
			return "[{'param':'no_pwd'}]";
		}
		
		// id와 비밀번호 체크에 문제가 없다면 세션에 바인딩한다.
		session.setAttribute("id", vo);
		
		// 로그인에 성공한 경우
		return "[{'param':'clear'}]";
		
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		session.removeAttribute("id");
		session.removeAttribute("u_email");
		session.removeAttribute("u_pwd");
		
		return "redirect:main_home.do";
	} 
	
	///////////////////////////////////////////////////////////

	// 회원가입
	@RequestMapping("regster_insert.do")
	public String reg_insert() {
		return VIEW_PATH + "reg_insert.jsp";
	}
	
	// 아이디 중복확인
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String id_check(String u_email) {

		int res = user_dao.idCheck(u_email);
		
		if(res == 0) {
			return "[{'res':'yes'}]"; //중복된 아이디 없음
		} else {
			return "[{'res':'no'}]"; // 중복된 아이디 있음
		}
		
	}
	
	// 닉네임 중복확인
	@RequestMapping("nNameCheck.do")
	@ResponseBody
	public String nNameCheck(String u_nickName) {
		
		int res = user_dao.nNameCheck(u_nickName);
		
		if(res == 0) {
			return "[{'res':'yes'}]"; //중복된 닉네임 없음
		} else {
			return "[{'res':'no'}]"; // 중복된 닉네임 있음
		}
		
	}
	
	// 유저 추가하기
	@RequestMapping("insert_user.do")
	public String insert_user(UserVO vo) {
		
		int res = user_dao.insert_user(vo);
		
		if(res > 0) {
			return VIEW_PATH+"welcom.jsp";
		} else {
			return VIEW_PATH+"no_welcom.jsp";
		}
	}

///////////////////////////////////////////////////////////////////

	// 아이디 찾기 페이지로
	@RequestMapping("find_id.do")
	public String find_id() {
		return VIEW_PATH + "find_id.jsp";
	}
	
	// 아이디 찾기
	@RequestMapping("select_email.do")
	@ResponseBody
	public String findId(String u_tel) {
		
		UserVO vo = user_dao.select_email(u_tel);
		
		if(vo == null) {
			return "[{'res':'no'}]";
		}
			
		session.setAttribute("u_email", vo.getU_email());
		
		System.out.println(vo.getU_email());
		return "[{'res':'yes'}]";
		
	}

	// 찾은 아이디 확인창
	@RequestMapping("find_id2.do")
	public String find_id2() {
		return VIEW_PATH + "find_idCheck.jsp";
	}

	///////////////////////////////////////////////////////////////////
	
	// 비밀번호 찾기 페이지로
	@RequestMapping("find_pwd.do")
	public String find_pwd() {
		return VIEW_PATH + "find_pwd.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping("select_pwd.do")
	@ResponseBody
	public String findPwd(String u_email) {
		
		UserVO vo = user_dao.select_pwd(u_email);
		
		if(vo == null) { // 비밀번호 X
			return "[{'res':'no'}]";
		}
		
		session.setAttribute("u_pwd", vo.getU_pwd());
		
		System.out.println(vo.getU_pwd()); // 확인용
		return "[{'res':'yes'}]";
		
	}
	
	// 비밀번호 확인창
	@RequestMapping("find_pwd2.do")
	public String find_pwd2() {
		return VIEW_PATH + "find_pwdCheck.jsp";
	}
	
	

}
