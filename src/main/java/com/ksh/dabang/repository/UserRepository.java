package com.ksh.dabang.repository;

import java.util.List;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.RespIdentifyDto;
import com.ksh.dabang.model.user.dto.RespJoinDto;
import com.ksh.dabang.model.user.dto.RespLoginDto;
import com.ksh.dabang.model.user.dto.ReqResetPasswordDto;
import com.ksh.dabang.model.user.dto.RespTodayRecodeDto;
import com.ksh.dabang.model.user.dto.ReqUpdateDto;



public interface UserRepository {
	int findAll();
	int join(RespJoinDto dto);
	int emailCheck(String email);
	int typeSave(int userId, String typeName, int typeNum, String typeImage);
	User findByUsernameAndPassword(RespLoginDto dto);
	int updateUser(ReqUpdateDto dto);
	List<RespTodayRecodeDto> findTodayRecode(int userId);
	User autoLogin(String email,String password);
	int findIdentify(RespIdentifyDto dto);
	int passwordReset(ReqResetPasswordDto dto);
}

