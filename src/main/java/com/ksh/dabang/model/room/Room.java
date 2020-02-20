package com.ksh.dabang.model.room;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Room {
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
	
	@Builder
	public Room(int roomId, String roomType, String addr, String detailAddr, String dealType, int yearRent, int deposit,
			int monthRent, int dealRent, double areaP, double areaM, int floor, String moveDay, int mcost,
			String parking, String elevator, String lof, String title, String content, Timestamp createDate, int hostId,
			int agentId, double lat, double lng) {
		this.roomId = roomId;
		this.roomType = roomType;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.dealType = dealType;
		this.yearRent = yearRent;
		this.deposit = deposit;
		this.monthRent = monthRent;
		this.dealRent = dealRent;
		this.areaP = areaP;
		this.areaM = areaM;
		this.floor = floor;
		this.moveDay = moveDay;
		this.mcost = mcost;
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
	}	
}
