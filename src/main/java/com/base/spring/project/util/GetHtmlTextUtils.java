package com.base.spring.project.util;

public class GetHtmlTextUtils {
	/**
	 * <p>功能描述：从html中提取纯文本 </p>
	 * <p>方法名：StripHT</p>
	 * <p>@param strHtml
	 * <p>@return</p>
	 * <p>返回类型：String</p>
	 * <p>创建日期：2019-6-18 下午6:23:08</p>  
	 * <p>@author：mmy</p>
	 */
	public static String getHtmlText(String strHtml) { 
		String txtcontent = strHtml.replaceAll("</?[^>]+>", ""); //剔出<html>的标签 
		txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n|&nbsp;|</a>", "");//去除字符串中的空格,回车,换行符,制表符 
		return txtcontent; 
	}
	
}
