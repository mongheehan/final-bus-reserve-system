package org.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/mypage/*")
@Controller
public class MypageController {

	@GetMapping("/mypage_info")
	public void myPageDo() {
		log.info("myPage");//test
	}
}
