package com.shopping.maker.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.maker.vo.MemberVO;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession(true);
		
		if(session.getAttribute("userSession") != null) {
			MemberVO userSession = (MemberVO) session.getAttribute("userSession");
			
			model.addAttribute("userVo", userSession);
			System.out.println("userSession = "+userSession);
		}
				
		return "main";
	}
}
