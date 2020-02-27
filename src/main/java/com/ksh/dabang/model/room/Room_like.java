package com.ksh.dabang.model.room;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room_like {
	private int likeId;
	private int userId;
	private int roomId;
	private Timestamp createDate;
	
	@Builder
	public Room_like(int userId, int roomId, Timestamp createDate) {
		this.userId = userId;
		this.roomId = roomId;
		this.createDate = createDate;
	}
	
	
}
