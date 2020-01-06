package com.base.spring.project;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@EnableScheduling
@MapperScan(basePackages="com.base.spring.project.mapper")
public class BaseSpringApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(BaseSpringApplication.class, args);
	}
	/**
	 * war包启动使用
	 */
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BaseSpringApplication.class);
    }
}
