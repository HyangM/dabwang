package com.ksh.dabang.model.user.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class JoinDto {

	@Size(max=30, message = "이메일을 확인하세요.")
	@NotBlank(message = "이메일을 확인하세요.")
	private String email;
	
	@Size(max=20, message = "이름을 확인하세요.")
	@NotBlank(message = "이름을 확인하세요.")
	private String name;
	
	@Size(max=20, message = "비밀번호를 확인하세요.")
	@NotBlank(message = "비밀번호를 입력하세요.")
	private String password;
	
	@Size(max=11, message = "핸드폰번호를 확인하세요.")
	@NotBlank(message = "핸드폰번호를 확인하세요.")
	private String phone;
	
	
	private String type;
	private String typeImage;
}

