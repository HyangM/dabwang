package com.ksh.dabang.model.room.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class RespOtherRoomDto {
	private int roomId;
	private int agentId;
	private String roomType;
	private String dealType;
	private String dealRent;
	private int yearRent;
	private int deposit;
	private int monthRent;
	private String title;
	private int floor;
	private int areaP;
	private int MCost;
	private String picName;
}
