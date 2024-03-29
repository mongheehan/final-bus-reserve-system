package org.bus.service;

import org.bus.domain.UserVO;

public interface MemberService {
	
	/* 회원 가입 */
	public void join(UserVO vo);
	
	/* 사용자 상세 조회 */
	public UserVO readUser(String id);
}
