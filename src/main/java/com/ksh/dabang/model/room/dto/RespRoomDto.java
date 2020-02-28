package com.ksh.dabang.model.room.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RespRoomDto {
	private int roomId;
	private String roomType;
	private String addr;
	private String detailAddr;

	private String dealType;
	private int yearRent;
	private int deposit;
	private int monthRent;
	private int dealRent;
	private double areaP;
	private double areaM;

	private int floor;
	private String moveDay;
	private int mcost;
	private String parking;
	private String elevator;
	private String lof;

	private String title;
	private String content;
	private Timestamp createDate;

	private int hostId;
	private int agentId;
	private double lat;
	private double lng;
	
	private String typeName;
	private String phone;
	private String name;
	
	
}
