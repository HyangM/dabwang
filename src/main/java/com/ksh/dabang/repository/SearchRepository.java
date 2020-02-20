package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.dto.RespLatlngDto;

public interface SearchRepository {
	public List<RespLatlngDto> findBylatlng();
}
