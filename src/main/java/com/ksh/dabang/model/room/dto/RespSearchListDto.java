package com.ksh.dabang.model.room.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RespSearchListDto {

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
	private int mCost;
	private String parking;
	private String elevator;
	private String lof;
	private String title;
	private String content;
	private Date createDate;
	private int hostId;
	private int agentId;
	private double lat;
	private double lng;
	private String picName;
	private int likeId;

	@Builder
	public RespSearchListDto(String roomType, String addr, String detailAddr, int yearRent, int deposit, int monthRent, int dealRent,
			double areaP, double areaM, int floor, String moveDay, int mCost, String parking, String elevator,
			String lof, String title, String content, Date createDate, int hostId, int agentId, double lat,
			double lng, String picName, int likeId) {
		this.roomType = roomType;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.yearRent = yearRent;
		this.deposit = deposit;
		this.monthRent = monthRent;
		this.dealRent = dealRent;
		this.areaP = areaP;
		this.areaM = areaM;
		this.floor = floor;
		this.moveDay = moveDay;
		this.mCost = mCost;
		this.parking = parking;
		this.elevator = elevator;
		this.lof = lof;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hostId = hostId;
		this.agentId = agentId;
		this.lat = lat;
		this.lng = lng;
		this.picName = picName;
		this.likeId = likeId;
	}
}
