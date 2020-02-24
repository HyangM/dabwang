package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.Room_like;
import com.ksh.dabang.model.room.dto.RespLatlngDto;
import com.ksh.dabang.model.room.dto.RespRoomLikeDto;

public interface SearchRepository {
	public List<RespLatlngDto> findBylatlng();
	public int likeInsert(Room_like roomlike);
	public List<RespRoomLikeDto> likeSelect(int userId);
}
