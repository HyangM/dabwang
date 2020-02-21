package com.ksh.dabang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private HttpSession session;
	
	@Value("${file.path}")
	private String fileRealPath;
	
	
	@Autowired
	private RoomService roomService;
	
	@GetMapping("/saleconfirm")
	public String confirm() {
		return "saleconfirm";
	}

	@GetMapping("/detail/{roomId}")
	public String roomOne(@PathVariable int roomId, Model model) {
		
		model.addAttribute("room", roomService.방상세보기(roomId));
		model.addAttribute("room_pics", roomService.방사진들보기(roomId));
		model.addAttribute("room_options", roomService.방옵션보기(roomId));
		
		return "detail";	
	}  
	
	
	// 방등록 페이지로 이동하기.
	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}
	// 실제 방등록 처리 과정 실행하기.
	@PostMapping("/uploadProc")
	public @ResponseBody ResponseEntity<?> roomUpload(@RequestBody ReqUploadDto dto) {

		User principal = (User) session.getAttribute("principal");
		dto.setHostId(principal.getUserId());
		
		int result = roomService.방등록하기(dto);

		if(result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}	
	}	
		
	
	@PostMapping("/uploadTest")
	public String uploadTest() {
		return "uploadTest";
	}
	
	@GetMapping("/buttonTest")
	public String buttonTest() {
		return "buttonTest";
	}
	
	
	
	
	
	@GetMapping("/jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}
	
	//지도 테스트
	@GetMapping("/maptest")
	public String maptest() {
		return "map-test";
	}
	@GetMapping("/clusteringtest")
	public String clusteringtest() {
		return "clustering-test";
	}
	
	

	
}
