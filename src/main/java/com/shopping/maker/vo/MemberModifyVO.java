package com.shopping.maker.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(of = {"loginId", "userName", "passWord", "email", "address", "zipcode", "street"})
public class MemberModifyVO {

	private String loginId;
	private String userName;
	private String passWord;
	private String email;
	private String address;
	private String zipcode;
	private String street;
}
