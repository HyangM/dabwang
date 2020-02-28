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
import com.ksh.dabang.model.room.dto.ReqRoomApprDto;
import com.ksh.dabang.model.room.dto.ReqSavePicDto;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.room.dto.RespLikeRoomDto;
import com.ksh.dabang.model.room.dto.RespOtherRoomDto;
import com.ksh.dabang.model.room.dto.RespRoomApprDto;
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
			
			int selectKey = roomRepository.uploadSelectKey();
			
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
	
	public int 매물승인신청(int hostId, String addr) {
		
		int selectKey = roomRepository.uploadSelectKey();
		
		//reqRoomApprDto.setRoomId(selectKey);		
		System.out.println("룸서비스:매물승인신청 성공????????");
		 return roomRepository.dealBoardWrite(selectKey, hostId, addr);
	}
	
	public List<RespRoomApprDto> 매물승인게시판(int pageNo) {
		int pageLimit = (pageNo-1)*10;
		return roomRepository.findAllroomAppr(pageLimit);
		
	}
	public int 매물승인하기(int roomId, int agentId) {
		return roomRepository.roomApprove(roomId, agentId);  //성공하면, 매물승인 게시판에도 Y로 바꾸기.
	}
	public int 승인받은매물(int roomId, int agentId) {
		return roomRepository.updatePostdeal(roomId, agentId);
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
		
	
	//서하 오늘 본방 저장하기
	@Transactional
	public int 오늘본방저장(int roomId,int userId) {
		return roomRepository.saveToday(roomId,userId);
	}
	
	//보고있는 페이지 공인중개사의 다른 방 보기
	@Transactional
	public RespOtherRoomDto 룸아이디로공인중개사찾기(int roomId) {
		return roomRepository.findAgent(roomId);
	}
	
	//보고있는 페이지 공인중개사의 다른 방 보기
	@Transactional
	public List<RespOtherRoomDto> 공인중개사의방보기(int agentId) {
		return roomRepository.findByOtherRoom(agentId);
	}
	
	//관심목록 담아서 뿌리기
	@Transactional
	public List<RespLikeRoomDto> 관심목록보기(int userId) {
		return roomRepository.findLikeRoom(userId);
	}
	
	//관심목록 담아서 뿌리기
	@Transactional
	public int 관심목록갯수(int userId) {
		return roomRepository.findLikeRoomCount(userId);
	}
	
	
	
}
