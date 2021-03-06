package com.ksh.dabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.dabang.model.room.Criteria;
import com.ksh.dabang.model.room.Room_like;
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

	public List<RespLatlngDto> 지도위치찾기(String keyword, String roomType, String dealType) {
		
		String[] roomTypeArr = roomType.split(",");
		String roomType1 = "";
		String roomType2 = "";
		String roomType3 = "";
		String roomType4 = "";
		String roomType5 = "";
		for(int i=0; i<roomTypeArr.length; i++) {
			String roomchk = roomTypeArr[i];
			if(roomchk.equals("1")) {
				roomType1 = "원룸";
			}else if(roomchk.equals("2")) {
				roomType2 = "투룸";
				roomType3 = "쓰리룸";
			}else if(roomchk.equals("3")) {
				roomType4 = "오피스텔";
			}else if(roomchk.equals("4")){
				roomType5 = "아파트";
			}
			
		}	
		
		String[] dealTypeArr = dealType.split(",");
		int len1 = dealTypeArr.length;
		String dealType1 = "";
		String dealType2 = "";
		String dealType3 = "";
		
		if(len1 == 1) {
			dealType1 = dealTypeArr[0];
		}else if(len1 == 2) {
			dealType1 = dealTypeArr[0];
			dealType2 = dealTypeArr[1];
		}else {
			dealType1 = dealTypeArr[0];
			dealType2 = dealTypeArr[1];
			dealType3 = dealTypeArr[2];
		}
		return searchRepository.findBylatlng(keyword, roomType1, roomType2, roomType3, roomType4, roomType5,
				dealType1, dealType2, dealType3);
	}
	
	public List<RespSearchListDto> 방리스트(int userId, String keyword, String roomType, String dealType, Criteria cri) {
		
		int perPageNum = cri.getPerPageNum();
		int page = (cri.getPage() - 1) * perPageNum;

		String[] roomTypeArr = roomType.split(",");
		String roomType1 = "";
		String roomType2 = "";
		String roomType3 = "";
		String roomType4 = "";
		String roomType5 = "";
		for(int i=0; i<roomTypeArr.length; i++) {
			String roomchk = roomTypeArr[i];
			if(roomchk.equals("1")) {
				roomType1 = "원룸";
			}else if(roomchk.equals("2")) {
				roomType2 = "투룸";
				roomType3 = "쓰리룸";
			}else if(roomchk.equals("3")) {
				roomType4 = "오피스텔";
			}else if(roomchk.equals("4")){
				roomType5 = "아파트";
			}
			
		}	
		
		String[] dealTypeArr = dealType.split(",");
		int len1 = dealTypeArr.length;
		String dealType1 = "";
		String dealType2 = "";
		String dealType3 = "";
		
		if(len1 == 1) {
			dealType1 = dealTypeArr[0];
		}else if(len1 == 2) {
			dealType1 = dealTypeArr[0];
			dealType2 = dealTypeArr[1];
		}else {
			dealType1 = dealTypeArr[0];
			dealType2 = dealTypeArr[1];
			dealType3 = dealTypeArr[2];
		}
		
		return roomRepository.findBySearchList(userId, keyword, roomType1, roomType2, roomType3, roomType4, roomType5,
				dealType1, dealType2, dealType3, page, perPageNum);
	}

	@Transactional
	public int 찜한방추가(Room_like roomlike) {
		return searchRepository.likeInsert(roomlike);
	}
	
	@Transactional
	public int 찜한방삭제(int likeId) {
		return searchRepository.likeDelete(likeId);
	}
	
	public int 찜한방Id찾기() {
		return searchRepository.likeSelect();
	}
	
	public int totalcount(String keyword, String roomType, String dealType) {
		String[] roomTypeArr = roomType.split(",");
		String roomType1 = "";
		String roomType2 = "";
		String roomType3 = "";
		String roomType4 = "";
		String roomType5 = "";
		for(int i=0; i<roomTypeArr.length; i++) {
			String roomchk = roomTypeArr[i];
			if(roomchk.equals("1")) {
				roomType1 = "원룸";
			}else if(roomchk.equals("2")) {
				roomType2 = "투룸";
				roomType3 = "쓰리룸";
			}else if(roomchk.equals("3")) {
				roomType4 = "오피스텔";
			}else if(roomchk.equals("4")){
				roomType5 = "아파트";
			}
			
		}	
		
		String[] dealTypeArr = dealType.split(",");
		int len1 = dealTypeArr.length;
		String dealType1 = "";
		String dealType2 = "";
		String dealType3 = "";
		
		if(len1 == 1) {
			dealType1 = dealTypeArr[0];
		}else if(len1 == 2) {
			dealType1 = dealTypeArr[0];
			dealType2 = dealTypeArr[1];
		}else {
			dealType1 = dealTypeArr[0];
			dealType2 = dealTypeArr[1];
			dealType3 = dealTypeArr[2];
		}
		return roomRepository.totalCount(keyword, roomType1, roomType2, roomType3, roomType4, roomType5,
				dealType1, dealType2, dealType3);
	}


}
