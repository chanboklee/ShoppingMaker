package com.shopping.maker.controller.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.maker.service.menu.MenuRepositoryImpl;
import com.shopping.maker.vo.MemberVO;
import com.shopping.maker.vo.MenuVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	private final MenuRepositoryImpl menuRepositoryImpl;

	@RequestMapping("/main.do")
	public String main(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession(true);
		
		if(session.getAttribute("userSession") != null) {
			MemberVO userSession = (MemberVO) session.getAttribute("userSession");
			
			model.addAttribute("userVo", userSession);
			System.out.println("userSession = "+userSession);
		}
		
		try {
			
			Map<String, List<MenuVO>> result = menuRepositoryImpl.findAllMenuList();
			model.addAttribute("category", result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
				
		return "main";
	}
}
