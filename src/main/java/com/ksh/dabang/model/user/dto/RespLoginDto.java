package com.ksh.dabang.model.user.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RespLoginDto {

	@Size(max = 30, message = "이메일을 확인하세요.")
	@NotBlank(message = "이메일을 확인하세요.")
	private String email;

	@Size(max = 20, message = "비밀번호를  확인하세요.")
	@NotBlank(message = "비밀번호를 확인하세요")
	private String password;
	
	private String rememberMe;

}
