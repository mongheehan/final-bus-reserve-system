package org.bus.mapper;

import java.util.List;

import org.bus.domain.BusVO;
import org.bus.domain.DispatchVO;
import org.bus.domain.TerminalVO;

public interface DispatchMapper {
	
	public int insertDispatch(DispatchVO dispatchinfovo);
	public int updateDispatch(DispatchVO dispatchinfovo);
	public List<DispatchVO> getDispatchList();
	public List<BusVO> getBusList();
	public List<TerminalVO> getTerminalListManager();
	public List<String> getRegionList();
	//public int deleteDispatch(int dispatchNo);
}
