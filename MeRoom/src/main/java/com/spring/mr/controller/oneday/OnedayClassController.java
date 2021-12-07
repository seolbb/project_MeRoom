package com.spring.mr.controller.oneday;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.spring.mr.service.oneday.OPaymentService;
import com.spring.mr.service.oneday.ORefundService;
import com.spring.mr.service.oneday.OReservationService;
import com.spring.mr.service.oneday.OnedayClassService;
import com.spring.mr.vo.oneday.OPaymentVO;
import com.spring.mr.vo.oneday.ORefundVO;
import com.spring.mr.vo.oneday.OReservationVO;
import com.spring.mr.vo.oneday.OnedayClassVO;

@Controller
@SessionAttributes({"oneday", "rsv", "pay"})
public class OnedayClassController {
	@Autowired
	private OnedayClassService onedayService;
	
	@Autowired
	private OReservationService rsvService;
	
	@Autowired
	private OPaymentService paymentService;
	
	@Autowired
	private ORefundService refundService;
	
	public OnedayClassController() {
		System.out.println("---> OnedayClassController() 객체생성");
	}
	
	// 관리자용--------------------------------------------------------------------------------
	// 글입력
	@RequestMapping("/insertClass.do")
	public String insertBoard(OnedayClassVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : " + vo);

		onedayService.insertClass(vo);
		return "redirect:getClassList.do";
	}
	
	@PostMapping(value = "/uploadAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	//public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {
	public ResponseEntity<List<OnedayClassVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		String uploadFolder = "c:\\upload";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		File uploadPath = new File(uploadFolder, datePath);
		
		
		// 폴더 생성  경로 -> c:upload:temp:년:월:일 , 해당 날짜의 파일이 존재하는지 확인하고 없으면 새로운 파일 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<OnedayClassVO> list = new ArrayList<OnedayClassVO>();
		
		for (MultipartFile multipartFile : uploadFile ) {
			
			// 이미지 정보 객체
			OnedayClassVO vo = new OnedayClassVO();
			
			// 파일이름
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// uuid 적용 파일 이름   /  uuid란 범용 고유 식별자
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName; // 그냥 파일 이름
			
			// 파일 위치, 파일 이름을 합친 File 객체
			File saveFile = new File(uploadPath, uploadFileName);
			 
			// 파일 저장
			try {
				multipartFile.transferTo(saveFile);
				
				// 방법1
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); // 파일 썸네일 이름
				vo.setoImg(datePath.toString() + "/s_" + uploadFileName);
				BufferedImage bo_image = ImageIO.read(saveFile);  //buffered original image
				
				// 비율 
				double ratio = 3;
				
				// 넓이 , 높이
				int width = (int)(bo_image.getWidth() / ratio); // 형변환
				int height  = (int)(bo_image.getHeight() / ratio); // 형변환
				
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
				
				Graphics2D graphic = bt_image.createGraphics();
				graphic.drawImage(bo_image, 0, 0, width, height, null);
				// 1. 그려놓고자 하는 이미지  2. x값  3. y값  4. 넓이 5. 높이 6. ImageObserver 객체(이미지 업데이트 시키는 역할  일반적으로 null)
				
				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<OnedayClassVO>> result = new ResponseEntity<List<OnedayClassVO>>(list, HttpStatus.OK);
		System.out.println("result : " + result);
		return result;
	}
	
	
	// 이미지 화면 출력
	@GetMapping("/display.do")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName) {
		System.out.println("getImage()..............");
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("content-type", Files.probeContentType(file.toPath()));
			
			//result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); //여기서 오류
			
		} catch (IOException e) {
			e.printStackTrace();
		
		}
		return result;
	}

	
	// 이미지 파일 삭제
	
	@PostMapping("/deleteFile.do")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName) {
		File file = null;
		System.out.println("deleteFiledo 파일이름 : " + fileName);
		try {
			
			// 썸네일 파일 삭제
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			// 원본 파일 삭제
			String originFileName =  file.getAbsolutePath().replace("s_", "");
			file = new File(originFileName);
			file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}	
		
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	//Summernote API 사용시 업로드된 이미지 파일정보 받아오는 ajax
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "c:\\summernote_image\\";  //외부경로로 저장을 희망할 때 
		
		//내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		System.out.println("contextRoot : " + contextRoot);
		//String fileRoot = contextRoot + "resource/fileupload/";
		
		System.out.println("fileRoot : " + fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();  //오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));  //파일 확장자
		String savedFileName = UUID.randomUUID() + extension;  //저장될 파일명
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);  //파일저장
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/summernote_image/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
			
		} catch (IOException e){
			FileUtils.deleteQuietly(targetFile);  //저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println("jsonObject : " + a);
		return a;
	}
	
	// 글상세조회
	@RequestMapping("/getClass.do")
	@ResponseBody
	public OnedayClassVO getClass(OnedayClassVO vo, Model model) {
		OnedayClassVO oneday = onedayService.getClass(vo);
		System.out.println(">>> 게시글 상세 보여주기 vo : " + oneday);
		model.addAttribute("oneday", oneday);
		return oneday;
	}
	
	// 글전체목록
	@RequestMapping("/getClassList.do")
	public String getClassList(Model model) {
		System.out.println(">> CONTROLLER getClassList.do 실행");
		List<OnedayClassVO> classList = onedayService.getClassList();
		model.addAttribute("classList", classList);
		return "/views/management/mgmtInfo/onedayclass/odcInfo.jsp";
	}
	
	// (관리자) 원데이 클래스 예약 상세 내역 조회
	@RequestMapping("/getRsv.do")
	@ResponseBody
	public List<OReservationVO> getRsv(OReservationVO vo, Model model) {
		System.out.println(">>> 원데이 예약 상세 내역 조회 : " + vo);
		List<OReservationVO> rsv = rsvService.getRsv(vo);
		System.out.println("rsv : " + rsv);
		model.addAttribute("rsv", rsv);
		return rsv;
	}
	
	
	// 글수정
	// (관리자) 원데이 클래스 정보 수정
		@RequestMapping("/updateClass.do")
		public String updateClass(@ModelAttribute("oneday") OnedayClassVO vo) {
			System.out.println(">>> 게시글 수정 : " + vo);
			
			onedayService.updateClass(vo);
			return "redirect:getClassList.do";
		}	
		
		// (관리자) 원데이 클래스 정보 삭제
		@RequestMapping("/deleteClass.do")
		public String deleteClass(OnedayClassVO vo) {
			System.out.println(">>> 게시글 삭제");
			onedayService.deleteClass(vo);
			return "redirect:getClassList.do";
		}
	
		
		@RequestMapping("/getRsvList.do")
		public String getRsvList(OReservationVO vo, Model model) {
			System.out.println("예약 전체 리스트 조회");
			if(vo.getOrDate() != null) {
				vo.setOrDate(vo.getOrDate().replace("-", "/"));
			}
			
			if(vo.getmName() == null) {vo.setmName("");}
			if(vo.getOrDate() == null) {vo.setOrDate("");}
			if(vo.getoName() == null) {vo.setoName("");}
			System.out.println(">>> 검색조건 : " + vo);
			List<OReservationVO> orList = rsvService.getRsvList(vo);
			model.addAttribute("orList", orList);
			
			return "/views/management/mgmtInfo/onedayclass/odcMain.jsp";
		}
		
		
		// (관리자) 원데이 클래스 예약 내역 조회 (특정일)
		@RequestMapping("/getDayList.do")
		@ResponseBody
		public String getDayList( OReservationVO vo, Model model) {
			System.out.println(">>> 특정일 진행 사항 출력");
			List<OReservationVO> dayList = rsvService.getDayList(vo);
			System.out.println("dayList : " + dayList);
			
			String json = new Gson().toJson(dayList);
			System.out.println("제이슨 결과2 = " + json);
			return json;
		}
		
	//--------------------------------------------------------------------------------
	// 힐링메인전체목록
	@RequestMapping("/healingMain.do")
	public String healingList(Model model) {
		System.out.println(">>> 힐링 카테고리 목록 보여주기");
		List<OnedayClassVO> healingList = onedayService.getClassList();
		model.addAttribute("healingList", healingList);
		return "healingMain.jsp";
	}
	
	// 액티비티메인전체목록
	@RequestMapping("/activityMain.do")
	public String activityList(Model model) {
		System.out.println(">>> 액티비티 카테고리 목록 보여주기");
		List<OnedayClassVO> activityList = onedayService.getClassList();
		model.addAttribute("activityList", activityList);
		return "activityMain.jsp";
	}
			
	// diy메인전체목록
	@RequestMapping("/diyMain.do")
	public String diyList(Model model) {
		System.out.println(">>> DIY 카테고리 목록 보여주기");
		List<OnedayClassVO> diyList = onedayService.getClassList();
		model.addAttribute("diyList", diyList);
		return "diyMain.jsp";
	}
	
	// 클래스 상세 정보페이지
	@RequestMapping("/classInfo.do")
	public String classInfo(OnedayClassVO vo, Model model) {
		System.out.println(">>> 클래스 예약페이지 보여주기 ");
		OnedayClassVO classvo = onedayService.getClass(vo);
		System.out.println(":: classInfo classvo : " + classvo);
		model.addAttribute("oneday", classvo); //Model 객체 사용 View로 데이터 전달
		rsvService.deleteRsv();
		return "deleteRsv.do";
	}
	
	
	//--------------------------------------------------------------------------------
	// 결제된 수량 조회
	@RequestMapping("/restCnt.do")
	@ResponseBody
	public int restCnt(@RequestBody Map<String, String> param) {
		System.out.println("param" + param);
		String result = onedayService.restCnt(param);
		System.out.println("result : " + result);
		if(result == null) {
			result = "0";
		}
		return Integer.parseInt(result);
	}
	
	//--------------------------------------------------------------------------------
	
	// 예약
	@RequestMapping("/insertRsv.do")
	public String insertRsv(Model model, OReservationVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 예약하기");
		System.out.println("insert vo : " + vo);
		rsvService.insertRsv(vo);
		model.addAttribute("rsv", vo);
		
		return "redirect:odcpayment.jsp";
	}
	
	
	// 결제 안된 예약 삭제
	 @RequestMapping("/deleteRsv.do") 
	 public String deleteRsv() {
		 System.out.println("예약 목록 정리 성공"); 
		 return "classInfo.jsp"; 
	 }
	 
	//--------------------------------------------------------------------------------
	 
	// 결제
	@RequestMapping("/insertPayment.do")
	@ResponseBody
	public int insertPayment(@RequestBody OPaymentVO vo, Model model) throws IllegalStateException, IOException {
		System.out.println(">>> 결제하기");
		System.out.println("insert vo : " + vo);
		int result = paymentService.insertPayment(vo);
		model.addAttribute("pay", vo);
		return result;
	}

	//--------------------------------------------------------------------------------
	
	   @RequestMapping("/rsvRefund.do")
	   @Transactional(rollbackFor = Exception.class) 
	   public String reserRefund(@RequestParam String orIdx, @RequestParam int orfMoney, HttpSession session) {
	      int result = 0;
	      System.out.println(orIdx +", "+ orfMoney);
	      
	      // 사용한 적립금 가져오기
	      int point = paymentService.getOpoint(orIdx);
	      System.out.println("point : " + point);
	      
	      // 총 결제 금액 환불하기
	      ORefundVO vo = new ORefundVO();
	      vo.setOrfMoney(orfMoney - point);
	      vo.setOrIdx(orIdx);
	      System.out.println(vo);
	      
	      // 환불 insert
	      result = refundService.insertRefund(vo);
	      
	      // 예약 내역 삭제
	      //rsvService.deleteRsvVO(orIdx);
	      
	      // 적립금 다시 돌려주기 (지우면 안됨 )
//	      rewarvo.setMemberId(uservo.getMemberId());
//	      rewarvo.setRe_category("클래스 예약");
//	      rewarvo.setPoint(price);
//	      
//	      rewardService.insertReward(rewarvo);
	      
	      
	      System.out.println(result);
	      return "onedayCancel.do";
	   }
	 

	
}
