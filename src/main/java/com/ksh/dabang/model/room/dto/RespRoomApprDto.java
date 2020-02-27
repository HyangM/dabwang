package com.ksh.dabang.model.room.dto;

import java.sql.Timestamp;
import java.util.List;

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
//	private int hostId;
	private String addr;
	private String hostName;
	private String createDate;
	private String confirmYN;
//	private Timestamp confirmDate;
	

}
