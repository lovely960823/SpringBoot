package com.base.spring.project.controller.protal;


import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Dianz;
import com.base.spring.project.model.Guanz;
import com.base.spring.project.model.User;
import com.base.spring.project.service.DianzService;
import com.base.spring.project.service.GuanzService;
import com.base.spring.project.service.UserService;

@Controller
@RequestMapping("/protal/user")
public class ProtalUserController extends BaseController{

	@Autowired
	private UserService userService;
	@Autowired
	private GuanzService guanzService;
	@Autowired
	private DianzService dianzService;
	@Autowired
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	/**
	 * 去到用户注册页面
	 * @return
	 */
	@RequestMapping("/toRegister")
	public String toRegister() {
		
		//return "protal/user/register";
		return "protal/user/login_register";
	}
	
	/**
	 * 查询是否重名
	 * @param name
	 * @return
	 */
	@RequestMapping("/checkName")
	@ResponseBody
	public int checkName(String name) {
		User user = new User();
		user.setName(name);
		
		User u = userService.findUserByT(user);
		if(u!=null) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * 邮件发送到注册用户的邮箱上
	 * @param email
	 * @return
	 */
	@RequestMapping("/sendEmail")
	@ResponseBody
	public int sendEmail(Integer emailcode,String myEmail) {
		try {
			MimeMessage maMessage = javaMailSender.createMimeMessage();
			// 不添加，文件名会不正常显示
			MimeMessageHelper helper = new MimeMessageHelper(maMessage, true, "utf-8");
			helper.setFrom("374905102@qq.com");//表明是谁发送的
			helper.setTo(myEmail);//说明这是发送给谁的
			helper.setSubject("验证码邮件");//邮件的标题
			helper.setText("这是验证码啊："+emailcode);//邮件的内容内容
			javaMailSender.send(maMessage);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} 
	}
	
	/**
	 * 注册实现
	 * @param user
	 * @return
	 */
	@RequestMapping("/doRegister")
	@ResponseBody
	public int doRegister(User user) {
		int i = userService.save(user);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * 去到登录页面
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toLogin() {
		
		return "protal/user/login_register";
	}
	
	/**
	 * 登录实现  用户的自己注册的账号密码登录
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public int login(User user,HttpSession session) {
		User loginUser = userService.findUserByT(user);
		session.setAttribute("loginUser", loginUser);
		if(loginUser!=null) {
			//cookie缓存设置
			String rem = this.getParameter("rememberMe");
			if ("1".equals(rem)) {
				String loginInfo="name="+user.getName()+"&password="+ user.getPassword();
				Cookie userCookie = new Cookie("loginInfo", loginInfo.toString());
				userCookie.setMaxAge(1 * 24 * 60 * 60); // 存活期为一天 1*24*60*60
				userCookie.setPath("/");
				this.getResponse().addCookie(userCookie);
			}
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * 注销退出操作
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout() {
		this.getSession().invalidate();
		return "redirect:/protal/user/toLogin";
	}
	
	
	/**
	 * 关注前判断
	 * @param userId
	 * @return
	 */
	@RequestMapping("/gzpd")
	@ResponseBody
	public int guanzpd(Integer userId) {
		Guanz guanz = guanzService.findByUid(userId);
		if(guanz!=null) {
			return 0;
		}else {
			return userId;
		}
	}
	
	/**
	 * 确定关注操作
	 * @param userId
	 * @return
	 */
	@RequestMapping("/ensuregz")
	@ResponseBody
	public int ensuregz(Integer userId) {
		Guanz guanz =new Guanz();
		guanz.setUid(userId);
		int i = guanzService.save(guanz);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * 点赞判断
	 * @param noteId
	 * @return
	 */
	@RequestMapping("/dzpd")
	@ResponseBody
	public Map<String, Object> dianzpd(Integer noteId,Integer userId) {
		/**
		 * 不知道为啥返回不了String类型  一直报错，所以用map解决一下
		 */
		Map<String, Object> map =new HashMap<>();
		Dianz dianz = dianzService.findByNidAndUid(noteId,userId);
		String str="";
		if(dianz!=null) {
			str="0";
			map.put("val", str);
			return map;
		}else {
			str+=str+noteId+","+userId;
			map.put("val", str);
			return map;
		}
	}
	
	
	@RequestMapping("/ensureDz")
	@ResponseBody
	public int ensureDz(Integer noteId,Integer userId) {
		
		Dianz dianz = new Dianz();
		dianz.setUid(userId);
		dianz.setNid(noteId);
		int i = dianzService.save(dianz);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
}
