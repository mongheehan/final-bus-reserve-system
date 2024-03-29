package org.bus.controller;

import org.bus.domain.DispatchVO;
import org.bus.domain.PayDTO;
import org.bus.service.DispatchService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/manager/*")
@Log4j
@AllArgsConstructor
public class ManagerController {
	
	private DispatchService service;
	
	@GetMapping("/manager_route")
	public void getDispatchList(Model model) {
		model.addAttribute("dispatchList", service.getDispatchList());
		model.addAttribute("busList", service.getBusList());
		model.addAttribute("region", service.getRegionList());
		model.addAttribute("terminalList", service.getTerminalListManager());
	}
	
	@PostMapping(value = "/manager_route", consumes="application/json;")
	@ResponseBody
	public String saveDispatchInfo(@RequestBody DispatchVO dispatchInfoVo) {
		service.insertDispatch(dispatchInfoVo);
		return "save_success";
	}
	
	@PutMapping(value = "/manager_route")
	@ResponseBody
	public String modifyDispatchInfo(@RequestBody DispatchVO dispatchInfoVo) {
		service.updateDispatch(dispatchInfoVo);
		return "modify_success";
	}
	
	@GetMapping(value = "/manager_info")
	public void test2() {
		log.info("--------main--------");
	}

	
}
