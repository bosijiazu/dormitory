package com.qtrmoon.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BaseController {
	protected PageForm setPage(HttpServletRequest request,Class cla) {
		PageForm form=null;
		try {
			HttpSession session=request.getSession();
			Object o=session.getAttribute(cla.getName());
			if(o==null){
				form=(PageForm)cla.newInstance();
				session.setAttribute(cla.getName(),form);
			}else{
				form=(PageForm)o;
			}
			String currentPage=request.getParameter("page");
			if (currentPage != null && !currentPage.equals("")) {
				form.setPage(Integer.parseInt(currentPage));
			}
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return form;
	}
	
	public void noCache(HttpServletResponse response){
		response.setHeader("Cache-Control", "no-cache,must-revalidate");
	}
}
