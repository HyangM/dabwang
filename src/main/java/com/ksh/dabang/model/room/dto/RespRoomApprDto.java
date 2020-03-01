package com.ksh.dabang.model.room.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespRoomApprDto {  
	private int postId;
	private int roomId;
//	private int agentId;
	private String title;
	private int hostId;
	private String jibunAddr;
	private String hostName;
	private String createDate;
	private String confirmYN;
//	private Timestamp confirmDate;
	

}
