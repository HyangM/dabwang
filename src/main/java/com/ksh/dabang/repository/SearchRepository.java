package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.Room_like;
import com.ksh.dabang.model.room.dto.RespLatlngDto;

public interface SearchRepository {
	public List<RespLatlngDto> findBylatlng(String keyword, String roomType1, String roomType2, String roomType3, String roomType4, String roomType5,
			String dealType1, String dealType2, String dealType3);
	public int likeInsert(Room_like roomlike);
	public int likeDelete(int likeId);
	public int likeSelect();
}
