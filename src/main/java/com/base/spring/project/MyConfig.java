package com.base.spring.project;

import javax.sql.DataSource;

import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.base.spring.project.interceptor.LoginInterceptor;

@Configuration
public class MyConfig extends WebMvcConfigurerAdapter{
	//WebMvcConfigurerAdapter过期了  WebMvcConfigurer替代
	
	//拦截器的配置
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//registry.addInterceptor(new LoginInterceptor())
		//springboot 2.0 会拦截静态资源，（放行）
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**").excludePathPatterns("/toLogin","/logout","/static/**");
		//super.addInterceptors(registry);//不知道什么作用 暂时留在这
	}

		/**
		 * 配置全局错误页面
		 * @return
		 */
		@Bean
	    public WebServerFactoryCustomizer<ConfigurableWebServerFactory> webServerFactoryCustomizer() {
	        return new WebServerFactoryCustomizer<ConfigurableWebServerFactory>() {
	            @Override
	            public void customize(ConfigurableWebServerFactory factory) {
	                ErrorPage errorPage400 = new ErrorPage(HttpStatus.BAD_REQUEST,
	                        "/error/error-400");//错误页面的请求路径
	                ErrorPage errorPage404 = new ErrorPage(HttpStatus.NOT_FOUND,
	                        "/error/error-404");
	                ErrorPage errorPage500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,
	                        "/error/error-500");
	                factory.addErrorPages(errorPage400, errorPage404,
	                        errorPage500);
	            }
	        };
	    }
}
