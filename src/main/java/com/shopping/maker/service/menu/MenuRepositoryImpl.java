package com.shopping.maker.service.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shopping.maker.entity.Menu;
import com.shopping.maker.repository.menu.MenuRepository;

@Service
@Transactional
public class MenuRepositoryImpl {

	@Autowired
	private MenuRepository menuRepository;
	
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
