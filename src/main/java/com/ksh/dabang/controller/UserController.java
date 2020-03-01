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
import com.ksh.dabang.model.board.dto.ReqBoardTypeApprDto;
import com.ksh.dabang.model.board.dto.RespBoardTypeCerDto;
import com.ksh.dabang.model.board.dto.RespBoardTypeListDto;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.model.user.dto.RespIdentifyDto;
import com.ksh.dabang.model.user.dto.RespJoinDto;
import com.ksh.dabang.model.user.dto.RespLoginDto;
import com.ksh.dabang.model.user.dto.RespOverlapDto;
import com.ksh.dabang.model.user.dto.ReqResetPasswordDto;
import com.ksh.dabang.model.user.dto.RespTodayRecodeDto;
import com.ksh.dabang.model.user.dto.ReqUpdateDto;
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

		if (user != null) {
			int userId = user.getUserId();
			List<RespTodayRecodeDto> todayRecodes = userService.오늘본방(userId);
			model.addAttribute("todayRecodes", todayRecodes);
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
	public String typeCerList(@PathVariable int pageNo, Model model) {
		List<RespBoardTypeListDto> typeCers = boardService.공인중개사승인게시판(pageNo);
		int lastPageNo = boardService.마지막게시글번호();
		model.addAttribute("typeCers", typeCers);
		model.addAttribute("lastPageNo", lastPageNo);
		return "board/typeApprList";
	}

	@PostMapping("/login")
	public ResponseEntity<?> login(@Valid @RequestBody RespLoginDto dto, HttpServletResponse response) {

		if (dto.getRememberMe().equals("true")) {
			Cookie cookie = new Cookie("emailCookie", dto.getEmail());
			cookie.setMaxAge(60 * 60 * 24 * 7);
			cookie.setPath("/");
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("emailCookie", "");
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}

		User principal = userService.로그인(dto);

		if (principal != null) {
			session.setAttribute("principal", principal);
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/join")
	public String join() {
		return "user/join";
	}

	@PostMapping("/join")
	public ResponseEntity<?> join(@Valid @RequestBody RespJoinDto dto, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();

			for (FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println(error.getField());
				System.out.println(error.getDefaultMessage());

			}
			return new ResponseEntity<Map<String, String>>(errorMap, HttpStatus.BAD_REQUEST);
		}

		int result = userService.회원가입(dto);
		User principal = userService.가입시자동로그인(dto.getEmail(), dto.getPassword());
		if (result == 1) {
			if (dto.getType().equals("공인중개사")) {
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
	public ResponseEntity<?> overlap(@RequestBody RespOverlapDto dto) {
		int result = userService.중복확인(dto.getEmail());
		// 중복되면 1, 중복 안되면 0
		if (result == 0) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(200, "dul"), HttpStatus.OK);
		}
	}

	@PutMapping("/mypage/update")
	public ResponseEntity<?> update(@RequestBody ReqUpdateDto dto) {
		System.out.println(dto.getEmail());
		int result = userService.회원수정(dto);
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

		if (result == 1 && boardSave == 1) {
			return "index";
		} else {
			return "index";
		}
	}

	@GetMapping("/typeAppr/{postId}")
	public String typeAppr(@PathVariable int postId, Model model) {
		RespBoardTypeCerDto postAuth = boardService.공인중개사승인디테일(postId);
		model.addAttribute("postAuth", postAuth);
		return "board/typeAppr";
	}

	@PutMapping("/typeAppr")
	public ResponseEntity<?> typeAppr(@RequestBody ReqBoardTypeApprDto dto) {
		int result = boardService.공인중개사권한부여(dto.getAgentId());
		System.out.println(result);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	// 패스워드 변경을 위한 본인인증
	@GetMapping("/identifyVer")
	public String IdentifyVer() {
		return "user/identifyVer";
	}

	// 패스워드 변경을 위한 본인인증
	@PostMapping("/identifyVer")
	public ResponseEntity<?> identifyVer(@RequestBody RespIdentifyDto dto) {
		int result = userService.본인확인하기(dto);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/resetPassword")
	public ResponseEntity<?> identifyVer(@RequestBody ReqResetPasswordDto dto) {
		int result = userService.비밀번호변경하기(dto);
		System.out.println(result);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
	}

}
