package com.shopping.maker.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.shopping.maker.entity.Member;
import com.shopping.maker.repository.MemberRepository;
import com.shopping.maker.repository.MemberRepositoryCustom;
import com.shopping.maker.vo.MemberModifyVO;
import com.shopping.maker.vo.MemberVO;

@Service
@Transactional
public class MemberRepositoryImpl implements MemberRepositoryCustom{
	
	@Autowired
	private MemberRepository memberRepository;
	private final JPAQueryFactory queryFactory;
	
	public MemberRepositoryImpl(EntityManager em) {
		this.queryFactory = new JPAQueryFactory(em);
	}
	
	public Optional<Member> saveMember(Member member) {
		
		boolean result = duplicateValidation(member);
		if(result) {
			memberRepository.save(member);
		}
		return memberRepository.findById(member.getId());
	}
	
	private boolean duplicateValidation(Member member) {
		
		return true;
	}
	
	public boolean loginMember(MemberVO memberVo) {
		Member member = new Member();
		member.convMemberDto(memberVo);
		
		boolean result = memberRepository.existsByLoginIdAndPassWord(member.getLoginId(), member.getPassWord());
		if(result) {
			return true;
		}else {
			return false;
		}
	}

	public void modifyMember(MemberModifyVO memberModifyVo) {
		// TODO Auto-generated method stub
		Member member = new Member();
		System.out.println("zipcode, address, street="+member.getAddress().getZipcode()+", "+member.getAddress().getAddress()+", "+member.getAddress().getStreet());
		/*
		 * Member findMember =
		 * memberRepository.findByLoginId(memberModifyVo.getLoginId());
		 * if(findMember!=null) { findMember.modifyMember(memberModifyVo); }
		 */
	}
}
