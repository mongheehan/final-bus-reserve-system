package org.bus.controller;

import java.util.List;

import org.bus.domain.SearchedDispatch;
import org.bus.domain.TerminalVO;
import org.bus.domain.TicketVO;
import org.bus.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reserve/*")
@Log4j
@AllArgsConstructor
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@GetMapping()
	public String getTerminalList(Model model) {
		List<TerminalVO> terminals = reserveService.getTerminalList(); // Service에서 List<TerminalVO>를 가져옴
		model.addAttribute("terminals", terminals);// View에 List<TerminalVO>를 전달
		return "/reserve/reserve_main"; //reserve_main.jsp
	}
	
//	@GetMapping("pay")
//	public void insertPay(PayDTO pay) {
//		log.info("------- pay--------");
//	}
	
	@GetMapping("/start")
	@ResponseBody
	public List<SearchedDispatch> getCandidates(@RequestParam String terminalName) {	
		List<SearchedDispatch> candidates = reserveService.getEndCandidate(terminalName);
		return candidates ;
	}
	
	@PostMapping("/dispatch")
	@ResponseBody
	public List<SearchedDispatch> getDispatches(@RequestBody SearchedDispatch searchedDispatch){
		List<SearchedDispatch> dispatches = reserveService.getDispatchListBySearch(searchedDispatch);
		return dispatches;
	}

	@GetMapping("/seat-number")
	@ResponseBody
	public List<TicketVO> tickets(@RequestParam int dispatchNo){
		List<TicketVO> tickets = reserveService.getTicketsByDispatchNo(dispatchNo);
		return tickets;
	}
	
}
