package com.ksh.dabang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.room.Room_like;
import com.ksh.dabang.model.room.dto.RespLatlngDto;
import com.ksh.dabang.model.room.dto.RespRoomLikeDto;
import com.ksh.dabang.model.room.dto.RespSearchListDto;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private HttpSession session;
 
	@GetMapping("/search")
	public String search(Model model) {
		 
		List<RespLatlngDto> dto = searchService.지도위치찾기();
		List<RespSearchListDto> rooms = searchService.방리스트();
		User principal = (User)session.getAttribute("principal");
		if(principal != null) {
			List<RespRoomLikeDto> findLike = searchService.찜한방(principal.getUserId());
			model.addAttribute("like",findLike);
		}
		
		model.addAttribute("rooms", rooms);
		
		ObjectMapper mapper = new ObjectMapper();
    
		try {
			String jsonString = mapper.writeValueAsString(dto);
			model.addAttribute("map", jsonString);
			System.out.println("dto : "+dto);
			System.out.println(jsonString);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  
		return "/search/search";
	} 
   
	@GetMapping("/filter")
	public String filter(@RequestParam String keyword, @RequestParam String roomType, 
						 @RequestParam String dealType,
						 Model model) {

//		String[] roomTypeArr = roomType.split(",");
				
		List<RespLatlngDto> dto = searchService.지도위치찾기();
		List<RespSearchListDto> rooms = searchService.방검색조회(keyword, roomType, dealType);
		for(RespSearchListDto room:rooms) {
			System.out.println("getRoomType :"+room.getRoomType());
		}
		System.out.println("rooms : "+rooms);

		model.addAttribute("rooms", rooms);
		
		ObjectMapper mapper = new ObjectMapper();
    
		try {
			String jsonString = mapper.writeValueAsString(dto);
			model.addAttribute("map", jsonString);
//			System.out.println("dto : "+dto);
//			System.out.println(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
    
  
		return "/search/search";
	} 
	@GetMapping("/test")
	public String test() {
 
		return "/search/test";
	} 
	
	@PostMapping("/likeroom")
	public ResponseEntity<?> likeroom(@RequestBody Room_like roomlike){

		int result = searchService.찜한방추가(roomlike);
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
		
	}
	
	
}
