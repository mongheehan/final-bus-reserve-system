package org.bus.service;

import java.util.List;

import org.bus.domain.PayDTO;
import org.bus.domain.SearchedDispatch;
import org.bus.domain.TerminalVO;
import org.bus.domain.TicketVO;

public interface ReserveService {
	public int registerPay(PayDTO pay);
	public List<SearchedDispatch> getDispatchListBySearch(SearchedDispatch searchedDispatch);
	public List<TerminalVO> getTerminalList();
	public List<SearchedDispatch> getEndCandidate(String terminalName);
	public List<TicketVO> getTicketsByDispatchNo(int dispatchNo);
}
