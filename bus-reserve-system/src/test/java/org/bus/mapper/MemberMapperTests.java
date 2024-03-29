package org.bus.mapper;

import static org.junit.Assert.*;

import org.bus.Reserve.ReserveTests;
import org.bus.domain.UserVO;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;

	@Test
	public void insertMember() {
		UserVO user = new UserVO();
		
		user.setId("test9");
		user.setPassword("test9");
		user.setName("test9");
		user.setBirth("2024-03-25 07:20:00");
		user.setPhoneNo("010-8888-7889");
		user.setEmail("test9");
		
		mapper.insertMember(user);
		log.info(user);
	}

}
