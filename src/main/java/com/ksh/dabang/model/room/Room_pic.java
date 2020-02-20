package com.ksh.dabang.model.room;

import java.sql.Timestamp;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Room_pic {
	private int roomId;
	private int picId;
	private String picName;
	private Timestamp createDate;
	
	
	@Builder
	public Room_pic(int roomId, int picId, String picName, Timestamp createDate) {
		this.roomId = roomId;
		this.picId = picId;
		this.picName = picName;
		this.createDate = createDate;
	}
	
	
	
	

	
	
	
		

}
