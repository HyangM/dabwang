package com.ksh.dabang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ksh.dabang.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@GetMapping("/saleconfirm")
	public String confirm() {
		return "saleconfirm";
	}

	// 윤정 추가!!  방 상세보기.
//	@GetMapping("/detail")
//	public String detail() {
//		return "detail";
//	}
	
	@GetMapping("/detail/{roomId}")
	public String roomOne(@PathVariable int roomId, Model model) {
		
		model.addAttribute("room", roomService.방상세보기(roomId));
		model.addAttribute("room_pics", roomService.방사진들보기(roomId));
		model.addAttribute("room_options", roomService.방옵션보기(roomId));
			
//		List<Options> opt = roomService.방옵션보기(roomId);	
//		System.out.println(opt);
		
		return "detail";	
	}  
	
	
	

	// 윤정 추가!!
	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}
	
	
	
	@GetMapping("/upload2")
	public String upload2() {
		return "upload2";
	}
	@GetMapping("/uploadTest")
	public String uploadTest() {
		return "uploadTest";
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
