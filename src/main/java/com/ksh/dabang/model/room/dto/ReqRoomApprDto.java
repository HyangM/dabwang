package com.ksh.dabang.model.room.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqRoomApprDto {
	
	private int roomId;
	private String title;
	private int hostId;
	private String confirmYN;
	private Timestamp createDate;

}
