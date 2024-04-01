package org.bus.controller;

import org.bus.domain.UserVO;
import org.bus.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Controller
@Log4j
public class MemberController {

	@Autowired
	private MemberService service;

	/* 로그인 페이지로 이동 */
	@GetMapping("/login")
	public void loginPage() {
		log.info("login");
	}

	/* 회원가입 페이지로 이동 */
	@GetMapping
	public String index() {
		return "/member/memberjoin";
	}
	
	@PostMapping("/register")
	public ResponseEntity<String> register(@RequestBody UserVO user) {
		service.join(user);
		System.out.println(user);
		System.out.println("register....");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
}