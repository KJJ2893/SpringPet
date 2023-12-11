package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVO;

public class QnaDAO {

	SqlSession sqlSession;

	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//게시글 추가
	public int qna_insert(QnaVO qnaVO) {
		return sqlSession.insert("q.qna_insert", qnaVO);
	}
	
	//전체 글 조회
	public List<QnaVO> qna_selectList(){
		return sqlSession.selectList("q.qna_selectList");
	}

	public int insert_qna1(QnaVO qnaVO) {
		return sqlSession.insert("q.insert_qna2", qnaVO);
	}
	
	//게시글 한건조회 : qna_view에서 selectOne 변경
	public QnaVO selectOne(int q_idx) {
		return sqlSession.selectOne("q.qna_view", q_idx);
	}
	
	//게시글 삭제
	public int qna_del(QnaVO qnaVO) {
		return sqlSession.update("q.qna_del", qnaVO);
	}
	

}
