package com.shopping.maker.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Delivery {
	
    @Id @GeneratedValue
    @Column(name = "delivery_id")
    private Long id;

    private String zipcode;
    private String city;
    private String street;

    @OneToOne(mappedBy = "delivery", fetch = FetchType.LAZY)
    private Order order;
}
