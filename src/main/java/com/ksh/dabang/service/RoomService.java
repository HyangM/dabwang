package com.ksh.dabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.dabang.model.room.Options;
import com.ksh.dabang.model.room.Room;
import com.ksh.dabang.model.room.Room_pic;
import com.ksh.dabang.repository.RoomRepository;

@Service
public class RoomService {

	@Autowired
	private RoomRepository roomRepository;

	public Room 방상세보기(int roomId) {
		return roomRepository.findByroomId(roomId);
	}

	public List<Room_pic> 방사진들보기(int roomId) {

		return roomRepository.findAllpics(roomId);
	}

	public List<Options> 방옵션보기(int roomId) {

		return roomRepository.findAlloption(roomId);
	}

}
