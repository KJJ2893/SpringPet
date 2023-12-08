package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVO;

public class QnaDAO {

	SqlSession sqlSession;

	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int qna_insert(QnaVO qnaVO) {
		return sqlSession.insert("q.qna_insert", qnaVO);
	}
	
	public List<QnaVO> qna_selectList(){
		return sqlSession.selectList("q.qna_selectList");
	}

	public int insert_qna1(QnaVO qnaVO) {
		return sqlSession.insert("q.insert_qna2", qnaVO);
	}
	
	public List<QnaVO> select_qnaList(){
		return sqlSession.selectList("q.select_qnaList");
	}
	
	public QnaVO qna_view(int q_idx) {
		return sqlSession.selectOne("q.qna_view", q_idx);
		
	}
	

}
