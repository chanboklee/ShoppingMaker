package com.shopping.maker.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Rollback(false)
public class MemberRepositoryTest {

	@Autowired
	private MemberRepository memberRepository;
	
	@Test
	public void loginValidTest() {
		
	}
}
