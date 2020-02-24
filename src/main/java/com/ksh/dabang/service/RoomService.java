package com.ksh.dabang.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.dabang.model.room.Options;
import com.ksh.dabang.model.room.Room;
import com.ksh.dabang.model.room.Room_pic;
import com.ksh.dabang.model.room.dto.ReqSavePicDto;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
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
	
	
	public int 방등록하기(ReqUploadDto reqUploadDto, ReqSavePicDto reqSavePicDto) {
		
		int result1 = roomRepository.upload(reqUploadDto);  //이게 1이면 성공인데,,
		if(result1 == 1) {
			
			int selectKey = roomRepository.uploadSelectKey(reqUploadDto);
			
			if (selectKey >0) {
				//방 옵션 저장하기.
				String [] optionArr = reqUploadDto.getOptionId();
				for(int i=0; i<optionArr.length; i++) {
					String optionOne = optionArr[i];
					roomRepository.saveOption(selectKey, optionOne);
				}
				
				//방 사진들 저장하기.
				List<String> roomPicArr = reqSavePicDto.getPicName();
				int roomNum = 1;
				for(Object picName : roomPicArr) { 
					String OnepicName = (String)picName; 
					
					roomRepository.saveRoomPic(selectKey, roomNum, OnepicName);	
					System.out.println(reqSavePicDto);
					roomNum ++;
					
					
				}

						
				
				

				
				return 1;
			} else {
				return -1;
			}
		} else {
			return -1;
		}	
	}
		
//		int result = roomRepository.upload(reqUploadDto);
//		if (result == 1) {
//			selectkey = roomRepository.uploadselectkey(dto);
//			1
//			selectkey > 0    인덱스 최대값 불러오기???
//			for(int i=0, i< option.size; i++{
//				roomRepository.uploadoptoion(roomId, optionId);
//			}
//	}
		
	
	
	
		

}
