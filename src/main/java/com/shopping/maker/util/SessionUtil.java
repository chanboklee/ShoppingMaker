package com.shopping.maker.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtil {
	
	private HttpServletRequest requset;
	private HttpSession session;
	
	public SessionUtil(HttpServletRequest req) {
		this.requset = req;
	}
	
	public void setSession(Class<?> clazz) {
		session = this.requset.getSession(true);
		
		if(clazz != null) {
			session.setAttribute("userSession", clazz);
		}else {
			session.setAttribute("userSession", null);
		}
	}
	
	public Object getSession() {
		session = this.requset.getSession(true);
		
		return session.getAttribute("userSession");

	}
}
