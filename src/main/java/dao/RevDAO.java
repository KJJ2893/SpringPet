package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.RevVO;

public class RevDAO {
SqlSession sqlSession;
	
	public RevDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//예약리스트
	public List<RevVO> selectList(int idx){
		List<RevVO> list = sqlSession.selectList("r.rev_list",idx);
			return list;
	}
}
