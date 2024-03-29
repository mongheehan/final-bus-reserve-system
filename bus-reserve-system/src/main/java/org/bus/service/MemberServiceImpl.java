package org.bus.service;

import org.bus.domain.UserVO;
import org.bus.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	/* 사용자 추가 -> 회원 가입 */
	@Override
	public void join(UserVO vo) {
		mapper.insertMember(vo);
	}

	//사용자 상세 조회
	@Override
	public UserVO readUser(String id) {
		return mapper.readUser(id);
	}

}
