package com.base.spring.project.controller.protal;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.User;
import com.base.spring.project.service.UserService;
import com.base.spring.project.util.HttpClientUtils;
import com.base.spring.project.util.HttpUtils;

/**
 * 单独把QQ和微信的登录请求拿出来写，以免混乱
 * @author ljw  2020/1/9
 *
 */
@Controller
public class QQorWeChatLoginController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * QQ登录需要的配置参数
	 */
	private static String qq_appid="101826833";
	private static String qq_secret="26333e6eaaa5f0596bdc1bf0fd452ec8";
	//private static String qq_url="http://127.0.0.1:80/qqLoginTest";
	private static String qq_url="http://note.java.itcast.cn/qqLoginTest";
	
	@RequestMapping("/protal/user/qqLogin")
	public void qqLogin() {
		String baseUrl="https://graph.qq.com/oauth2.0/authorize?";
		baseUrl+="response_type=code&";
		baseUrl+="client_id="+qq_appid;
		baseUrl+="&redirect_uri="+qq_url;
		baseUrl+="&state=ok";
		try {
			this.getResponse().sendRedirect(baseUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 回调
	 * @param code
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/qqLoginTest")
	@ResponseBody
	public void qqLoginTest(String code,HttpServletResponse response) throws Exception {
		String baseUrl="https://graph.qq.com/oauth2.0/token?";
		baseUrl+="grant_type=authorization_code&";
		baseUrl+="client_id="+qq_appid;
		baseUrl+="&client_secret="+qq_secret;
		baseUrl+="&code="+code;
		baseUrl+="&redirect_uri="+qq_url;
		String token=HttpClientUtils.get(baseUrl.toString(), "UTF-8");
		System.out.println("token:"+token);//token:access_token=8302E5F1A80ED9EBD2F3581C3F0BBAA8&expires_in=7776000&refresh_token=9F9F9A2529A9B739420AC43EF5EDD2E1
		token=token.split("&")[0];
		token=token.split("=")[1];
		String openidUrl="https://graph.qq.com/oauth2.0/me?access_token="+token;
		String openid=HttpClientUtils.get(openidUrl.toString(), "UTF-8");
		System.out.println("openid:"+openid);//openid:callback( {"client_id":"101826833","openid":"81B38A3BC7F27676F86FF5B32275978A"} );
		openid=StringUtils.substringBetween(openid, "\"openid\":\"", "\"}");
		String infoUrl= "https://graph.qq.com/user/get_user_info?access_token="+token+"&oauth_consumer_key="+qq_appid+"&openid="+openid;
		String user_info =HttpClientUtils.get(infoUrl.toString(), "UTF-8");
		System.out.println("user_info:"+user_info);
		JSONObject parseObject = JSON.parseObject(user_info);
        Map<String, Object> map= new HashMap<String, Object>();
        map=parseObject;
        System.out.println(map.get("nickname"));
        
        //openid作为唯一值，用来存在数据库，判别的
        if(!openid.isEmpty()) {
        	User  user = userService.findUserByOpenId(openid);//根据这个openID判断是否存在
        	if(user!=null) {
        		this.getRequest().getSession().setAttribute("loginUser", user);
        	}else {
        		User u = new User();
        		u.setName("QQ用户");
        		u.setImg(map.get("figureurl").toString());//获取用户的头像
        		u.setOpenid(openid);
        		userService.save(u);
        		this.getRequest().getSession().setAttribute("loginUser", u);
        	}
        }
        
        String redirect_url = "http://localhost:80";
        response.sendRedirect(redirect_url);//重定向到主页上
	}
	
	
	/**修改本地的host文件，项目端口号改成80
	 * 127.0.0.1    note.java.itcast.cn 
	 */
	
	private  static String wx_appid="wx3bdb1192c22883f3";
	//private  static String wx_appsecret="db9d6b88821df403e5ﬀ11742e799105";
	private  static String wx_redirecturl="http://note.java.itcast.cn/weixinlogin";
	
	
	@RequestMapping("/protal/user/wxLogin")
	public void test(HttpServletResponse response) {
		System.out.println("进来了：");
		String baseUrl="https://open.weixin.qq.com/connect/qrconnect?"
				+ "appid="+wx_appid
				+"&redirect_uri="+wx_redirecturl
				+"&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect";
		try {
			response.sendRedirect(baseUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 回调该域名下的url
	 * @param code
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/weixinlogin")
	public String wxcallback(String code,HttpServletResponse response) throws Exception {
		/*String baseUrl="https://api.weixin.qq.com/sns/oauth2/access_token?"
				+ "appid="+appid
				+"&secret="+appsecret
				+"&code="+code
				+"&grant_type=authorization_code";*/
		/**
		 * 暂时就这样写，目前没找到具体原因
		 */
		String baseUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?code=" + code + "&appid=wx3bdb1192c22883f3&secret=db9d6b88821df403e5ff11742e799105&grant_type=authorization_code";
		Map<String, Object> map1 = HttpUtils.sendGet(baseUrl);
        Object access_token = map1.get("access_token");
        Object openid = map1.get("openid");
        String infoUrl="https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid;
        String user_info =HttpClientUtils.get(infoUrl.toString(), "UTF-8");
        JSONObject parseObject = JSON.parseObject(user_info);
        Map<String, Object> map= new HashMap<String, Object>();
        map=parseObject;
        System.out.println(map.get("nickname"));
        System.out.println(map);
        if(!openid.toString().isEmpty()) {
        	User  user = userService.findUserByOpenId(openid.toString());//根据这个openID判断是否存在
        	if(user!=null) {
        		this.getRequest().getSession().setAttribute("loginUser", user);
        	}else {
        		User u = new User();
        		u.setName("微信用户");
        		u.setImg(map.get("headimgurl").toString());//获取用户的头像
        		u.setOpenid(openid.toString());
        		userService.save(u);
        		this.getRequest().getSession().setAttribute("loginUser", u);
        	}
        }
        /*String redirect_url="http://localhost:80/";
        response.sendRedirect(redirect_url);*/
        return "redirect:/";
	}
	
}