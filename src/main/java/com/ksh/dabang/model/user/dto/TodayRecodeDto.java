package com.ksh.dabang.model.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class TodayRecodeDto {
	private int roomId;
	private int userId;
	private String roomType;
	private String dealType;
	private int yearRent;
	private int deposit;
	private int monthRent;
	private String title;
	private int floor;
	private int areaP;
	private int MCost;
	private String picName;
}
