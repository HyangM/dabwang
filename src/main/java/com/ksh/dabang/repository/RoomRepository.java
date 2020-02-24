package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.Options;
import com.ksh.dabang.model.room.Room;
import com.ksh.dabang.model.room.Room_pic;
import com.ksh.dabang.model.room.dto.ReqSavePicDto;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.room.dto.RespSearchListDto;

public interface RoomRepository {
	public int findAll();
	
	public Room findByroomId(int roomId);
	
	public List<Room_pic> findAllpics(int roomId);
	public List<Options> findAlloption(int roomId);
	public List<RespSearchListDto> findBySearchList();
	
	
	public int upload(ReqUploadDto dto);
	public int uploadSelectKey(ReqUploadDto reqUploadDto);
	public int saveOption(int selectKey, String optionOne);
	public int saveRoomPic(int selectKey, int num, String OnepicName);
	
	
	
	
	public List<RespSearchListDto> findByKeywordSearchList(String keyword);
	
	
}
