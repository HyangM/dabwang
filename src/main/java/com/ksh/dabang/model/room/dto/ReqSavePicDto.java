package com.ksh.dabang.model.room.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqSavePicDto {

	private int roomId;
	private int picId;
	private List<String> picName;
	private Timestamp createDate;

}
