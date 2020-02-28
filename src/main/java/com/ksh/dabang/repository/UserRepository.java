package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.IdentifyDto;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;
import com.ksh.dabang.model.user.dto.ResetPasswordDto;
import com.ksh.dabang.model.user.dto.TodayRecodeDto;
import com.ksh.dabang.model.user.dto.UpdateDto;



public interface UserRepository {
	int findAll();
	int join(JoinDto dto);
	int emailCheck(String email);
	int typeSave(int userId, String typeName, int typeNum, String typeImage);
	User findByUsernameAndPassword(LoginDto dto);
	int updateUser(UpdateDto dto);
	List<TodayRecodeDto> findTodayRecode(int userId);
	User autoLogin(String email,String password);
	int findIdentify(IdentifyDto dto);
	int passwordReset(ResetPasswordDto dto);
}

