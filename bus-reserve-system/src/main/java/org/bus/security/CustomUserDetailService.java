package org.bus.security;

import java.util.Collection;
import java.util.Collections;

import org.bus.domain.CustomUser;
import org.bus.domain.UserVO;
import org.bus.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {UserVO vo = mapper.readUser(username);
 
		// 사용자 정보가 없으면 예외를 던진다.
		if (vo == null) {
			throw new UsernameNotFoundException("아이디가 확인 되지 않습니다." + username);
        }
		System.out.println("확인: " + vo);
		// 사용자의 권한을 설정한다.
        Collection<? extends GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + vo.getType()));
        return new CustomUser(vo, authorities);
	}

}

