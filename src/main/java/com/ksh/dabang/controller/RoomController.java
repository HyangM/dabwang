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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ksh.dabang.model.RespCM;
import com.ksh.dabang.model.board.dto.BoardTypeListDto;
import com.ksh.dabang.model.room.dto.ReqRoomApprDto;
import com.ksh.dabang.model.room.dto.ReqSavePicDto;
import com.ksh.dabang.model.room.dto.ReqUploadDto;
import com.ksh.dabang.model.room.dto.RespOtherRoomDto;
import com.ksh.dabang.model.user.User;
import com.ksh.dabang.repository.RoomRepository;
import com.ksh.dabang.service.BoardService;
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
	
	@GetMapping("/detail/{roomId}")
	public String roomOne(@PathVariable int roomId, Model model) {
		
		User user = (User) session.getAttribute("principal");
		if(user != null) {
			int userId = user.getUserId();
			int result = roomService.오늘본방저장(roomId,userId);
			if (result ==1) {
				System.out.println("오늘본방저장완료");
			}
		}
		RespOtherRoomDto dto = roomService.룸아이디로공인중개사찾기(roomId);
		int agentId = dto.getAgentId();
		model.addAttribute("otherRooms",roomService.공인중개사의방보기(agentId));
		model.addAttribute("room", roomService.방상세보기(roomId));
		model.addAttribute("room_pics", roomService.방사진들보기(roomId));
		model.addAttribute("room_options", roomService.방옵션보기(roomId));
		
		return "room/detail";	
	}  
	
	
	// 방등록 페이지로 이동하기.
	@GetMapping("/upload")
	public String upload() {
		return "room/upload";
	}
	// 실제 방등록 처리 과정 실행하기.
	@PostMapping("/uploadProc")
	public @ResponseBody String roomUpload(
			ReqUploadDto reqUploadDto,
			ReqSavePicDto reqSavePicDto,
			@RequestParam MultipartFile [] picFiles) { 
		
		User principal = (User) session.getAttribute("principal");
		reqUploadDto.setHostId(principal.getUserId());		
		
		System.out.println("getMonthRent : "+reqUploadDto.getMonthRent());
		System.out.println("deposit : "+reqUploadDto.getDeposit());
		System.out.println("컨트롤러 도착");
		System.out.println(picFiles);
		
		List<String> picNames = new ArrayList<String>();
		
		for (MultipartFile multipartFile : picFiles) {
			
			UUID uuid = UUID.randomUUID();
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

		reqSavePicDto.setPicName(picNames);	
		
		int result = roomService.방등록하기(reqUploadDto, reqSavePicDto);  //방정보, 방옵션, 방사진까지 등록성공하면, result=1이다.
		
//		roomService.매물승인신청(reqUploadDto);
//		//매물승인신청 게시판에 글쓰는거 성공하면 result 값이 1이된다.
//		System.out.println("매물승인신청 성공??");
		

		if(result == 1) {
//			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
			
			int hostId = principal.getUserId();

			String addr = reqUploadDto.getAddr();
			System.out.println("매물주소는:" + addr);
			
			roomService.매물승인신청(hostId, addr);
			//매물승인신청 게시판에 글쓰는거 성공하면 result 값이 1이된다.
			System.out.println("매물승인신청 성공??");
			
			
			return Script.href("방내놓기 완료", "/");
		} else {
//			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
			return Script.back("방내놓기 실패");
		}
	}	

	
	@GetMapping("/buttonTest")
	public String buttonTest() {
		return "buttonTest";
	}
	
	
	
	@GetMapping("/jusoPopup")
	public String jusoPopup() {
		return "popup/jusoPopup";
	}
	
	
	//매물승인 게시판 리스트로 이동.
   @GetMapping("/roomApprList/{pageNo}")
   public String roomApprList(@PathVariable int pageNo, Model model) {
	   model.addAttribute("roomApprBoard", roomService.매물승인게시판(pageNo));
	   return "board/roomApprList";
   }
   
   //매물승인을 위한 상세보기 페이지로 이동.
   @GetMapping("/roomAppr/{roomId}")
	public String roomApprOne(@PathVariable int roomId, Model model) {
		
		model.addAttribute("room", roomService.방상세보기(roomId));
		model.addAttribute("room_pics", roomService.방사진들보기(roomId));
		model.addAttribute("room_options", roomService.방옵션보기(roomId));
		
		return "board/roomAppr";	
	} 
   
   // form:form 사용. 매물승인 버튼 눌렀을때.
	@PutMapping("/roomAppr")
	public @ResponseBody String roomApproe(
			@RequestParam int roomId, 
			@RequestParam int agentId){
		
		int result = roomService.매물승인하기(roomId, agentId);
		
		if(result == 1) {
			roomService.승인받은매물(roomId, agentId);
			
			return Script.href("매물승인 성공", "/roomApprList/1");
		}else {
			return Script.back("매물승인 실패");
		}	

	}
	   
	

	
}
