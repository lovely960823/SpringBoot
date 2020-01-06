package com.base.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ExecptionController extends BaseController {

	/**
	 * 常见几个错误页面的配置
	 * @return
	 */
	@RequestMapping("/error-404")
    public String toPage404(){
        return "index/error_404";
    }
    @RequestMapping("/error-400")
    public String toPage400(){
        return "index/error_400";
    }
    @RequestMapping("/error-500")
    public String toPage500(){
        return "index/error_500";
    }

}
