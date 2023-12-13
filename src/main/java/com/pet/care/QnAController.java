package com.pet.care;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
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
		System.out.println("qnaController 생성자");
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
	
	@RequestMapping("qna_view.do")
	public String qna_view(Model model, int q_idx) {
		//게시물 한건 조회
		QnaVO qnaVO = qna_dao.selectOne(q_idx);
		
		model.addAttribute("qnaVO", qnaVO);
		return VIEW_PATH + "qna_view.jsp";
	}
	
	//삭제
	@RequestMapping("qna_del.do")
	@ResponseBody 
	//view의 var url=qna_del.do의 DB를 갔다오기 위한 경유지
	//그 화면을 유지하기 위해서 사용
	public String qna_del(int q_idx) {
		int result = qna_dao.qna_del(q_idx);
		
		if(result == 1) {
			return "[{'result':'yes'}]";
		} else {
			return "[{'result':'no'}]";
		}	
	}
	
	//수정하는 form으로 보내기
	@RequestMapping("qna_edit_form.do")
	public String qna_edit_form(Model model, int q_idx) {
		
		QnaVO qnaVO = qna_dao.qna_edit_form(q_idx);
		model.addAttribute("qnaVO", qnaVO);
		return VIEW_PATH + "qna_edit_form.jsp";
	}
	
	//수정완료
	@RequestMapping("qna_edit_finish.do")
	public String qna_edit_finish(QnaVO qnaVO) {
		int result = qna_dao.qna_update(qnaVO);
		
		return "redirect:qna_main.do";
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

		String filename = "no_file";
		
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
				System.out.println("파일저장 안된거같어");
			}
		}
		
		vo.setQ_filename(filename);      
		
		int res = qna_dao.qna_insert(vo);
		
		if(res > 0) {
			return "redirect:qna_main.do";
		}else {
			return null;
		}
	}
	
	
	
	
}
