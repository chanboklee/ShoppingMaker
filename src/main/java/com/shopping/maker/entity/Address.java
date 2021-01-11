package com.shopping.maker.entity;

import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class Address {

	private String address;
	private String zipcode;
	private String street;
	
	public Address(String address, String zipcode, String street) {
		this.address = address;
		this.zipcode = zipcode;
		this.street = street;
	}
}
