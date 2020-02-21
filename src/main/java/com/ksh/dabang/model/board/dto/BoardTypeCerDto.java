package com.ksh.dabang.model.board.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class BoardTypeCerDto {
	private int agentId;
	private String email;
	private String name;
	private String type;
	private String typeCer;
	private String typeName;
	private String typeNum;
	private String typeImage;
	private String title;
	private int postId;
	private String confirmYN;
	private Timestamp createDate;
	private Timestamp confirmDate;
	
	
}
