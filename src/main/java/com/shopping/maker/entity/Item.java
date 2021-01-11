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

    private String brandName;
    private String itemName;
    private int count;
    private int price;
    private String itemImg;

    @Enumerated(EnumType.STRING)
    private ItemSize itemSize;

    @Enumerated(EnumType.STRING)
    private ItemType itemType;

    public Item(String itemName){
        this(null, itemName, 0, 0 , null, null ,null);
    }

    public Item(String brandName, String itemName, int count, int price, String ItemImg, ItemSize itemSize, ItemType itemType) {
        this.brandName = brandName;
        this.itemName = itemName;
        this.count = count;
        this.price = price;
        this.itemImg = ItemImg;
        this.itemSize = itemSize;
        this.itemType = itemType;
    }
}
