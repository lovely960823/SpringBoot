package com.base.spring.project.controller.back;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.spring.project.controller.BaseController;
import com.base.spring.project.model.Node;
import com.base.spring.project.model.Role;
import com.base.spring.project.model.RoleUser;
import com.base.spring.project.model.User;
import com.base.spring.project.service.NodeService;
import com.base.spring.project.service.RoleService;
import com.base.spring.project.service.RoleUserService;
import com.base.spring.project.service.UserService;
import com.base.spring.project.util.JsonUtils;

@Controller
@RequestMapping("/back/xtgl")
public class XtglController extends BaseController {


	@Autowired
	private UserService userService;
	@Autowired
	private NodeService nodeService;
	@Autowired
	private RoleUserService roleUserService;
	@Autowired
	private RoleService roleService;
	
	/**
	 * 查询到所有的用户到授权列表
	 * @return
	 */
	@RequestMapping("/userList")
	public String toGrand() {
		List<User> list = userService.findAll();
		this.setAttribute("list", list);
		return "admin/xtgl/user_list";
	}
	
	/**
	 * 找到对应用户的授权操作界面
	 * @param id
	 * @return
	 */
	@RequestMapping("/grantList")
	public String grantList(Integer id) {
		List<Role> listRole = roleService.findByUid(id);//根据该用户的id去查询role表里面存的node表的id
		if(!listRole.isEmpty()) {
			ArrayList<Integer> arr= new ArrayList<>();
			for(int i=0;i<listRole.size();i++) {
				arr.add(listRole.get(i).getNid());
			}
			//返回一个json数据，方便使用
			JsonUtils jsonUtils=new JsonUtils();
			jsonUtils.objectToJson(arr);
			this.setAttribute("arrNode", jsonUtils.objectToJson(arr));
		}
		this.setAttribute("userId", id);
		return "admin/xtgl/grant_list";
	}
	
	/**
	 * 获取node表数据  json格式  只拿到id name parentId 即可 为Ztree做准备
	 * @return
	 */
	@RequestMapping("/noteData")
	@ResponseBody
	public List<Node> nodeAjax(){
		List<Node> list = nodeService.findAllNode();
		return list;
	}
	
	/**
	 * 授权操作第一步，给role_user表添加数据
	 * @param userId
	 * @return
	 */
	@RequestMapping("/grantFirst")
	@ResponseBody
	public int grantFirst(Integer userId) {
		//先删除原来的，再重新创建一遍
		roleUserService.deleteByUid(userId);
		//id自增很烦人，我让他有顺序的 
		int maxId = roleUserService.findMaxId();
		RoleUser ru = new RoleUser();
		ru.setUid(userId);
		ru.setId(maxId+1);
		int i = roleUserService.save(ru);
		RoleUser r = roleUserService.findByUid(userId); 
		if(i>0&&r!=null) {
			return r.getId();
		}else {
			return 0;
		}
	}
	
	/**
	 * 授权操作第二步，给role表添加数据
	 * @param userId
	 * @param nodeIds
	 * @param ruid
	 * @return
	 */
	@RequestMapping("/grantSecond")
	@ResponseBody
	public int grantSecond(Integer userId,String nodeIds,Integer ruid) {//ruid就是role_user表的id
		//先删除和自己有关的，再重新添加
		int i = roleService.deleteByUid(userId);
		System.out.println(i);
		//批量添加
		Map<String,Object> map =new HashMap<>();
		String[] split = nodeIds.split(","); 
		map.put("splits", split);
		map.put("ruid", ruid);
		map.put("userId", userId);
		int n = roleService.saveMore(map);
		if(n>0) {
			return 1;
		}else {
			return 0;
		}
	}
}
