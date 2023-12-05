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
	public List<PetVO> selectList(int idx){
		List<PetVO> list = sqlSession.selectList("p.petinfo_list",idx);
			return list;
	}
	
	// 펫 등록하기
	public int insert(PetVO vo) {
		return sqlSession.insert("p.petinfo_insert", vo);
	}
	
	// 펫 정보 삭제
	public int delete(int p_idx) {
		return sqlSession.delete("p.petinfo_delete", p_idx);
	}
	
	
	
	
	
	

}
