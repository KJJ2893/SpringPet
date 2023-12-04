package dao;

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
}
