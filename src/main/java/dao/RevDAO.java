package dao;

import org.apache.ibatis.session.SqlSession;

public class RevDAO {
SqlSession sqlSession;
	
	public RevDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
}
