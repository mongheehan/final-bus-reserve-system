package org.bus.service;

import java.util.List;

import org.bus.domain.BusVO;
import org.bus.domain.DispatchVO;
import org.bus.domain.TerminalVO;

public interface DispatchService {
	public void insertDispatch(DispatchVO dispatchinfovo);
	public void updateDispatch(DispatchVO dispatchinfovo);
	public List<DispatchVO> getDispatchList();
	public List<BusVO> getBusList();
	public List<TerminalVO> getTerminalListManager();
	public List<String> getRegionList();
	//public void deleteDispatch(int dispatchNo);
}
