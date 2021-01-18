package com.shopping.maker.repository.menu;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shopping.maker.entity.Menu;

public interface MenuRepository extends JpaRepository<Menu, Long>{

	List<Menu> findByParentId(Long parentId);
	
	List<Menu> findByCollapseYn(String collpaseYn);
}
