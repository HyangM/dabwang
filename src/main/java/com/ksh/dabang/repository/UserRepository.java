package com.ksh.dabang.repository;

import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;



public interface UserRepository {
	int findAll();
	int join(JoinDto joindto);
	int emailCheck(String email);
	int typeSave(int userId, String typeName, int typeNum, String typeImage);
	User findByUsernameAndPassword(LoginDto loginDto);
	int updateUser(int userId, String password, String peofile);
}
