package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.Criteria;
import com.ksh.dabang.model.room.Options;
import com.ksh.dabang.model.room.Room;
import com.ksh.dabang.model.room.Room_pic;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.room.dto.RespRoomApprDto;
import com.ksh.dabang.model.room.dto.RespSearchListDto;

public interface RoomRepository {
	
	public int findAll();
	
	public Room findByroomId(int roomId);
	
	public List<Room_pic> findAllpics(int roomId);
	public List<Options> findAlloption(int roomId);
	
	
	public int upload(ReqUploadDto dto);
	public int uploadSelectKey();
	public int saveOption(int selectKey, String optionOne);
	public int saveRoomPic(int selectKey, int num, String OnepicName);

	//매물승인게시판에 글쓰기.
	public int dealBoardWrite(int selectKey, int hostId, String addr);
	//매물승인게시판 리스트 보기.
	public List<RespRoomApprDto> findAllroomAppr(int pageLimit);
	//매물직접승인하기.
	public int roomApprove(int roomId, int agentId);
	//승인된 매물은 게시판에 Y표시하기.
	public int updatePostdeal(int roomId, int agentId);


	
	public List<RespSearchListDto> findBySearchList(int userId, String keyword, String roomType1, String roomType2, String roomType3, String roomType4, String roomType5,
			String dealType1, String dealType2, String dealType3, int page, int perPageNum);
		
	public List<RespSearchListDto> listPage(Criteria cri);
	public int totalCount(Criteria cri);
	
	//서하추가 최근본방 테이블에 저장
	public int saveToday(int roomId, int userId);
		
}
