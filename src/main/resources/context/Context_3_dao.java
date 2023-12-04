package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.PetDAO;
import dao.UserDAO;

@Configuration
public class Context_3_dao {
	
	@Bean
	public UserDAO user_dao(SqlSession sqlSession) {
		return new UserDAO(sqlSession);
	}
	
	@Bean
	public PetDAO pet_dao(SqlSession sqlSession) {
		return new PetDAO(sqlSession);
	}

	
}