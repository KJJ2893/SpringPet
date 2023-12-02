package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.pet.care.InfoController;
import com.pet.care.LoginController;
import com.pet.care.MainController;
import com.pet.care.QnAController;

import dao.UserDAO;

//어노테이션에도 상속관계가 있다
/*
 *@Component
 *	ㄴ@Controller
 *	ㄴ@Service
 *	ㄴ@Repository 
 * */
//컴포넌트의 자식객체가 들어있으면 사실 Controller가 아니어도 만들어 질 수 있다.

@Configuration
@EnableWebMvc
// @ComponentScan(basePackages = {"com.korea.board"} )
public class Servlet_Context implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	
//	  @Bean 
//	  public InternalResourceViewResolver resolver() {
//	  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//	  resolver.setViewClass(JstlView.class); resolver.setPrefix("/WEB-INF/views/");
//	  resolver.setSuffix(".jsp"); return resolver; }

	@Bean
	public MainController mainController() {
		return new MainController();
	}
	
	@Bean
	public LoginController loginController(UserDAO user_dao) {
		return new LoginController(user_dao);
	}
	
	@Bean
	public InfoController infoController() {
		return new InfoController();
	}
	
	@Bean
	public QnAController qnAController() {
		return new QnAController();
	}
	
}
