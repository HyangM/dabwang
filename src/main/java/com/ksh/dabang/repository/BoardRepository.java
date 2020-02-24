package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.board.dto.BoardTypeCerDto;
import com.ksh.dabang.model.board.dto.BoardTypeListDto;

public interface BoardRepository {
	List<BoardTypeListDto> findAll(int pageLimit);
	int saveTypeCer(int agentId);
	BoardTypeCerDto findByPostId(int postId);
	int saveTypeAppr(int agentId);
	int findAllBoard();
}
