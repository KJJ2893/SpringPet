package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 아이디 존재여부
	public UserVO loginCheck(String userEmail) {
		return sqlSession.selectOne("u.loginCheck", userEmail);
	}
	
	// 아이디 찾기
	public UserVO select_email(String userTel) {
		return sqlSession.selectOne("u.select_email", userTel);
	}
	
	// 회원가입 아이디 중복 검사
	public int idCheck(String userEmail) {
		return sqlSession.selectOne("u.idCheck", userEmail);
	}
	
	// 유저 추가(회원가입)
	public int insert_user(UserVO vo) {
		return sqlSession.insert("u.insertU", vo);
	}
	
}
