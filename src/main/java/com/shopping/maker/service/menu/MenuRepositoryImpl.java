package com.shopping.maker.service.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shopping.maker.entity.Menu;
import com.shopping.maker.repository.menu.MenuRepository;
import com.shopping.maker.vo.MenuVO;

@Service
@Transactional
public class MenuRepositoryImpl {

	@Autowired
	private MenuRepository menuRepository;
	
	public Map<String, List<MenuVO>> findAllMenuList(){
		
		Map<String, List<MenuVO>> map = new HashMap<>();
		
		List<MenuVO> mainCategory = new ArrayList<>();
		List<MenuVO> middleCategory = new ArrayList<>();
		
		List<MenuVO> list = menuRepository.findAllMenuList();
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCollapseYn().equals("Y")) {
				mainCategory.add(new MenuVO(list.get(i).getMenuNm(), list.get(i).getCollapseYn()));
			}else {
				middleCategory.add(new MenuVO(list.get(i).getMenuNm(), list.get(i).getCollapseYn()));
			}
		}
		
		map.put("mainCategory", mainCategory);
		map.put("middleCategory", middleCategory);
		
		return map;
	}
	
	public List<Menu> allMenuList() {
		List<Menu> list = menuRepository.findByCollapseYn("Y");
		
		return list;
	}

	public void addMenu(Menu menu) {
		
		menuRepository.save(menu);
	}

	public List<Menu> childMenuList(Long menuId) {
		// TODO Auto-generated method stub
		return menuRepository.findByParentId(menuId);
	}
}
