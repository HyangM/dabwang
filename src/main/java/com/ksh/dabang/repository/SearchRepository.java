package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.Room_like;
import com.ksh.dabang.model.room.dto.RespLatlngDto;

public interface SearchRepository {
	public List<RespLatlngDto> findBylatlng();
	public int likeInsert(Room_like roomlike);
	public int likeDelete(int likeId);
	public int likeSelect();
}
