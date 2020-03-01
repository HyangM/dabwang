package com.ksh.dabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.dabang.model.board.dto.RespBoardTypeCerDto;
import com.ksh.dabang.model.board.dto.RespBoardTypeListDto;
import com.ksh.dabang.repository.BoardRepository;


@Service
public class BoardService {

	@Autowired
	private BoardRepository BoardRepository;

	@Transactional
	public List<RespBoardTypeListDto> 공인중개사승인게시판(int pageNo) {
		int pageLimit = (pageNo-1)*10;
		return BoardRepository.findAll(pageLimit);
	}
	
	@Transactional
	public int 마지막게시글번호() {
		int lastPageNo = (int) Math.ceil(BoardRepository.findAllBoard()/10.0);
		return lastPageNo;
	}
	
	@Transactional
	public int 공인중개사정보게시글생성(int agentId) {
		return BoardRepository.saveTypeCer(agentId);
	}
	@Transactional
	public RespBoardTypeCerDto 공인중개사승인디테일(int postId ) {
		return BoardRepository.findByPostId(postId);
	}
	
	@Transactional
	public int 공인중개사권한부여(int agentId) {
		return BoardRepository.saveTypeAppr(agentId);
	}
}
