package org.bus.controller;

import org.bus.domain.PayDTO;
import org.bus.service.ReserveService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reserve/*")
@AllArgsConstructor
public class PayRestContorller {
	
	private ReserveService reserveService;
	
	//test메서드
//	@GetMapping("/getPayDTO")
//	public PayDTO getPayDTO() {
//		return new PayDTO(1, "aa", 3000, "2024/03/25 12:02", "승인", "0000-0000-0000", "99/01/01", "010-0000-0000");
//	};
	
	@PostMapping("/reserve_pay")
	public ResponseEntity<String> create(@RequestBody PayDTO dto) {
		log.info("DTO: " + dto);
		
		int insertCount = reserveService.registerPay(dto);
		
		log.info("insertCount: " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	};
	
}
