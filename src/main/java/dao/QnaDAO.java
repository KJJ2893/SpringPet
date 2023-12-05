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
	
	public int qna_delete(int q_idx) {
		return sqlSession.delete("q.qna_delete", q_idx);
	}
	
	public List<QnaVO> qna_select_list(){
		return sqlSession.selectList("q.qna_select_list");
	}
}
