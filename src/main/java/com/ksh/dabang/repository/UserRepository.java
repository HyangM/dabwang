package com.ksh.dabang.repository;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;
import com.ksh.dabang.model.user.dto.TypeDto;



public interface UserRepository {
	int findAll();
	int join(JoinDto joindto);
	int emailCheck(String email);
	TypeDto findByEmail(String email);
	int typeSave(int userId, String typeName, int typeNum, String typeImage);
	User findByUsernameAndPassword(LoginDto loginDto);
}
