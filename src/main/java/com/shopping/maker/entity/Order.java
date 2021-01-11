package com.shopping.maker.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Table(name = "Orders")
public class Order {

    @Id @GeneratedValue
    @Column(name = "order_id")
    private Long id;

    private int count;
    private int orderPrice;
    private int deliveryPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(mappedBy = "order")
    private List<OrderItem> orderItems = new ArrayList<>();

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "delivery_id")
    private Delivery delivery;

    public Order(OrderItem orderItem) {
        settingOrder(orderItem);
        addDeliveryPrice();
    }

    private void addDeliveryPrice() {
        orderPrice = orderPrice + deliveryPrice;
    }

    public void settingOrder(OrderItem orderItem) {
        this.count = count + orderItem.getCount();
        this.orderPrice = orderPrice + orderItem.getOrderPrice();
        addPrice();
    }

    public void addPrice() {
        if (this.orderPrice < 20000) {
            deliveryPrice = 3000;
        }
    }
}
