package com.base.spring.project.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GetSrcUtils {
	/**
	 * <p>功能描述：获取image的src和a的href</p>
	 * <p>方法名：getSrc</p>
	 * <p>@param htmlStr
	 * <p>@return</p>
	 * <p>创建日期：2018-9-6 下午5:26:30</p>  
	 * <p>@author：mmy</p>
	 */
	 public static List<String> getSrc(String htmlStr) {
	        List<String> pics = new ArrayList<String>();
	        String img = "";
	        String a = "";
	        Pattern p_image;
	        Matcher m_image;
	        //String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
	        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
	        String regex_a = "<a[^>]*href=(\"([^\"]*)\"|\'([^\']*)\'|([^\\s>]*))[^>]*>(.*?)";
	        p_image = Pattern.compile
	                (regEx_img, Pattern.CASE_INSENSITIVE);
	        Pattern pa = Pattern.compile(regex_a, Pattern.DOTALL);
	        m_image = p_image.matcher(htmlStr);
	        while (m_image.find()) {
	            // 得到<img />数据
	            img = m_image.group();
	            // 匹配<img>中的src数据
	            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
	            while (m.find()) {
	                pics.add(m.group(1));
	            }
	        }
	        Matcher ma = pa.matcher(htmlStr);
	        while (ma.find()){
	        	// 得到<a />数据
	            a = ma.group();
	            // 匹配<a>中的href数据
	            Matcher m = Pattern.compile("href\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(a);
	            while (m.find()) {
	                pics.add(m.group(1));
	            }
	        }
	        return pics;
	    }
	 /**
	  * <p>功能描述：获取图片src地址</p>
	  * <p>方法名：getImageSrc</p>
	  * <p>@param htmlStr
	  * <p>@return</p>
	  * <p>返回类型：List<String></p>
	  * <p>创建日期：2019-6-18 下午6:20:07</p>  
	  * <p>@author：mmy</p>
	  */
	 public static List<String> getImageSrc(String htmlStr) {
		 List<String> pics = new ArrayList<String>();
	        String img = "";
	        String a = "";
	        Pattern p_image;
	        Matcher m_image;
	        //String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
	        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
	        p_image = Pattern.compile
	                (regEx_img, Pattern.CASE_INSENSITIVE);
	        m_image = p_image.matcher(htmlStr);
	        while (m_image.find()) {
	            // 得到<img />数据
	            img = m_image.group();
	            // 匹配<img>中的src数据
	            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
	            while (m.find()) {
	                pics.add(m.group(1));
	            }
	        }
		 return pics;
	 }
	 
}
