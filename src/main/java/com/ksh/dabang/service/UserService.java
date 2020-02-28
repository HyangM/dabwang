package com.ksh.dabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.RespIdentifyDto;
import com.ksh.dabang.model.user.dto.RespJoinDto;
import com.ksh.dabang.model.user.dto.RespLoginDto;
import com.ksh.dabang.model.user.dto.ReqResetPasswordDto;
import com.ksh.dabang.model.user.dto.RespTodayRecodeDto;
import com.ksh.dabang.model.user.dto.ReqUpdateDto;
import com.ksh.dabang.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Transactional
	public int 회원가입(RespJoinDto dto) {
		return userRepository.join(dto);
	}

	@Transactional
	public int 중복확인(String email) {
		return userRepository.emailCheck(email);
	}

	@Transactional
	public int 공인중개사정보입력(int userId, String typeName, int typeNum, String typeImage) {
		return userRepository.typeSave(userId, typeName, typeNum, typeImage);
	}

	@Transactional
	public User 로그인(RespLoginDto dto) {
		return userRepository.findByUsernameAndPassword(dto);
	}

	@Transactional
	public int 회원수정(ReqUpdateDto dto) {
		return userRepository.updateUser(dto);
	}

	@Transactional
	public List<RespTodayRecodeDto> 오늘본방(int userId) {
		return userRepository.findTodayRecode(userId);
	}

	@Transactional
	public User 가입시자동로그인(String email, String password) {
		return userRepository.autoLogin(email, password);
	}

	@Transactional
	public int 본인확인하기(RespIdentifyDto dto) {
		return userRepository.findIdentify(dto);
	}

	@Transactional
	public int 비밀번호변경하기(ReqResetPasswordDto dto) {
		return userRepository.passwordReset(dto);
	}

}
