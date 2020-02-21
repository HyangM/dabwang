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

public class BoardTypeListDto {
	private int agentId;
	private String email;
	private String name;
	private String title;
	private String typeCer;
	private int postId;
	private Timestamp createDate;
	private Timestamp confirmDate;
	
	
}
