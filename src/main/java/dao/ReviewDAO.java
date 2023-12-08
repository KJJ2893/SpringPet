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
	
	// 리뷰 추가하기
	public int insert(ReviewVO vo) {
		return sqlSession.insert("review.insert", vo);
	}
	
	// 내가 쓴 글
	public List<ReviewVO> selectMyList(int u_idx){
		return sqlSession.selectList("review.selectM", u_idx);
	}
	
	// 리뷰 삭제
	public int delReviw(int r_idx) {
		return sqlSession.delete("review.delReviw", r_idx);
	}
	
	// 한건 조회
	public ReviewVO selectOne(int r_idx) {
		return sqlSession.selectOne("review.selectOne", r_idx);
	}
	
	// 수정
	public int update(ReviewVO vo) {
		return sqlSession.update("review.update", vo);
	}
	
}
