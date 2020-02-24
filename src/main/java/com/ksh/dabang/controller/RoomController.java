package com.ksh.dabang.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.room.dto.ReqSavePicDto;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.service.RoomService;
import com.ksh.dabang.util.Script;

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
	public @ResponseBody String roomUpload(
			ReqUploadDto reqUploadDto,
			ReqSavePicDto reqSavePicDto,
			@RequestParam MultipartFile [] picFiles) { 
		
		User principal = (User) session.getAttribute("principal");
		reqUploadDto.setHostId(principal.getUserId());		
		
		
		System.out.println("컨트롤러 도착");
		System.out.println(picFiles);
		
		List<String> picNames = new ArrayList<String>();
		
		for (MultipartFile multipartFile : picFiles) {
			
			UUID uuid = UUID.randomUUID();
		//	String picFileOne = multipartFile.getOriginalFilename();
			String uuidFilename = uuid+"_"+multipartFile.getOriginalFilename();
			
			
			// nio 객체를 이용해서 파일을 폴더에 저장하기.
			Path filePath = Paths.get(fileRealPath+uuidFilename);
			try {
				Files.write(filePath, multipartFile.getBytes()); 
			} catch (IOException e) {
				e.printStackTrace();
			}
			picNames.add(uuidFilename);

		}
		
		System.out.println(picNames);
		reqSavePicDto.setPicName(picNames);		
		
		
		int result = roomService.방등록하기(reqUploadDto, reqSavePicDto);  //방정보, 방옵션, 방사진까지 등록성공하면, result=1이다.
		
		

		if(result == 1) {
//			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
			return Script.href("방내놓기 완료", "/");
		} else {
//			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
			return Script.back("방내놓기 실패");
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
	@GetMapping("/kkoMap")
	public String kkoMapTest() {
		return "kkoMap";
	}
	
	

	
}
