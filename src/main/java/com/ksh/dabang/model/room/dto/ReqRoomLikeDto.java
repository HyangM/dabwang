package com.ksh.dabang.model.room.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqRoomLikeDto {
	private int likeId;
	private int userId;
	private int roomId;
	private Timestamp createDate;
	private String ynchk;
	
	@Builder
	public ReqRoomLikeDto(int userId, int roomId, Timestamp createDate, String ynchk) {
		super();
		this.userId = userId;
		this.roomId = roomId;
		this.createDate = createDate;
		this.ynchk = ynchk;
	}
}
