package com.ksh.dabang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.room.Criteria;
import com.ksh.dabang.model.room.PageMaker;
import com.ksh.dabang.model.room.Room_like;
import com.ksh.dabang.model.room.dto.ReqRoomLikeDto;
import com.ksh.dabang.model.room.dto.RespLatlngDto;
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
	public String search(@RequestParam(defaultValue = "수영구") String keyword, @RequestParam(defaultValue = "1,2,3") String roomType, 
						 @RequestParam(defaultValue = "월세,전세,매매") String dealType, @RequestParam(defaultValue = "수영구") String keywordinput,
						 @ModelAttribute("cri") Criteria cri, Model model) {
		 
		List<RespLatlngDto> dto = searchService.지도위치찾기(keywordinput, roomType, dealType);
		
		User principal = (User)session.getAttribute("principal");
		int userId = 0;
		if (principal != null) {
			userId = principal.getUserId();		
		}
		
		List<RespSearchListDto> rooms = searchService.방리스트(userId, keywordinput, roomType, dealType, cri);				
		model.addAttribute("rooms", rooms);
		
		RespSearchListDto filtermodel = new RespSearchListDto();
		filtermodel.setKeyword(keyword);
		filtermodel.setFilterRoomType(roomType);
		filtermodel.setFilterDealType(dealType);
		filtermodel.setKeywordinput(keywordinput);
		model.addAttribute("filtermodel", filtermodel);
		
		int totalCount = searchService.totalcount(keywordinput, roomType, dealType);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		
		ObjectMapper mapper = new ObjectMapper();
    
		try {
			String jsonString = mapper.writeValueAsString(dto);
			model.addAttribute("map", jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
  
		return "/room/search";
	} 
   	
	@PostMapping("/likeroom")
	public ResponseEntity<?> likeroom(@RequestBody Room_like roomlike){
		
		int result = searchService.찜한방추가(roomlike);
		
		if (result == 1) {
			int likeId = searchService.찜한방Id찾기();
			ReqRoomLikeDto dto = new ReqRoomLikeDto();
			dto.setLikeId(likeId);
			dto.setStatusCode(200);
			dto.setMsg("ok");
			return new ResponseEntity<ReqRoomLikeDto>(dto, HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@DeleteMapping("/likeroom/{likeId}")
	public ResponseEntity<?> likeroom(@PathVariable int likeId){
		
		int result = searchService.찜한방삭제(likeId);
		
		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}		
	}
	
}
