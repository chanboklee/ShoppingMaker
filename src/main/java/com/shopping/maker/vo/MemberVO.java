package com.shopping.maker.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {

	private String loginId;
	private String passWord;
	private String email;
	
}
