package org.bus.Reserve;

import org.bus.domain.DispatchVO;
import org.bus.mapper.DispatchMapper;
import org.bus.service.DispatchService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DispatchTest {
	@Autowired
	private DispatchMapper mapper;
	@Autowired
	private DispatchService service;
	
//	@Test
//	public void testInsert() {
//		DispatchVO vo = new DispatchVO();
//		String formatedNow = "2024-03-30 07:20:00";
//		
//		vo.setBusNo(100);
//		vo.setStartPointName("강릉감자터미널");
//		vo.setEndPointName("대전터미널");
//	    vo.setDepartureTime(formatedNow);
//	    
//	    service.insertDispatch(vo);
//	}
	
//	@Test
//	public void testUpdate() {
//		DispatchInfoVO vo = new DispatchInfoVO();
//		vo.setDispatchNo(40);
//		vo.setBusNo(720);
//		vo.setDepartureTime("2024-03-24 07:20:00");
//		service.updateDispatch(vo);
//	}
	
//	@Test
//	public void testSelectList() {
//		service.getDispatchList().forEach(dispatch -> log.info(dispatch));
//	}
	
//	@Test
//	public void testBusList() {
//		service.getBusList().forEach(bus -> log.info(bus));
//	}
	
	@Test
	public void testTerminalList() {
		service.getTerminalListManager().forEach(t -> log.info(t));
	}
	
}
