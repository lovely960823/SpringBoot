package com.base.spring.project.controller.protal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

@Controller
public class SdkController {

	@Autowired
	private Environment env; //可以获取.proerty里面的配置信息
	
	
	/**
	 * 2019-12-6
	 * https://api.aliyun.com/new?spm=a2c4g.11186623.2.12.6f5819d9aaabQf#/?product=Dysmsapi
	 * 该网址填选择SendSms 填写对应的参数，复制生成的代码
	 * 注意：TemplateParam这个参数虽然没有提示必填，如果你的模板内容有动态值，该参数为必填，json格式 例如：{"code":"123456"}
	 * 	你模板里面动态值是code该处就是code ，如果是number 则为{"number":"123456"}
	 * @return
	 */
	
	@RequestMapping("/getMessage")
	@ResponseBody
	public String test() {
		DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "*************", "*******");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", "150*********");
        request.putQueryParameter("SignName", "温暖阳光");
        request.putQueryParameter("TemplateCode", "SMS_179601653");
        request.putQueryParameter("TemplateParam", "{\"code\":\"123456\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
            return "success";
        } catch (ServerException e) {
            e.printStackTrace();
            return "ServerException";
        } catch (ClientException e) {
            e.printStackTrace();
            return "ClientException";
        }
	}
}
