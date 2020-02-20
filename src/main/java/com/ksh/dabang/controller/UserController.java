package com.ksh.dabang.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;
import com.ksh.dabang.model.user.dto.OverlapDto;
import com.ksh.dabang.model.user.dto.UpdateDto;
import com.ksh.dabang.service.UserService;

@Controller
public class UserController {

	@Autowired
	private HttpSession session;
	
	@Value("${file.path}")
	private String fileRealPath;

	@Autowired
	UserService userService;

	@GetMapping({ "", "/" })
	public String index() {
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
	@GetMapping("/typeCerAdmin")
	public String typeCerAdmin() {
		return "typeCerAdmin";
	}
	
	@PostMapping("/login")
	public ResponseEntity<?> login(@Valid @RequestBody LoginDto loginDto,HttpServletResponse response) {
		
		if(loginDto.getRememberMe().equals("true")) {
			Cookie cookie = new Cookie("emailCookie", loginDto.getEmail());
			cookie.setMaxAge(60*60*24*7);
			cookie.setPath("/");
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("emailCookie", "");
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
	
		User principal = userService.로그인(loginDto);
		
	    if(principal != null) {
	         session.setAttribute("principal", principal);
	         return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
	      }else {
	         return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
	      }	
	}

	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@PostMapping("/join")
	public ResponseEntity<?> join(@Valid @RequestBody JoinDto joinDto, BindingResult bindingResult, Model model) {
	  if (bindingResult.hasErrors()) {
	         Map<String, String> errorMap = new HashMap<>();

	         for (FieldError error : bindingResult.getFieldErrors()) {
	            errorMap.put(error.getField(), error.getDefaultMessage());
	            System.out.println(error.getField());
	            System.out.println(error.getDefaultMessage());
	            
	         }
	         return new ResponseEntity<Map<String, String>>(errorMap, HttpStatus.BAD_REQUEST);
	      }
		  
		int result = userService.회원가입(joinDto);
		if (result == 1) {
			if (joinDto.getType().equals("공인중개사")) {
				return new ResponseEntity<RespCM>(new RespCM(200, "typeImage"), HttpStatus.OK);
			}

			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/join/overlap")
	public ResponseEntity<?> overlap(@RequestBody OverlapDto dto) {
		int result = userService.중복확인(dto.getEmail());
		// 중복되면 1, 중복 안되면 0
		if (result == 0) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(200, "dul"), HttpStatus.OK);
		}
	}
	
	
	@PutMapping("/mypage/update")
	public ResponseEntity<?> update(@RequestBody UpdateDto updatedto) {
		
		int result = userService.회원수정(updatedto);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
	
	
	
	@GetMapping("/mypage/typeCer")
	public String typeCer() {
		return "typeCer";
	}

	@PostMapping("/mypage/typeCer")
	public String joinType(@RequestParam int userId, @RequestParam String typeName, @RequestParam int typeNum,
			@RequestParam MultipartFile typeImage) {
		System.out.println(userId);
		System.out.println(typeName);
		System.out.println(typeNum);
		
		
		UUID uuid = UUID.randomUUID();
		String uuidFilename = "/usertypeImage/" + uuid + "_" + typeImage.getOriginalFilename();
		Path filePath = Paths.get(fileRealPath + uuidFilename);

		try {
			Files.write(filePath, typeImage.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}

		int result = userService.공인중개사정보입력(userId, typeName, typeNum, uuidFilename);

		if (result == 1) {
			return "/mypage";
		} else {
			return "/mypage";
		}
	}
}
