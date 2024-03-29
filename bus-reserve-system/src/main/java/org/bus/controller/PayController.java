package org.bus.controller;

import org.bus.service.ReserveService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/reserve/*")
public class PayController {
	
	private ReserveService reserveService;
	
	@GetMapping("/reserve_login")
	public String registerPay() {
		return "/reserve/reserve_login";
	}
	
	@PostMapping("/reserve_login")
	public  String postRegisterPay(@ModelAttribute("birth") String birth,
								@ModelAttribute("phoneNo") String phoneNo
								) {
		log.info("registerPay...........");
		
		log.info("ModelAttribute: " + birth);
		log.info("ModelAttribute: " + phoneNo);
		
		return "/reserve/reserve_pay";
	}
	
	@GetMapping("reserve_pay")
	public String mainRegisterPay() {
		return "/reserve/reserve_pay";
	}
	
//	@GetMapping("payTicket")
//	public String payTicket() {
//		return "payTicket";
//	}
	

    


}
