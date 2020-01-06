package com.base.spring.project.util;

import java.util.Date;

import com.base.spring.project.model.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
/**
 * 
 * @author ljw
 * @Date 2019-12-26
 *
 */
public class JwtUtils {

    public static final String SUBJECT="xdclass";
    public static final long EXPIRE=1000*60*60*24*7;    //过期时间，毫秒，一周
    public static final String APPSECRET="xd666";
    
    
    /**
     * 生成token
     * @param user
     * @return
     */
    public static String geneJsonWebToken(User user){
        if(user==null || user.getId()==null || user.getName()==null || user.getImg()==null){
            return null;
        }
       String token =  Jwts.builder().setSubject(SUBJECT)
                .claim("id",user.getId())
                .claim("name",user.getName())
                .claim("img",user.getImg())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRE))		//过期时间
                .signWith(SignatureAlgorithm.HS256,APPSECRET).compact();	//签名算法
        return token;
    }
    
    /**
     * 校验token
     * @param token
     * @return
     */
    public static Claims checkJwt(String token){

        try {
            Claims claims = Jwts.parser().setSigningKey(APPSECRET)
                    .parseClaimsJws(token).getBody();	//getBody会获取用户的一些信息
            return claims;
        }catch (Exception e){

        }
        return null;
    }
}