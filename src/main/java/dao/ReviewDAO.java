package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {
	
	SqlSession sqlSession;
	
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 리뷰 목록 불러오기
	public List<ReviewVO> selectReviews(){
		return sqlSession.selectList("review.selectList");
	}
	
	
}
