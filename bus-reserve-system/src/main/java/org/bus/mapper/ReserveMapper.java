package org.bus.mapper;

import java.util.List;

import org.bus.domain.PayDTO;
import org.bus.domain.SearchedDispatch;
import org.bus.domain.TerminalVO;
import org.bus.domain.TicketVO;

public interface ReserveMapper {
	
	public String getTime(); // Mapper XML에 정의된 쿼리에 매핑되는 메서드
	
	public int insertPay(PayDTO pay);
	
	public List<TerminalVO> getTerminalList();
	
	//선택한 조건에 맞는 배차 정보들 검색.
	public List<SearchedDispatch> getDispatchList(SearchedDispatch searchedDispatch);

	//출발지에 대한 도착지검색(배차정보TB)
	public List<SearchedDispatch> getEndCandidate(String terminal);
	
	//배차번호로 해당 배차번호에 맞는 티켓들만 가져오기.
	public List<TicketVO> getTickets(int dispatchNo);
}
