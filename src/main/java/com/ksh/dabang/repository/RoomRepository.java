package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.room.Criteria;
import com.ksh.dabang.model.room.Options;
import com.ksh.dabang.model.room.Room;
import com.ksh.dabang.model.room.Room_pic;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.room.dto.RespLikeRoomDto;
import com.ksh.dabang.model.room.dto.RespOtherRoomDto;
import com.ksh.dabang.model.room.dto.RespRoomApprDto;
import com.ksh.dabang.model.room.dto.RespRoomDto;
import com.ksh.dabang.model.room.dto.RespSearchListDto;

public interface RoomRepository {
	
	public int findAll();
	
	public RespRoomDto findByroomId(int roomId);
	
	public List<Room_pic> findAllpics(int roomId);
	public List<Options> findAlloption(int roomId);
	
	
	public int upload(ReqUploadDto dto);
	public int uploadSelectKey();
	public int saveOption(int selectKey, String optionOne);
	public int saveRoomPic(int selectKey, int num, String OnepicName);

	//매물승인게시판에 글쓰기.
	public int dealBoardWrite(int selectKey, int hostId, String jibunAddr);
	//매물승인게시판 리스트 보기.
	public List<RespRoomApprDto> findAllroomAppr(int pageLimit);
	//매물직접승인하기.
	public int roomApprove(int roomId, int agentId);
	//승인된 매물은 게시판에 Y표시하기.
	public int updatePostdeal(int roomId, int agentId);


	
	public List<RespSearchListDto> findBySearchList(int userId, String keyword, String roomType1, String roomType2, String roomType3, String roomType4, String roomType5,
			String dealType1, String dealType2, String dealType3, int page, int perPageNum);
		
	public List<RespSearchListDto> listPage(Criteria cri, String keyword, String roomType1, String roomType2, String roomType3, String roomType4, String roomType5,
			String dealType1, String dealType2, String dealType3);
	public int totalCount(String keyword, String roomType1, String roomType2, String roomType3, String roomType4, String roomType5,
			String dealType1, String dealType2, String dealType3);
	
	//서하추가 최근본방 테이블에 저장
	public int saveToday(int roomId, int userId);
	
	//서하추가 roomId로 공인중개사 찾기
	public RespOtherRoomDto findAgent(int roomId);
	
	//서하추가 보고있는 페이지를 올린 공인중개사의 다른 방 보기
	public List<RespOtherRoomDto> findByOtherRoom(int agentId);
	
	//서하추가 관심목록보기
	public List<RespLikeRoomDto> findLikeRoom(int userId);
	
	//서하추가 관심목록갯수
	public int findLikeRoomCount(int userId);
		
	
	
}
