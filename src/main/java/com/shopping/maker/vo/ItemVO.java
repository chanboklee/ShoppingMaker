package com.shopping.maker.vo;

import lombok.Getter;

@Getter
public class ItemVO {

    private String brandName;		// 브랜드명
    private String itemName;		// 상품명
    private String itemImg;			// 상품 이미지
    private String itemNo;			// 상품 품번
    private int count;				// 갯수
    private int price;				// 가격
	
}
