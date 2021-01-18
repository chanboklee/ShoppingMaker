package com.shopping.maker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Menu {
	
	@Id @GeneratedValue
	@Column(name = "member_id")
	private Long id;
	
	@Column(name = "menu_nm")
	private String menuNm;
	
	@Column(name = "menu_url")
	private String menuUrl;
	
	@Column(name = "use_yn")
	private String useYn;
	
	@Column(name = "collapse_yn")
	private String collapseYn;
	
	@Column(name = "parent_id")
	private Long parentId;

}
