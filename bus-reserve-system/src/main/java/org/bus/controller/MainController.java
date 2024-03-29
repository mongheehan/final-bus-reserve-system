package org.bus.controller;

import org.bus.domain.PayDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {
	
	@GetMapping()
	public void insertPay(PayDTO pay) {
		log.info("--------main--------");
	}
	
}
