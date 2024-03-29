package org.bus.Reserve;

import java.util.List;

import org.bus.domain.SearchedDispatch;
import org.bus.domain.TicketVO;
import org.bus.mapper.ReserveMapper;
import org.bus.service.ReserveService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReserveTests {
	
	@Autowired
	private ReserveMapper reserveMapper;
	@Autowired
	private ReserveService reserveService;
//	@Test
//	public void test() {
//		log.info(reserveMapper.getTime());
//	}

//	@Test
//	public void insertPay() {
//		LocalDateTime now = LocalDateTime.now();
//		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
//		
//		PayDTO pay = new PayDTO();
//		pay.setId("user11");
//		pay.setAmount(99999);
//		pay.setPaymentDate(formatedNow);
//		pay.setCardNo("0000-0000-0006");
//		log.info("---------------------------------------");
//		log.info(pay);
//		reserveService.insertPay(pay);
//		
//		log.info("--------- 결제정보삽입완료---------");
//	}
	
	//출발지역, 도착지역을 통한 배차 조회.
//	@Test
//	public void getDispatchListBySearch() {
//		SearchedDispatch searchedDispatch = new SearchedDispatch();
//		searchedDispatch.setDepartureTime("2024-03-23");
//		searchedDispatch.setStartTerminal("서울고속버스터미널");
//		searchedDispatch.setEndTerminal("부산바다터미널");
//		List<SearchedDispatch> list = reserveService.getDispatchListBySearch(searchedDispatch);
//		log.info("------------- 출발지, 도착지, 시간으로 검색한 리스트--------------");
//	}
	
	
//	@Test
//	public void getTerminalList() {
//		List<TerminalVO> terminalList = null;
//		terminalList = reserveService.getTerminalList();
//		reserveService.getTerminalList().forEach(terminal -> log.info(terminal));
//		log.info("------------- 터미널 리스트--------------");
//	}
	
//	@Test
//	public void getEndCandidate() {
//		String terminalName = "서울고속버스터미널";
//		List<SearchedDispatch> terminalList = null;
//		terminalList = reserveService.getEndCandidate(terminalName);
//		log.info(terminalList);
//	}
	@Test
	public void getTickets() {
		List<TicketVO> tickets = reserveService.getTicketsByDispatchNo(76);
		log.info(tickets);
	}
	
}
