package com.ksh.dabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ksh.dabang.model.room.dto.RespLatlngDto;
import com.ksh.dabang.model.room.dto.RespSearchListDto;
import com.ksh.dabang.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
 
	@GetMapping("/search")
	public String search(Model model) {
		 
		List<RespLatlngDto> dto = searchService.지도위치찾기();
		List<RespSearchListDto> rooms = searchService.방리스트();
		
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
	public String filter(@RequestParam String keyword, Model model) {
		 

		System.out.println("오기는 왔니??????????????????????");
		System.out.println("keyword :" + keyword);
		List<RespLatlngDto> dto = searchService.지도위치찾기();
		List<RespSearchListDto> rooms = searchService.방검색어조회(keyword);
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
	
}
