package com.ksh.dabang.model.room;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Room_option {
	private int roomId;
	private String optionId;
	
	@Builder
	public Room_option(int roomId, String optionId) {
		
		this.roomId = roomId;
		this.optionId = optionId;
	}
}
