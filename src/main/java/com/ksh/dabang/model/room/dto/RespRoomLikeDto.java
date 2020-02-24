package com.ksh.dabang.model.room.dto;

import java.sql.Timestamp;

import com.ksh.dabang.model.RespCM;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespRoomLikeDto extends RespCM{
		
	private int likeId;
	private int userId;
	private int roomId;
	private Timestamp createDate;
	
	@Builder
	public RespRoomLikeDto(int userId, int roomId, Timestamp createDate) {
		this.userId = userId;
		this.roomId = roomId;
		this.createDate = createDate;
	}
	
	
}
