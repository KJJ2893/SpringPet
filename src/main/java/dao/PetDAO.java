package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.PetVO;

public class PetDAO {
	
	SqlSession sqlSession;
	
	public PetDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 펫 리스트
	public List<PetVO> selectList(){
		List<PetVO> list = sqlSession.selectList("p.petinfo_list");
			return list;
	}
	
	// 펫 등록하기
	public int insert(PetVO vo) {
		return sqlSession.insert("p.petinfo_insert", vo);
	}
	
	
	
	

}
