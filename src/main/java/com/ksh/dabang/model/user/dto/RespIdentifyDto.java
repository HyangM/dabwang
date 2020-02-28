package com.ksh.dabang.model.user.dto;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class RespIdentifyDto {
	private String email;
	private String phone;
}
