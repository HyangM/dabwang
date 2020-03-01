package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.board.dto.RespBoardTypeCerDto;
import com.ksh.dabang.model.board.dto.RespBoardTypeListDto;

public interface BoardRepository {
	List<RespBoardTypeListDto> findAll(int pageLimit);
	int saveTypeCer(int agentId);
	RespBoardTypeCerDto findByPostId(int postId);
	int saveTypeAppr(int agentId);
	int findAllBoard();
}
