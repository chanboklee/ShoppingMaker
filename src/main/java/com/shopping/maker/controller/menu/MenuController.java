package com.shopping.maker.controller.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.maker.entity.Menu;
import com.shopping.maker.service.menu.MenuRepositoryImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MenuController {
	
	private final MenuRepositoryImpl menuRepositoryImpl;

	@RequestMapping("/menuList.do")
	public String menuList(HttpServletRequest req, Model model) {
		
		try {
			
			List<Menu> result = menuRepositoryImpl.allMenuList();
			model.addAttribute("menuData", result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "registerMenu";
	}
	
	@RequestMapping("/addMenu.do")
	@ResponseBody
	public Map<String, String> addMenu(@Valid Menu menu){
		Map<String, String> map = new HashMap<>();
		
		String msg = "";
		String location = "";
		
		try {
			
			menuRepositoryImpl.addMenu(menu);
			msg = "등록이 완료되었습니다.";
			location = "/menuList.do";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		map.put("msg", msg);
		map.put("location", location);
		
		return map;
	}
	
	@RequestMapping("/regMenuPopup.do")
	public String regMenuPopup(HttpServletRequest req, Model model) {
		
		String step = req.getParameter("step");
		String parentId = req.getParameter("parentId");
		System.out.println("step="+step);
		System.out.println("parentId="+parentId);
		
		model.addAttribute("step", step);
		model.addAttribute("parentId", parentId);
		
		return "regMenuPopup";
	}
	
	@RequestMapping("/childMenuList.do")
	@ResponseBody
	public Map<String, Object> childMenuList(HttpServletRequest req){
		
		String menuId = req.getParameter("menuId");
		Long realMenuId = Long.parseLong(menuId);
		
		System.out.println("menuId="+menuId);
		Map<String, Object> map = new HashMap<>();
		
		try {
			
			List<Menu> result = menuRepositoryImpl.childMenuList(realMenuId);
			map.put("resultData", result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return map;
	}
}
