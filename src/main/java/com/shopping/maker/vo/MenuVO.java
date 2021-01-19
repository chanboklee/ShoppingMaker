package com.shopping.maker.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuVO {

	private Long id;
	private String menuNm;			// 메뉴 이름
	private String menuUrl;			// 메뉴 url
	private String useYn;			// 사용 여부
	private String collapseYn;		// 대분류(Y), 중분류(N)
	private Long parentId;			// 대분류의 자식 구분
	
	public MenuVO(String menuNm, String collapseYn) {
		this.menuNm = menuNm;
		this.collapseYn = collapseYn;
	}
}
