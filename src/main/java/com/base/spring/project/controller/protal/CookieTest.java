package com.base.spring.project.controller.protal;

import javax.servlet.http.Cookie;

import org.junit.Test;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.util.CookieUtils;
import com.base.spring.project.util.CookieUtils.CookieBuilder;

/**
 *  cookie测试类
 * @author ljw
 *
 */

@RestController
public class CookieTest extends BaseController{

	@RequestMapping("/cookieTest")
	public String cookieTest(){
	
		CookieBuilder builder = CookieUtils.newCookieBuilder();
		builder.response(this.getResponse());//用于写入cookie
		builder.maxAge(100);//单位是秒，如果为负数，则为临时cookie，即关闭浏览器后cookie就失效
		//builder.domain(null);//可以访问该Cookie的域名。如果设置为“.google.com”，则所有以“google.com”结尾的域名都可以访问该Cookie。注意第一个字符必须为“.”
		builder.name("admin");//设置key
		builder.value("HelloWorld");//设置值
		builder.httpOnly(true);//只能通过http访问,JavaScript无法访问，还可以防止xss读取cookie
		builder.build();//执行
		
		return CookieUtils.getCookieValue(getRequest(), "admin");
	}
}
