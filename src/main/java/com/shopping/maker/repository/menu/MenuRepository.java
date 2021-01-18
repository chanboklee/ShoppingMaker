package com.shopping.maker.repository.menu;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.shopping.maker.entity.Menu;
import com.shopping.maker.vo.MenuVO;

public interface MenuRepository extends JpaRepository<Menu, Long>{

	List<Menu> findByParentId(Long parentId);
	
	List<Menu> findByCollapseYn(String collpaseYn);

	@Query("SELECT new com.shopping.maker.vo.MenuVO(m.menuNm) FROM Menu m")
	List<MenuVO> findAllMenuList();
}
