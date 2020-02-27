package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;
import com.ksh.dabang.model.user.dto.TodayRecodeDto;
import com.ksh.dabang.model.user.dto.UpdateDto;



public interface UserRepository {
	int findAll();
	int join(JoinDto joindto);
	int emailCheck(String email);
	int typeSave(int userId, String typeName, int typeNum, String typeImage);
	User findByUsernameAndPassword(LoginDto loginDto);
	int updateUser(UpdateDto updateDto);
	List<TodayRecodeDto> findTodayRecode(int userId);
}

