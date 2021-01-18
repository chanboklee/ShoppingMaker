package com.shopping.maker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Item {

    @Id @GeneratedValue
    @Column(name = "item_id")
    private Long id;

    private String brandName;		// 브랜드명
    private String itemName;		// 상품명
    private String itemImg;			// 상품 이미지
    private String itemNo;			// 상품 품번
    private int count;				// 갯수
    private int price;				// 가격

    @Enumerated(EnumType.STRING)
    private ItemSize itemSize;

    @Enumerated(EnumType.STRING)
    private ItemType itemType;

    public Item(String brandName, String itemName, String ItemImg, String itemNo, int count, int price,  ItemSize itemSize, ItemType itemType) {
        this.brandName = brandName;
        this.itemName = itemName;
        this.itemImg = ItemImg;
        this.itemNo = itemNo;
        this.count = count;
        this.price = price;
        this.itemSize = itemSize;
        this.itemType = itemType;
    }
}
