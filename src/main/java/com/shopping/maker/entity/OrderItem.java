package com.shopping.maker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class OrderItem {

	@Id @GeneratedValue
	@Column(name = "order_item_id")
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id")
	private Order order;
	
	private int count;
	private int orderPrice;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "item_id")
	private Item item;
	
	public void settingOrderItem(Item item) {
		this.count = item.getCount();
		this.orderPrice = item.getPrice() * count;
	}
}
