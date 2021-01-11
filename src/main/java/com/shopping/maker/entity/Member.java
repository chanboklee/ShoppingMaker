package com.shopping.maker.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.shopping.maker.vo.MemberModifyVO;
import com.shopping.maker.vo.MemberVO;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(of = {"id", "loginId", "userName", "passWord", "email", "joinAt", "profileImg"})
public class Member {
	
	@Id @GeneratedValue
	@Column(name = "member_id")
	private Long id;
	
	@Column(unique = true)
	private String loginId;
	private String userName;
	private String passWord;
	
	@Column(unique = true)
	private String email;
	private LocalDateTime joinAt;
	private String profileImg;
	
	@Embedded
	private Address address;
	
	@OneToMany(mappedBy = "member")
	private List<Order> orders = new ArrayList<>();
	
	public Member(String loginId, String userName, String passWord, String email) {
		this.loginId = loginId;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
	}
	
	public void settingSignUp() {
		this.joinAt = LocalDateTime.now();
	}
	
	public void convMemberDto(MemberVO memberVo) {
		this.loginId = memberVo.getLoginId();
		this.passWord = memberVo.getPassWord();
	}
	
	public void modifyMember(MemberModifyVO modifyVo, Address address) {
		this.userName = modifyVo.getUserName();
		this.loginId = modifyVo.getLoginId();
		this.passWord = modifyVo.getPassWord();
		this.email = modifyVo.getEmail();
		this.address = address;
	}	
}
