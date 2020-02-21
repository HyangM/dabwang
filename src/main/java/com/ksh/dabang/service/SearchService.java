package com.ksh.dabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.dabang.model.room.dto.RespLatlngDto;
import com.ksh.dabang.model.room.dto.RespSearchListDto;
import com.ksh.dabang.repository.RoomRepository;
import com.ksh.dabang.repository.SearchRepository;

@Service
public class SearchService {

	
	@Autowired
	private SearchRepository searchRepository;
	
	@Autowired
	private RoomRepository roomRepository;

	public List<RespLatlngDto> 지도위치찾기() {

		return searchRepository.findBylatlng();
	}
	
	public List<RespSearchListDto> 방리스트() {
		
		return roomRepository.findBySearchList();
	}
	
	public List<RespSearchListDto> 방검색어조회(String keyword) {
		
		return roomRepository.findByKeywordSearchList(keyword);
	}
}
