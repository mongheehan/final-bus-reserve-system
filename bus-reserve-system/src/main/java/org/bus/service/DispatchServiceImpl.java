package org.bus.service;

import java.util.List;

import org.bus.domain.BusVO;
import org.bus.domain.DispatchVO;
import org.bus.domain.TerminalVO;
import org.bus.mapper.DispatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DispatchServiceImpl implements DispatchService {

	@Autowired
	private DispatchMapper mapper;
	
	@Override
	public void insertDispatch(DispatchVO dispatchinfovo) {
		mapper.insertDispatch(dispatchinfovo);
	}

	@Override
	public void updateDispatch(DispatchVO dispatchinfovo) {
		mapper.updateDispatch(dispatchinfovo);
		
	}

	@Override
	public List<DispatchVO> getDispatchList() {
		return mapper.getDispatchList();
	}

	@Override
	public List<BusVO> getBusList() {
		return mapper.getBusList();
	}

	@Override
	public List<TerminalVO> getTerminalListManager() {
		return mapper.getTerminalListManager();
	}

	public List<String> getRegionList(){
		return mapper.getRegionList();
	}

//	@Override
//	public void deleteDispatch(int dispatchNo) {
//		mapper.deleteDispatch(dispatchNo);
//		
//	}


}
