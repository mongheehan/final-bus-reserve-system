package org.bus.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

import java.util.Collection;
import java.util.Collections;

@Getter
public class CustomUser extends User {

	private UserVO user;
	
	//CustomUser 클래스의 생성자를 수정하여 UserVO 객체를 받아와 User 클래스의 생성자를 호출
	public CustomUser(UserVO vo, Collection<? extends GrantedAuthority> authorities) {
		super(vo.getId(), vo.getPassword(), authorities);
		this.user = vo;
	}
	
	//buile메서드로 UserVO 객체를 CustomUser 객체로 변환할 때 사용
	public static CustomUser buile(UserVO vo) {
		Collection<? extends GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + vo.getType()));
        return new CustomUser(vo, authorities);
	}

}