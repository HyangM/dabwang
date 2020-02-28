package com.ksh.dabang.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.board.dto.BoardTypeApprDto;
import com.ksh.dabang.model.board.dto.BoardTypeCerDto;
import com.ksh.dabang.model.board.dto.BoardTypeListDto;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.JoinDto;
import com.ksh.dabang.model.user.dto.LoginDto;
import com.ksh.dabang.model.user.dto.OverlapDto;
import com.ksh.dabang.model.user.dto.TodayRecodeDto;
import com.ksh.dabang.model.user.dto.UpdateDto;
import com.ksh.dabang.service.BoardService;
import com.ksh.dabang.service.UserService;

@Controller
public class UserController {

	@Autowired
	private HttpSession session;
	
	@Value("${file.path}")
	private String fileRealPath;

	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;

	@GetMapping({ "", "/" })
	public String index(Model model) {
		
		User user = (User) session.getAttribute("principal");
		
		if(user != null) {
			int userId=user.getUserId();
			List<TodayRecodeDto> todayRecodes = userService.오늘본방(userId);
			
			model.addAttribute("todayRecodes",todayRecodes);
		}
		
		return "index";
		
	}

	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}
	
	@GetMapping("/typeApprList/{pageNo}")
	public String typeCerList(@PathVariable int pageNo,Model model) {
		List<BoardTypeListDto> typeCers=boardService.공인중개사승인게시판(pageNo);
		int lastPageNo = boardService.마지막게시글번호();
		model.addAttribute("typeCers",typeCers);
		model.addAttribute("lastPageNo",lastPageNo);
		return "board/typeApprList";
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
		return "user/join";
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
		User principal = userService.가입시자동로그인(joinDto.getEmail(),joinDto.getPassword());
		if (result == 1) {
			if (joinDto.getType().equals("공인중개사")) {
				session.setAttribute("principal", principal);
				return new ResponseEntity<RespCM>(new RespCM(200, "typeImage"), HttpStatus.OK);
			}
			session.setAttribute("principal", principal);
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
		return "user/typeCer";
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
		int boardSave = boardService.공인중개사정보게시글생성(userId);
		
		if (result == 1 && boardSave ==1) {
			return "index";
		} else {
			return "index";
		}
	}
	
	@GetMapping("/typeAppr/{postId}")
	public String typeAppr(@PathVariable int postId,Model model) {
		BoardTypeCerDto postAuth = boardService.공인중개사승인디테일(postId);
		model.addAttribute("postAuth",postAuth);
		return "board/typeAppr";
	}

	@PutMapping("/typeAppr")
	public ResponseEntity<?> typeAppr(@RequestBody BoardTypeApprDto typeApprDto) {
		int result = boardService.공인중개사권한부여(typeApprDto.getAgentId());
		System.out.println(result);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}
	

	
	
}
