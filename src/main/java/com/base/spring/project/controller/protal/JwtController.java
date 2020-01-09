package com.base.spring.project.controller.protal;


import org.junit.Test;

import com.base.spring.project.model.User;
import com.base.spring.project.util.JwtUtils;

import io.jsonwebtoken.Claims;


public class JwtController {
	
	/**
	 * 生成token
	 */
	@Test
    public void testGeneJwt(){
        User user = new User();
        user.setId(666);
        user.setName("李四");
        user.setImg("http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLNRjB8ZwrDr0LDrBcd2CfVINmaqibw1auOfblNAaq44tGRJlJRJaUat8qckO1abIcmvucK8HuwuOQ/132");
        String token = JwtUtils.geneJsonWebToken(user);
        System.out.println(token);
    }
	
	@Test
    public void checkToken(){
        String token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ4ZGNsYXNzIiwiaWQiOjY2NiwibmFtZSI6IuadjuWbmyIsImltZyI6Imh0dHA6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9RMGo0VHdHVGZUTE5SakI4WndyRHIwTERyQmNkMkNmVklObWFxaWJ3MWF1T2ZibE5BYXE0NHRHUkpsSlJKYVVhdDhxY2tPMWFiSWNtdnVjSzhIdXd1T1EvMTMyIiwiaWF0IjoxNTc3MzIyNzk2LCJleHAiOjE1Nzc5Mjc1OTZ9.HxF2YfE_VSE__IWgqMENhYEleyk0pcjUDh356SYFfS8";
        Claims claims = JwtUtils.checkJwt(token);
        if(claims!=null){
            Integer id = (Integer) claims.get("id");
            String name = (String)claims.get("name");
            String img = (String)claims.get("img");
            System.out.println(id);
            System.out.println(name);
            System.out.println(img);
        }else{
            System.out.println("非法token");
        }

    }
}
