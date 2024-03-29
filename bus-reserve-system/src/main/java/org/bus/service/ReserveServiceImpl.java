package org.bus.service;

import java.util.List;

import org.bus.domain.PayDTO;
import org.bus.domain.SearchedDispatch;
import org.bus.domain.TerminalVO;
import org.bus.domain.TicketVO;
import org.bus.mapper.ReserveMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReserveServiceImpl implements ReserveService {

	private ReserveMapper reserveMapper;
	
	@Override
	public int registerPay(PayDTO pay) {
		
		return reserveMapper.insertPay(pay);		
	}

	@Override
	public List<SearchedDispatch> getDispatchListBySearch(SearchedDispatch searchedDispatch){ //출,도착지, 시간으로 배차정보검색
		List<SearchedDispatch> searchedList = null;
		searchedList = reserveMapper.getDispatchList(searchedDispatch);
		return searchedList;
	}

	@Override
	public List<TerminalVO> getTerminalList(){ 
		List<TerminalVO> terminalList = null;
		terminalList = reserveMapper.getTerminalList();
		return terminalList;
	}
	
	@Override 
	public List<SearchedDispatch> getEndCandidate(String terminalName){  //출발지로 도착지후보터미널 목록 검색
		List<SearchedDispatch> dispatchList = null;
		dispatchList = reserveMapper.getEndCandidate(terminalName);
		return dispatchList;
	}
	
	@Override
	public List<TicketVO> getTicketsByDispatchNo(int dispatchNo){
		return reserveMapper.getTickets(dispatchNo);
	}

}
