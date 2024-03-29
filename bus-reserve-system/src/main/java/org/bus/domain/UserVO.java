package org.bus.domain;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String birth;
	private String phoneNo;
	private String email;
	private String Type;  //권한
	private int userBno; //회원번호(시퀀스)
	
}
