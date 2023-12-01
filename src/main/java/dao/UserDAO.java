package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 아이디 존재여부
	public UserVO loginCheck(String u_email) {
		return sqlSession.selectOne("u.loginCheck", u_email);
	}
	
	// 아이디 찾기
	public UserVO select_email(HashMap<String, String> map) {
		return sqlSession.selectOne("u.select_email", map);
	}
	
	// 회원가입 아이디 중복 검사
	public int idCheck(String u_email) {
		return sqlSession.selectOne("u.idCheck", u_email);
	}
	
	// 회원가입 닉네임 중복 검사
	public int nNameCheck(String u_nickName) {
		return sqlSession.selectOne("u.nNameCheck", u_nickName);
	}
	
	// 유저 추가(회원가입)
	public int insert_user(UserVO vo) {
		return sqlSession.insert("u.insertU", vo);
	}
	
	// 비밀번호 찾기
	public UserVO select_pwd(HashMap<String, String> map) {
		return sqlSession.selectOne("u.select_pwd", map);
	}
	
}
