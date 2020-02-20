package com.ksh.dabang.model.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class TypeDto {
	private int userId;
	private String typeName;
	private int typeNum;
	private String typeImage;
}

