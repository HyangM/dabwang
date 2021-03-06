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
public class ReqUploadDto {
	
	private String roomType;
	private String addr;
	private String detailAddr;
	private String jibunAddr;

	private String dealType;
	private int yearRent;
	private int deposit;
	private int monthRent;
	private int dealRent;
	private double areaP;
	private double areaM;

	private int floor;
	private String moveDay;
	private int mCost;
	private String parking;
	private String elevator;
	private String lof;

	private String title;
	private String content;
	private Timestamp createDate;

	private int hostId;
//	private int agentId;
	private double lat;
	private double lng;
	
	//옵션항목들 추가.
	private String[] optionId;

	
	
	
	
	
	
}
