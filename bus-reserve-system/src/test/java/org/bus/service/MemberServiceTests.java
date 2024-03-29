package org.bus.service;

import org.bus.domain.UserVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Autowired
	private MemberService service;
	
	/* 회원 가입 */
	@Test
	public void join() {
		UserVO user = new UserVO();
				
		user.setId("test11");
		user.setPassword("test11");
		user.setName("test11");
		user.setBirth("2024-03-25 07:20:00");
		user.setPhoneNo("010-8811-1212");
		user.setEmail("test11");
		
		service.join(user);
		log.info(user);
	}
}
