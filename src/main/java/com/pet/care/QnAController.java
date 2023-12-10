package com.pet.care;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.QnaDAO;
import vo.QnaVO;
import vo.UserVO;

@Controller
public class QnAController {
	
	QnaDAO qna_dao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;

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
		List<QnaVO> list = qna_dao.select_qnaList();
		model.addAttribute("list", list);
		return VIEW_PATH + "qna_main.jsp";
	}
	
	@RequestMapping("qna_view.do")
	public String qna_view() {
		return VIEW_PATH + "qna_view.jsp";
	}
	
	@RequestMapping("qna_insert.do")
	public String qna_insert(QnaVO vo) {
		
		UserVO userVO = (UserVO)session.getAttribute("id");
		int u_idx = userVO.getU_idx(); 
		vo.setU_idx(u_idx);
		
		String webPath = "/resources/upload/qna";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

		MultipartFile file = vo.getQ_file();
		MultipartFile movie = vo.getQ_movie();

		String filename = "no_file";
		String moviename = "no_file";
		
		//file
		if(!file.isEmpty()) {
			filename = file.getOriginalFilename();
			
			File saveFile = new File(savePath, filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s",  time, filename);
				saveFile = new File(savePath, filename);
			}
			
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		vo.setQ_filename(filename);      
		
		//movie
		if(!movie.isEmpty()) {
			moviename = movie.getOriginalFilename();
			
			File saveMovie = new File(savePath, moviename);
			if(!saveMovie.exists()) {
				saveMovie.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				moviename = String.format("%d_%s",  time, moviename);
				saveMovie = new File(savePath, moviename);
			}
			
			try {
				movie.transferTo(saveMovie);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		vo.setQ_filename(filename); 
		vo.setQ_moviename(moviename); 
		
		int res = qna_dao.qna_insert(vo);
		
		if(res > 0) {
			return "redirect:qna_main.do";
		}else {
			return null;
		}
	}
}
