package com.base.spring.project.controller.back;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Money;
import com.base.spring.project.model.Views;
import com.base.spring.project.service.MoneyService;
import com.base.spring.project.service.ViewsService;

@Controller
@RequestMapping("/back/views")
public class ViewsController extends BaseController {

	@Autowired
	private ViewsService viewsService;
	@Autowired
	private MoneyService moneyService;
	
	/**
	 * 访问量分析数据
	 * @return
	 */
	@RequestMapping("/viewsdata")
	public String toViews() {
		
		return "admin/views/views_data";
	}
	
	/**
	 * 日常访问量数据分析
	 * @param start
	 * @param end
	 * @return
	 */
	@RequestMapping("/visitsajaxdata")
	@ResponseBody
	public Map<String, Object> findEchartData(String start,String end){
		List<Views> list = viewsService.findViewsData(start,end);
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> xList = new ArrayList<String>(); 
		List<Integer> yList = new ArrayList<Integer>(); 
		for (Views views : list) {
			xList.add(views.getTime());
			yList.add(views.getCounts());
		}
		map.put("xList", xList);
		map.put("yList", yList);
		return map;
	}
	
	/**
	 * 去到计算器界面
	 * @return
	 */
	@RequestMapping("/jsq")
	public String jsqPage() {
		return "admin/views/jsq";
	}
	
	/**
	 * 计算当天花销
	 * @param count
	 * @return
	 */
	@RequestMapping("/getTodayCounts")
	@ResponseBody
	public int getCounts(String count) {
		//根据当天时间判断，每次操作覆盖之前的值
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(d);
		Money m = new Money();
		m.setTime(today);
		Money money = moneyService.findByTime(m);
		if(money!=null) {
			money.setCounts(count);
			int i= moneyService.update(money);
			if(i>0) {
				return 1;
			}else {
				return 0;
			}
		}else {
			Money m1 = new Money();
			m1.setCounts(count);
			m1.setTime(today);
			int n = moneyService.save(m1);
			if(n>0) {
				return 2;
			}else {
				return 0;
			}
		}
		
	}
	
	/**
	 * 去到消费分析页面
	 * @return
	 */
	@RequestMapping("/moneydata")
	public String moneydata() {
		return "admin/views/money_data";
	}
	
	/**
	 * 日常消费分析
	 * @param start
	 * @param end
	 * @return
	 */
	@RequestMapping("/moneyajaxdata")
	@ResponseBody
	public Map<String, Object> moneyajaxdata(String start,String end){
		List<Money> list = moneyService.findMoneyData(start,end);
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> xList = new ArrayList<String>(); 
		List<String> yList = new ArrayList<String>();
		List<Double> allList =new ArrayList<>();
		Double d=0.00;//计算总消费
		for (Money money : list) {
			xList.add(money.getTime());
			yList.add(money.getCounts());
			d+=Double.parseDouble(money.getCounts());
		}
		map.put("xList", xList);
		map.put("yList", yList);
		allList.add(d);
		map.put("allList", allList);
		return map;
	}
}
