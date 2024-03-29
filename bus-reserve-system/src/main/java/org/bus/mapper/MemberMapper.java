package org.bus.mapper;

import org.bus.domain.UserVO;

public interface MemberMapper {
	
	/* 사용자 추가 -> 회원 가입 */
	public void insertMember(UserVO vo);
	
	/* 사용자 상세 조회 -> 로그인 */
	public UserVO readUser(String id);

}
