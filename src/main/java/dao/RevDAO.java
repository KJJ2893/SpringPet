package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.PetVO;
import vo.QnaVO;
import vo.RevVO;

public class RevDAO {
SqlSession sqlSession;
	
	public RevDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//예약리스트
	public List<RevVO> rev_selectList(){
		return sqlSession.selectList("r.rev_list");
	
	}
	// 예약 등록하기
		public int rev_insert(RevVO vo) {
			return sqlSession.insert("r.rev_insert", vo);
		}
}
