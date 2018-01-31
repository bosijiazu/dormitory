package com.qtrmoon.sysmanage.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qtrmoon.common.BaseController;
import com.qtrmoon.common.Constant;
import com.qtrmoon.sysmanage.SysConstant;
import com.qtrmoon.sysmanage.pojo.Function;
import com.qtrmoon.sysmanage.pojo.Organ;
import com.qtrmoon.sysmanage.pojo.User;
import com.qtrmoon.sysmanage.serdao.AuthorCache;
import com.qtrmoon.sysmanage.serdao.ISysmanageService;
import com.qtrmoon.toolkit.MD5;
import com.qtrmoon.toolkit.tree.TreeNode;
import com.qtrmoon.toolkit.tree.TreeUtil;

/**
 * 登录注销等功能，不需要权限判定，任何用户都可以请求该类的方法。
 */
@Controller
@RequestMapping("/sysmanage/login")
public class LoginController extends BaseController{
	
	@Autowired
	private ISysmanageService sysmanageService;

	@RequestMapping(value="/login.action")
	public String login(User user,HttpServletRequest request,HttpServletResponse response) throws IOException{
		noCache(response);
		user.setCondition("");//防sql注入
		User sqlForm = new User();
		sqlForm.setLoginname(user.getLoginname());
		List<User> userList = sysmanageService.schUser(sqlForm);
		if (userList.size() > 0) {
			User loginUser = userList.get(0);
			String psw = user.getPassword();
			if (Constant.getBooleanConstant("pswmd5")) {
				psw = MD5.getInstance().getMD5to32(psw);
			}
			if (loginUser.getPassword().equals(psw)) {
				Function root=sysmanageService.setUserAuthor(loginUser);
				if(root==null){
					response.getWriter().print("error");//未分配权限
					return null;
				}
				loginUser.setLoginIp(request.getRemoteAddr());
				Organ organ=sysmanageService.schOrganById(loginUser.getOrganid());
				loginUser.setOrgan(organ);
				request.getSession(true).setAttribute(SysConstant.CURRENT_USER, loginUser);
//				response.getWriter().print(root.getMenuJson().toJSONString());
//				request.setAttribute("menu", root.getCnodeList());
				response.sendRedirect("/"+Constant.PRONAME+"/sysmanage/login/page.action?page=main");
				return null;
			}else{
				response.getWriter().print("error");//密码错误
				return null;
			}
		}
		response.getWriter().print("error");
		return null;
	}
	
	/**
	 * 用户申请接口，用户登录成功后再调用本接口。
	 * 自助角色申请，输入用户主键，将用户所在部门的角色赋予给用户。
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/selfApply.action")
	public void selfApply(String id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		noCache(response);
		User user=(User)request.getSession(true).getAttribute(SysConstant.CURRENT_USER);
		if(id!=null&&user!=null&&id.equals(user.getId())){//校验必须是用户自己来申请
			Organ organ=sysmanageService.schOrganById(user.getOrganid());
			user.addRoles(organ.getRoles());
			sysmanageService.updUser(user);
			response.getWriter().print("success");
			return;
		}
		response.getWriter().print("failure");
	}
	
	/**
	 * 推出系统方法
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logout.action")
	public String logout(HttpServletRequest request){
		request.getSession(true).removeAttribute(SysConstant.CURRENT_USER);
		return "/index.jsp";
	}
	
	
	/**
	 * JSP页面跳转
	 * @param page jsp页面文件名，无模块前缀和.jsp后缀
	 * @return 返回跳转的页面
	 */
	@RequestMapping(value="/page.action")
	public String goPage(String page){
		if("index".equals(page)){
			return "/"+page;
		}if("main".equals(page)){
			return "/"+page;
		}else{
			return "/error";
		}
	}
}