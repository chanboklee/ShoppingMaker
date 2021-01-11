package com.shopping.maker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shopping.maker.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long>, MemberRepositoryCustom {

	boolean existsByLoginId(String loginId);
	boolean existsByLoginIdAndPassWord(String loginId, String passWord);
	
	Member findByLoginIdAndPassWord(String loginId, String passWord);
	
	

}
