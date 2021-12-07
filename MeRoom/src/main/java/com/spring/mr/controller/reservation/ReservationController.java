package com.spring.mr.controller.reservation;

import java.io.File;
import java.io.IOException;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.mr.service.user.RewardService;
import com.spring.mr.vo.reservation.ReservationService;
import com.spring.mr.vo.reservation.ReservationVO;
import com.spring.mr.vo.reservation.RoomService;
import com.spring.mr.vo.reservation.RoomVO;
import com.spring.mr.vo.user.UserVO;



@Controller
@SessionAttributes("roomOne")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationservice;
	@Autowired
	private RoomService roomservice;
	@Autowired
	private RewardService rewardService;
	
	public ReservationController() {
		System.out.println("--->> ReservationController() 객체생성");
	}
	
	
	
	@PostMapping("/lastReservation.do")
	public String lastReservation(ReservationVO vo,Model model, HttpSession session) {
		Map<String,String> map = new HashMap<>();
		
		String reserName = "";
		Calendar calendar = Calendar.getInstance();
		/*
		 * reserName += calendar.get(Calendar.YEAR); reserName +=
		 * (calendar.get(Calendar.MONTH)+1);
		 */
		reserName += calendar.get(Calendar.DATE);
		reserName += calendar.get(Calendar.HOUR);
		reserName += calendar.get(Calendar.MINUTE);
		reserName += calendar.get(Calendar.SECOND);
		reserName += calendar.get(Calendar.MILLISECOND);
		

				
		map.put("startDate", vo.getStartDate());
		map.put("endDate", vo.getEndDate());
		List<RoomVO> roomList = roomservice.getRoomInfo(map);
		
		  System.out.println("결과 확인 " + roomList); //예약에 대한 정보
		  System.out.println("lastRest 결과 전" + vo ); //갯수에 해당하는 요일에 방
		  System.out.println("이거 마지막 : " + roomList.get(0).getRmNumber());
		  
		  for(int i=0; i<vo.getCount(); i++) {
		  vo.setrIdx(reserName + i);
		  vo.setRmNumber(roomList.get(i).getRmNumber());
		  //이 안에 인설트 진행..
  
		  System.out.println("예약 vo 찐 확인? " + vo);
		  //reservation insert 진행 하는데 빈 칸 다 채워주기 !!~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		  reservationservice.insertReservation(vo);
		  
		  }
		UserVO userVO = (UserVO) session.getAttribute("vo");
		System.out.println("userVO 내용 확인 : " + userVO);
		//memberVO에서 조인해서 point 값 가져와야함 
		System.out.println("찐 유저 id:" + userVO.getMemberId());
		
		int point = rewardService.totalReward(userVO.getMemberId());
		
		session.setAttribute("point", point);
		
		System.out.println("lastRest 결과 후 " + vo  + "point 값 확인 :");

		session.setAttribute("reserVO", vo);
		
		return "redirect:/views/reservation/payment.jsp";
	}
	
	//--------------------Roomservice-----------------------
	// 객실 입력
	@PostMapping("/addRoom.do")
	public String addRoom(@ModelAttribute("Room")RoomVO vo, 
			MultipartHttpServletRequest request) throws Exception {
			System.out.println("객실 정보 등록 vo : " + vo);
		
			String uploadPath = request.getRealPath("/images/uploadFiles");
			
			List<MultipartFile> list = request.getFiles("file");
			System.out.println(list);
			int count = 0;
			String fileOriginName = "";
			
			
			StringBuilder sb = new StringBuilder();
		
			for(MultipartFile mf : list) {
				System.out.println(uploadPath);
				fileOriginName = mf.getOriginalFilename(); 
				
				SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-ddHHmmss");
				Date time = new Date();
				
				String time1 = format.format(time);
					
				fileOriginName = time1 + fileOriginName;
				mf.transferTo(new File(uploadPath+"\\"+fileOriginName));

				if(count==0) {
					sb.append(fileOriginName);
				}else {
					sb.append(","+ fileOriginName);
				}
				count++;
			}
		vo.setRmInfo((vo.getRmInfo().replace("\r\n","</li><li>")));
		vo.setRmInfo(vo.getRmInfo().substring(0,vo.getRmInfo().length()));
		System.out.println(vo.getRmInfo());
		vo.setFileName(sb.toString());
		
		//db저장 내용 추가
		roomservice.insertRoom(vo);
		
		return  "redirect:/roomList.do";
	}
	
	
	@GetMapping("/getRoom.do")
	public String getRoom(RoomVO vo, Model model,HttpSession session) {
		System.out.println(">>> 게시글 상세 보여주기");
		System.out.println(vo);
		
		
		vo = roomservice.getRoom(vo);
		
		model.addAttribute("roomVO", vo);
		
		session.setAttribute("roomVO", vo);
		
		return "/views/reservation/area.jsp";
	}
	
	@PostMapping("/getRoomList.do")
	@ResponseBody
	public List<RoomVO> getRoomList(@RequestBody RoomVO vo){

		List<RoomVO> roomList = roomservice.getRoomList(vo);
		List<RoomVO> roomResult = new ArrayList<RoomVO>();
		//vo 값을 갖고 오자 .. 파일명
		for(RoomVO vo2 : roomList) {
			if("STANDARD".equals(vo2.getRmKind())) {
				vo2.setRmNumber(201);
			}else if("SUITE".equals(vo2.getRmKind())) {
				vo2.setRmNumber(401);
			}else if("DELUX".equals(vo2.getRmKind())) {
				vo2.setRmNumber(301);
			}
			vo2 = roomservice.getRoom(vo2);
			roomResult.add(roomservice.getRoom(vo2));
		}

		
		return roomResult;
	}
	
	
	@PostMapping("/reserDetail.do")
	public String reserDetail(RoomVO vo, Model model, HttpSession session) {
	
		
		//model.addAttribute("roomDeVO", vo);
		vo.setRmNumber(roomservice.roomsearch(vo.getRmKind()));
		vo.setFileName(roomservice.fileSearch(vo.getRmNumber()));
		session.setAttribute("roomDeVO", vo);

		
		return "/views/reservation/reservationDetail.jsp";
	}
	
	
	
	
	// 객실 목록 보기
	@GetMapping("/roomList.do")
	public String roomList(Model model){
		System.out.println(">>>List 갖고 오기");
		
		List<RoomVO> roomList = roomservice.roomList();
		
		model.addAttribute("roomList", roomList);
		
		return "/views/management/mgmtRoom/roomMain.jsp";
	}
	
	// 객실 상세 보기
	
	
	@RequestMapping(value  = "/roomOne.do", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public RoomVO roomOne(RoomVO vo, Model model) {
		System.out.println(">>>상세정보 갖고 오기");
		
		vo = roomservice.getRoom(vo);
		
		System.out.println("가져온 vo " + vo);
		model.addAttribute("roomOne", vo);
		System.out.println("설마 세션 vo? " + vo);
		return vo;
		
	}
	
	

	
	
	//객실 업데이트
	@PostMapping("/roomUpdate.do")
	public String roomUpdate(@ModelAttribute("roomOne") RoomVO vo, MultipartHttpServletRequest request,SessionStatus sessionStatus) throws IllegalStateException, IOException {
		
		//파일 삭제 
		RoomVO voUp = roomservice.getRoom(vo);
		String files[] = voUp.getFileName().split(",");
		String uploadPath = request.getRealPath("/images/uploadFiles/");
		StringBuilder sb = new StringBuilder();
		
		
		for(String str : files) {
			File file = new File(uploadPath + URLDecoder.decode(str, "UTF-8"));
			file.delete();
		}	
		//파일 저장 
		
		List<MultipartFile> list = request.getFiles("file");
		int count = 0;
		String fileOriginName = "";
		
		for(MultipartFile mf : list) {
			fileOriginName = mf.getOriginalFilename(); 
			
			
			SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-ddHHmmss");
			Date time = new Date();
			
			String time1 = format.format(time);
			
			fileOriginName = time1 + fileOriginName;
			mf.transferTo(new File(uploadPath+"\\"+fileOriginName));
			
			if(count==0) {
				sb.append(fileOriginName);
			}else {
				sb.append(","+ fileOriginName);
			}
			count++;
		}
	
		vo.setFileName(sb.toString());

		roomservice.UpdateRoom(vo);
		//sessionStatus.setComplete();
		
		return "roomOne.do";
	}
	
	//객실 삭제 
	@RequestMapping("/roomDelete.do")
	public String roomDelete(int rmNumber,HttpServletRequest request) throws IOException {
		//파일 삭제
		System.out.println(rmNumber);
		RoomVO  vo = roomservice.getRoom(rmNumber);
		System.out.println("삭제에서 vo:" + vo);
		
		String files[] = vo.getFileName().split(",");
		String uploadPath = request.getRealPath("/images/uploadFiles/");
		
		for(String str : files) {
			File file = new File(uploadPath + URLDecoder.decode(str, "UTF-8"));
			System.out.println(file);
			file.delete();
		}	
		
		//db 삭제
		roomservice.delete(rmNumber);
		
		
		return "roomList.jsp";
	}
	
	@GetMapping("/reserIsDelete.do")
	public String reserIsDelete() {
		
		System.out.println("reserIsDel 실행");
		
		reservationservice.reserIsDel();
		
		return "/views/reservation/reserTest.jsp";
	}
	
	
	
	//----예약 전체 리스트-----------------
	
	@RequestMapping("/reserList.do")
	public String reserList(ReservationVO vo, Model model){
		System.out.println(">>>search : " + vo);
		if (vo.getrIdx() == null) { vo.setrIdx(""); }
		
		if (vo.getMemberId() == null) { vo.setMemberId(""); }
		System.out.println(">>>List 갖고 오기 : " + vo);
		List<ReservationVO> reserList = reservationservice.reserList(vo);
		model.addAttribute("reserList", reserList);
		return "/views/management/mgmtReservation/resvMain.jsp";
	}
	
	
	// 특정회원의 예약 내역을 조회
		@RequestMapping("/getUserReser.do")
		@ResponseBody
		public List<ReservationVO> getUserReser(UserVO vo, Model model) {
			System.out.println("회원의 예약 내역조회 : " + vo);
			List<ReservationVO> userReserList = reservationservice.getUserReser(vo);
			System.out.println("userReserList : " + userReserList);
			model.addAttribute("userReserList", userReserList);
			return userReserList;
		}
	
	
		@RequestMapping(value  = "/reserOne.do", 
				method = {RequestMethod.POST,RequestMethod.GET})
		public String reserOne(ReservationVO vo, Model model) {
		System.out.println(">>>상세정보 갖고 오기");
		
		vo = reservationservice.getReser(vo);
		
		System.out.println("가져온 vo " + vo);
		model.addAttribute("reserOne", vo);
		System.out.println("설마 세션 vo? " + vo);
		return "reserOneDetail.jsp";

	}
	
		@PostMapping("/reserUpdate.do")
		public String reserUpdate(ReservationVO vo, Model model) {
			System.out.println("상세정보 업데이트");
			
			
			reservationservice.reserUpdate(vo);
			
			return "reservationList.jsp";
		}
		
		@GetMapping("/reserDelete.do")
		public String reserDelete(String rIdx) {
			System.out.println(rIdx);
		
			reservationservice.reserDelte(rIdx);
			
			return "reservationList.jsp";
		}
	
	//관리자 예약 등록
		@PostMapping("/adminReserInsert.do")
		public String adminReserInster(ReservationVO vo) {
			
			String reserName = "";
			Calendar calendar = Calendar.getInstance();
			reserName += calendar.get(Calendar.YEAR);
			reserName += (calendar.get(Calendar.MONTH)+1);
			reserName += calendar.get(Calendar.DATE);
			reserName += calendar.get(Calendar.HOUR);
			reserName += calendar.get(Calendar.MINUTE);
			reserName += calendar.get(Calendar.SECOND);
			reserName += calendar.get(Calendar.MILLISECOND);
			
			vo.setrIdx(reserName);
			System.out.println(vo);
			
			reservationservice.insertReservation(vo);
			
			return "redirect:/mr/reserList.do";
		}
	
	@PostMapping("/roomReviewList.do")
	@ResponseBody
	public List<ReservationVO> roomReview(@RequestBody Map<String,String> map) {
		System.out.println("kind값:~~" + map.get("kind"));
		
		List<ReservationVO> list = reservationservice.roomReview(map.get("kind"));
		
		System.out.println(list);
		
		return list;
	}
	
	
	
}