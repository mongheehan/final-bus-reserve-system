package org.bus.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class PlainTextPasswordEncoder implements PasswordEncoder {
	
	private static final PasswordEncoder INSTANCE = new PlainTextPasswordEncoder();

	private PlainTextPasswordEncoder() {}
	
	//// 비밀번호를 단방향 암호화
	@Override
	public String encode(CharSequence rawPassword) {
		log.warn("before encode" + rawPassword);
		return rawPassword.toString();
	}

	//// 암호화되지 않은 비밀번호(raw-)와 암호화된 비밀번호(encoded-)가 일치하는지 비교
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.warn("matches: " + rawPassword + ":" + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
	
	public static PasswordEncoder getInstance() {
		return INSTANCE;
	}

}
