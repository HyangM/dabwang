package com.ksh.dabang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;
import com.ksh.dabang.repository.UserRepository;


@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Transactional
	public int 회원가입(JoinDto joinDto) {
		return userRepository.join(joinDto);
	}
	
	@Transactional
	public int 중복확인(String email) {
		return userRepository.emailCheck(email);
	}
	
	
	@Transactional
	public int 공인중개사정보입력(int userId, String typeName, int typeNum, String typeImage) {
		return userRepository.typeSave(userId,typeName,typeNum,typeImage);
	}
	
	@Transactional
	public User 로그인(LoginDto logindto) {
	      return userRepository.findByUsernameAndPassword(logindto);
	   }
	
	@Transactional
	public int 회원수정(int userId, String password, String profile) {
	      return userRepository.updateUser(userId,password,profile);
		}
}
