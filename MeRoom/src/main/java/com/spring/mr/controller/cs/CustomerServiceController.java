package com.spring.mr.controller.cs;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.spring.mr.controller.user.UserController;
import com.spring.mr.service.cs.AnswerService;
import com.spring.mr.service.cs.EventService;
import com.spring.mr.service.cs.FAService;
import com.spring.mr.service.cs.NewsService;
import com.spring.mr.service.cs.PromotionService;
import com.spring.mr.service.cs.QuestionService;
import com.spring.mr.vo.cs.AnswerVO;
import com.spring.mr.vo.cs.EventVO;
import com.spring.mr.vo.cs.FAVO;
import com.spring.mr.vo.cs.NewsVO;
import com.spring.mr.vo.cs.PromotionVO;
import com.spring.mr.vo.cs.QuestionVO;
import com.spring.mr.vo.user.UserVO;

@Controller
@SessionAttributes({ "answer","event","eventList","fa","faList", "news", "newsList", "promotion", "promotionList",
		"question"})
public class CustomerServiceController {

	@Autowired
	private AnswerService answerService;
	@Autowired
	private EventService eventService;
	@Autowired
	private FAService faService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private PromotionService promotionService;
	@Autowired
	private QuestionService questionService;
	
	
	

	public CustomerServiceController() {
		System.out.println("CustomerServiceController() 객체 실행 ");
	}

	
	
	
	//답변 상세 조회
	
	@RequestMapping("/getAnswer.do")
	public String getAnswer(AnswerVO vo, Model model) {

		System.out.println(">>답변 상세 보여주기");
		AnswerVO answer = answerService.getAnswer(vo);
		System.out.println("::getAnswer answer : " + answer);
		model.addAttribute("answer", answer);
		return "answerdetail.jsp";

	}

	//답변 전체 목록 
	
	@RequestMapping("/getAnswerList.do")
	public String getAnswerList(AnswerVO vo, Model model) {
		System.out.println(">>답변 목록 보여주기");
		System.out.println(":: getAnswerList() vo :" + vo);

		List<AnswerVO> answerList = answerService.getAnswerList();

		model.addAttribute("answerList", answerList);
		return "answerlist.jsp";

	}

	//답변 등록 
	
	@RequestMapping("/insertAnswer.do")
	public String insertAnswer(AnswerVO vo)  {
		System.out.println(">>답변 입력 vo : " + vo);
		int insertResult = answerService.insertAnswer(vo);
		if (insertResult == 1) {
			System.out.println("답변 입력 완료");
			QuestionVO qvo = new QuestionVO();
			qvo.setqIdx(vo.getqIdx2());
			qvo.setqYn("Y");
			questionService.updateQuestionStatus(qvo);
			
		}
		return "redirect:/getQuestionList.do";
	}

	//답변 수정 
	
	
	@RequestMapping("/updateAnswer.do")
	public String updateAnswer (@ModelAttribute("answer") AnswerVO vo) {
		 
		System.out.println(">>> 답변 수정");
		System.out.println("update vo : " +vo);
		answerService.updateAnswer(vo);
		 return "getAnswerList.do"; 
	}

	//답변 삭제 
	
	
	@RequestMapping("/deleteAnswer.do")
	public String deleteAnswer( AnswerVO vo) {
	    System.out.println(">>> 답변 삭제");
	    answerService.deleteAnswer(vo);
	    return "getAnswerList.do";
		
		
	}
	
	//-----------event ----------------
	//이벤트 게시글 상세 조회 
	
	@RequestMapping("/getJsonAnswer.do")
	@ResponseBody
	public AnswerVO getJsonAnswer(@RequestBody AnswerVO vo) { //@RequestBody post방식 전달 데이터 처리
		System.out.println("getJsonAnswer() vo : " + vo);
		AnswerVO answer = answerService.getAnswer(vo);
		System.out.println("getJsonAnswer() answer : " + answer);
			   
		return answer;
	}
	
	
	@RequestMapping("/getEvent.do")
	public String getEvent(EventVO vo, Model model) {

		System.out.println(">>게시글 하나 상세 보여주기");
		EventVO event = eventService.getEvent(vo);
		System.out.println("::getEvent event : " + event);

		model.addAttribute("event", event);
		return "eventdetail.jsp";
	}
	
	// (관리자) 이벤트 게시글 상세 조회  
	@RequestMapping("/getEventAdmin.do")
	@ResponseBody
	public EventVO getEventAdmin(EventVO vo, Model model) {

		System.out.println(">>게시글 하나 상세 보여주기");
		EventVO event = eventService.getEvent(vo);
		System.out.println("::getEvent event : " + event);

		model.addAttribute("event", event);
		return event;
	}

	//이벤트 전체 목록
	@RequestMapping("/getEventList.do")
	public String getEventList(EventVO vo, Model model) {
		System.out.println(">>게시글 전체 목록 보여주기");
		System.out.println(":: getEventList() vo : ");

		List<EventVO> eventList = eventService.getEventList();

		model.addAttribute("eventList", eventList);
		return "eventlist.jsp";

	}
	
	// (관리자) 이벤트 전체 목록 
	@RequestMapping("/getEventListAdmin.do")
	public String getEventListAdmin(EventVO vo, Model model) {
		System.out.println(">>게시글 전체 목록 보여주기");
		System.out.println(":: getEventList() vo " + vo);

		List<EventVO> eventList = eventService.getEventList(vo);

		model.addAttribute("eventList", eventList);
		return "/views/management/mgmtInfo/event/eventMain.jsp";

	}

	// (관리자) 이벤트 게시글 등록
	@RequestMapping("/insertEvent.do")
	public String insertEvent(EventVO vo) throws IllegalStateException, IOException {
		System.out.println(">>게시글 입력");
		System.out.println("vo : " + vo);


		eventService.insertEvent(vo);
		return "redirect:getEventList.do";
	}
	
	// (관리자) 이벤트 게시글 수정
	@RequestMapping("/updateEvent.do")
	public String updateEvent(@ModelAttribute("event") EventVO vo) {

		System.out.println(">>> 게시글 수정");
		System.out.println("update vo : " + vo);
		eventService.updateEvent(vo);
		return "redirect:getEventList.do";

	}

	// (관리자) 이벤트 게시글 삭제 
	@RequestMapping("/deleteEvent.do")
	public String deleteEvent(EventVO vo) {

		System.out.println(">>> 게시글 삭제");
		eventService.deleteEvent(vo);
		return "redirect:getEventList.do";

	}

	// (관리자) 이벤트 등록 시 사진 업로드 
	@PostMapping(value = "/AjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<EventVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		System.out.println("uploadAjaxAction.do로 들어옴");

		
		String uploadFolder = "c:\\eventupload";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", "\\\\");
		File uploadPath = new File(uploadFolder, datePath);
		
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<EventVO> list = new ArrayList<EventVO>();
		
		for (MultipartFile multipartFile : uploadFile ) {
			
			EventVO vo = new EventVO();
			
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
				
				// 방법
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); // 파일 썸네일 이름
				vo.setEvThumbnail(datePath.toString() + "/s_" + uploadFileName);
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
		ResponseEntity<List<EventVO>> result = new ResponseEntity<List<EventVO>>(list, HttpStatus.OK);
		System.out.println("result : " + result);
		return result;
	}
	
	
	
	// (관리자) 이벤트 등록 시 이미지 화면 출력  
	@GetMapping("/screenoutput.do")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName) {
		System.out.println("getImage()..............");
		
		File file = new File("c:\\eventupload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("content-type", Files.probeContentType(file.toPath()));			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); //여기서 오류
			
		} catch (IOException e) {
			e.printStackTrace();
		
		}
		return result;
	}

	
	// 이미지 파일 삭제
	
	// (관리자) 이벤트 등록 시 이미지 파일 삭제
		@PostMapping("/deleteImageFile.do")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName) {
			File file = null;
			System.out.println("deleteFiledo 파일이름 : " + fileName);
			try {
				
				// 썸네일 파일 삭제
				file = new File("c:\\eventupload\\" + URLDecoder.decode(fileName, "UTF-8"));
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
	
	//	Summernote API 사용시 업로드된 이미지 파일정보 받아오는 ajax
		@RequestMapping(value="/ImageFile.do", produces="application/json; charset=utf-8")
		@ResponseBody
		public String ImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
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
	   
	 
	
	
	//--------자주 묻는 질문 -----------
	//자주 묻는 질문 게시글 하나 상세 보기 
	@RequestMapping("/getFA.do")
	public String getFA(FAVO vo, Model model) {

		System.out.println(">>자주묻는 질문 상세 보기");
		FAVO fa = faService.getFA(vo);
		System.out.println("::getFA fa : " + fa);

		model.addAttribute("fa", fa);
		return "supportdetail.jsp";
	}

	// (관리자) 자주 묻는 질문 게시글 하나 상세 보기  
	@RequestMapping("/getFAAdmin.do")
	@ResponseBody
	public FAVO getFAAdmin(FAVO vo ,Model model) {
		
		System.out.println(">>자주묻는 질문 상세 보기");
		FAVO fa = faService.getFA(vo);
		System.out.println("::getFA fa : " + fa);
		
		model.addAttribute("fa", fa); 
		return fa;
	}
	
	//자주 묻는 질문 게시글 전체 조회
	@RequestMapping("/getFAList.do")
	public String getFAList(Model model) {
		System.out.println(">>자주묻는 질문 전체 목록");

		List<FAVO> faList = faService.getFAList();

		model.addAttribute("faList", faList);
		return "support.jsp";

	}

	
	// (관리자) 자주 묻는 질문 전체 목록	
	@RequestMapping("/getFAListAdmin.do")
	public String getFAListAdmin(Model model) {
		System.out.println(">>자주묻는 질문 전체 목록");
		
		List<FAVO> faList = faService.getFAList();
		
		model.addAttribute("faList", faList);
		return "/views/management/mgmtInfo/faq/FAQMain.jsp";

	}
	
	// (관리자) 자주 묻는 질문 등록
	@RequestMapping("/insertFA.do")
	public String insertFA(FAVO vo) throws IllegalStateException, IOException {

		System.out.println(">>자주묻는 질문 입력");
		System.out.println("vo : " + vo);
		
		faService.insertFA(vo);
		return "redirect:getFAListAdmin.do";
	}

	@RequestMapping("/updateFA.do")
	public String updateFA (@ModelAttribute("fa") FAVO vo) {
		 
		System.out.println(">>> 자주묻는 질문 수정");
		System.out.println("update vo : " +vo);
		faService.updateFA(vo);
         return "redirect:getFAListAdmin.do";
		
	}
	
	// (관리자) 자주묻는 질문 삭제
	@RequestMapping("/deleteFA.do")
	public String deleteFA( FAVO vo) {
		 
	    System.out.println(">>> 자주묻는 질문 삭제");
	    faService.deleteFA(vo);
 		return "redirect:getFAListAdmin.do";
		
		
	}

	// Summernote API 사용시 업로드된 이미지 파일정보 받아오는 ajax
	@RequestMapping(value = "/Fileupload.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Fileupload(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		System.out.println("controller 들어옴");

		String fileRoot = "c:\\summernote_image\\"; // 외부경로로 저장을 희망할 때

		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		System.out.println("contextRoot : " + contextRoot);
		// String fileRoot = contextRoot + "resource/fileupload/";

		System.out.println("fileRoot : " + fileRoot);

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일저장
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/summernote_image/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println("jsonObject : " + a);
		return a;
	}
	
	
	//-------news ---------------
	//뉴스 게시글 하나 상세 조회
	@RequestMapping("/getNews.do")
	public String getNews(NewsVO vo, Model model) {

		System.out.println(">>게시글 하나 상세 보여주기");
		NewsVO news = newsService.getNews(vo);
		System.out.println("::getNews news : " + news);

		model.addAttribute("news", news);
		return "newsdetail.jsp";
	}
	
	// (관리자) 뉴스게시글 하나 상세 조회
	@RequestMapping("/getNewsAdmin.do")
	@ResponseBody
	public NewsVO getNewsAdmin(NewsVO vo, Model model) {
		System.out.println(">>게시글 하나 상세 보여주기");
		NewsVO news = newsService.getNews(vo);
		System.out.println("::getNews news : " + news);
		model.addAttribute("news", news);
		
		return news;
	}
	
	

	//뉴스 게시글 전체 목록 조회 
	@RequestMapping("/getNewsList.do")
	public String getNewsList(NewsVO vo, Model model) {
		System.out.println(">>게시글 전체 목록 보여주기");
		System.out.println(":: getNewsList() vo " + vo);

		List<NewsVO> newsList = newsService.getNewsList(vo);

		model.addAttribute("newsList", newsList);
		return "newslist.jsp";

	}
	
	@RequestMapping("/getNewsListAdmin.do")
	public String getNewsListAdmin(Model model) {
		System.out.println(">>게시글 전체 목록 보여주기");
		List<NewsVO> newsList = newsService.getNewsList();
		model.addAttribute("newsList", newsList);
		return "/views/management/mgmtInfo/news/newsMain.jsp";

	}
	
	
	// (관리자) 뉴스 게시글 등록 
		@RequestMapping("/insertNews.do")
		public String insertNews(NewsVO vo) throws IllegalStateException, IOException {

			System.out.println(">>게시글 입력");
			System.out.println("vo : " + vo);


			newsService.insertNews(vo);
			return "redirect:getNewsListAdmin.do";
		}

	//뉴스 게시글 수정 
		@RequestMapping("/updateNews.do")
		public String updateNews(@ModelAttribute("news") NewsVO vo) {

			System.out.println(">>> 게시글 수정");
			System.out.println("update vo : " + vo);
			newsService.updateNews(vo);
			return "redirect:getNewsListAdmin.do";

		}
		
		// (관리자) 뉴스 게시글 삭제 
		@RequestMapping("/deleteNews.do")
		public String deleteNews(NewsVO vo) {

			System.out.println(">>> 게시글 삭제");
			newsService.deleteNews(vo);
			return "redirect:getNewsListAdmin.do";

		}
	
	
	
		// (관리자) 뉴스 게시물 등록 시 사진 업로드
		@PostMapping(value = "/uploadAjaxPOST.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<NewsVO>> uploadAjaxPOST(MultipartFile[] uploadFile) {
			System.out.println("uploadAjaxAction.do로 들어옴");

			
			String uploadFolder = "c:\\newsupload";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			String datePath = str.replace("-", "\\\\");
			File uploadPath = new File(uploadFolder, datePath);
			
			
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			
			List<NewsVO> list = new ArrayList<NewsVO>();
			
			for (MultipartFile multipartFile : uploadFile ) {
				
				NewsVO vo = new NewsVO();
				
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
					
					// 방법
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); // 파일 썸네일 이름
					vo.setNeThumbnail(datePath.toString() + "/s_" + uploadFileName);
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
			ResponseEntity<List<NewsVO>> result = new ResponseEntity<List<NewsVO>>(list, HttpStatus.OK);
			System.out.println("result : " + result);
			return result;
		}
	
	
		// (관리자)  뉴스 등록 시 이미지 화면 출력
		@GetMapping("/screenplay.do")
		@ResponseBody
		public ResponseEntity<byte[]> getThumbnail(String fileName) {
			System.out.println("getThumbnail()..............");
			
			File file = new File("c:\\newsupload\\" + fileName);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				
				header.add("content-type", Files.probeContentType(file.toPath()));			
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); 
				
			} catch (IOException e) {
				e.printStackTrace();
			
			}
			return result;
		}

	
	// 이미지 파일 삭제
	
		// (관리자) 뉴스 등록 시 이미지 파일 삭제 
		@PostMapping("/deleteThumbnail.do")
		@ResponseBody
		public ResponseEntity<String> deleteImageFile(String fileName) {
			File file = null;
			System.out.println("deleteFilefo 파일이름 : " + fileName);
			try {
				
				// 썸네일 파일 삭제
				file = new File("c:\\newsupload\\" + URLDecoder.decode(fileName, "UTF-8"));
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
	
	

		
		// (관리자) 뉴스 등록 썸머노트 사진 등록 
		@RequestMapping(value = "/uploadImageFile.do", produces = "application/json; charset=utf-8")
		@ResponseBody
		public String uploadImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
			JsonObject jsonObject = new JsonObject();

			System.out.println("controller 들어옴");

			String fileRoot = "c:\\summernote_image\\"; // 외부경로로 저장을 희망할 때

			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			System.out.println("contextRoot : " + contextRoot);
			// String fileRoot = contextRoot + "resource/fileupload/";

			System.out.println("fileRoot : " + fileRoot);

			String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
			File targetFile = new File(fileRoot + savedFileName);

			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일저장
				// contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("url", "/summernote_image/" + savedFileName);
				jsonObject.addProperty("responseCode", "success");

			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			System.out.println("jsonObject : " + a);
			return a;
		}

	
	
	
	
	//--------프로 모션 -----------
	
	//프로모션 게시글 하나 조회 
	@RequestMapping("/getPromotion.do")
	public String getPromotion(PromotionVO vo, Model model) {

		System.out.println(">>게시글 하나 상세 보여주기");
		PromotionVO promotion = promotionService.getPromotion(vo);
		System.out.println("::getPromotion promotion : " + promotion);

		model.addAttribute("promotion", promotion);
		return "promotiondetail.jsp";
	}
	
	// (관리자) 프로모션 게시글 하나 조회 
	@RequestMapping("/getPromotionAdmin.do")
	@ResponseBody
	public PromotionVO getPromotionAdmin(PromotionVO vo, Model model) {

		System.out.println(">>게시글 하나 상세 보여주기");
		PromotionVO promotion = promotionService.getPromotion(vo);
		System.out.println("::getPromotion promotion : " + promotion);

		model.addAttribute("promotion", promotion);
		return promotion;
	}

	//프로모션 전체 목록 
	@RequestMapping("/getPromotionList.do")
	public String getPromotionList(PromotionVO vo, Model model) {
		System.out.println(">>게시글 전체 목록 보여주기");
		System.out.println(":: getPromotionList() : ");

		List<PromotionVO> promotionList = promotionService.getPromotionList();

		model.addAttribute("promotionList", promotionList);
		return "promotionlist.jsp";

	}
	
	// (관리자) 프로모션 전체 목록 
		@RequestMapping("/getPromotionListAdmin.do")
		public String getPromotionListAdmin(PromotionVO vo, Model model) {
			System.out.println(">>게시글 전체 목록 보여주기");
			System.out.println(":: getPromotionList() vo " + vo);

			List<PromotionVO> promotionList = promotionService.getPromotionList(vo);

			model.addAttribute("promotionList", promotionList);
			return "/views/management/mgmtInfo/promotion/promotionMain.jsp";

		}
	
	//프로모션 게시글 등록 
	@RequestMapping("/insertPromotion.do")
	public String insertPromotion(PromotionVO vo) throws IllegalStateException, IOException {

		System.out.println(">>게시글 입력");
		System.out.println("vo : " + vo);

		promotionService.insertPromotion(vo);
		return "redirect:getPromotionListAdmin.do";
	}
	
	//프로모션 게시글 수정
	@RequestMapping("/updatePromotion.do")
	public String updatePromotion(@ModelAttribute("promotion") PromotionVO vo) {

		System.out.println(">>> 게시글 수정");
		System.out.println("update vo : " + vo);
		promotionService.updatePromotion(vo);
		return "redirect:getPromotionListAdmin.do";

	}
	
	//프로모션 게시글 삭제 
	@RequestMapping("/deletePromotion.do")
	public String deletePromotion(PromotionVO vo) {

		System.out.println(">>> 게시글 삭제");
		promotionService.deletePromotion(vo);
		return "redirect:getPromotionListAdmin.do";

	}

	// (관리자) 프로모션 등록 시 사진 업로드
		@PostMapping(value = "/uploadAjax.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<PromotionVO>> uploadAjax(MultipartFile[] uploadFile) {
			System.out.println("uploadAjax.do로 들어옴");

			
			String uploadFolder = "c:\\promotionupload";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			String datePath = str.replace("-", "\\\\");
			File uploadPath = new File(uploadFolder, datePath);
			
			
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			
			List<PromotionVO> list = new ArrayList<PromotionVO>();
			
			for (MultipartFile multipartFile : uploadFile ) {
				
				PromotionVO vo = new PromotionVO();
				
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
					
					// 방법
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); // 파일 썸네일 이름
					vo.setPrThumbnail(datePath.toString() + "/s_" + uploadFileName);
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
			ResponseEntity<List<PromotionVO>> result = new ResponseEntity<List<PromotionVO>>(list, HttpStatus.OK);
			System.out.println("result : " + result);
			return result;
		}
	
	
	// 이미지 화면 출력
	@GetMapping("/pictureplay.do")
	@ResponseBody
	public ResponseEntity<byte[]> getpicture(String fileName) {
		System.out.println("getpicture()..............");
		
		File file = new File("c:\\promotionupload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("content-type", Files.probeContentType(file.toPath()));			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK); 
			
		} catch (IOException e) {
			e.printStackTrace();
		
		}
		return result;
	}

	
	// 이미지 파일 삭제
	
	@PostMapping("/deletepicture.do")
	@ResponseBody
	public ResponseEntity<String> deletepicture(String fileName) {
		File file = null;
		System.out.println("deletepicture 파일이름 : " + fileName);
		try {
			
			// 썸네일 파일 삭제
			file = new File("c:\\promotionupload\\" + URLDecoder.decode(fileName, "UTF-8"));
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
	

	
	// (관리자) 프로모션 등록 시 썸머노트 이미지 등록 
		@RequestMapping(value = "/uploadFile.do", produces = "application/json; charset=utf-8")
		@ResponseBody
		public String uploadFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
			JsonObject jsonObject = new JsonObject();

			System.out.println("controller 들어옴");

			String fileRoot = "c:\\summernote_image\\"; // 외부경로로 저장을 희망할 때

			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			System.out.println("contextRoot : " + contextRoot);
			// String fileRoot = contextRoot + "resource/fileupload/";

			System.out.println("fileRoot : " + fileRoot);

			String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
			File targetFile = new File(fileRoot + savedFileName);

			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일저장
				// contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("url", "/summernote_image/" + savedFileName);
				jsonObject.addProperty("responseCode", "success");

			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			System.out.println("jsonObject : " + a);
			return a;
		}

	
	
	
	//---------일대일 문의 ------------------
	
	//검색 
		// (관리자) 문의글 전체 조회 및 검색 
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			System.out.println("--->>Map searchConditionMap() 실행");
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("제목", "TITLE");
			conditionMap.put("내용", "CONTENT");
			return conditionMap;

		}
		

	
	//문의글 하나 조회 
		// (관리자) 문의글 하나 조회 
		@RequestMapping("/getQuestion.do")
		@ResponseBody
		public QuestionVO getQuestion(QuestionVO vo ,Model model) {
			
			QuestionVO question = questionService.getQuestion(vo);
			System.out.println("question : " + question);
			model.addAttribute("question", question); 
			return question;
		}
	
	@RequestMapping("/getQuestionList.do")
	public String getQuestionList(QuestionVO vo, Model model) {
		if (vo.getAnyTyp() == null) {
				System.out.println("anyTyp is null");
				vo.setAnyTyp("");
			}
		if (vo.getqTitle() == null) { 
			System.out.println("qTitle is null");
				vo.setqTitle(""); 
			}
		if (vo.getqContent() == null) {
			System.out.println("qContent is null");
				vo.setqContent(""); 
			}
		List<QuestionVO> questionList = questionService.getQuestionList(vo);
		System.out.println("qnaList : " + questionList);
		model.addAttribute("questionList", questionList);
		return "/views/management/mgmtInfo/qna/QnAMain.jsp";
	}
	
	//문의글 작성 
	@RequestMapping("/insertQuestion.do")
	public String insertQuestion(QuestionVO vo)  {

		System.out.println(">>일대일 문의 입력");
		System.out.println("vo : " + vo);
		
		questionService.insertQuestion(vo);
		
		return "redirect:qnaList.do";
	}
	

	//문의글 삭제 
	@RequestMapping("/deleteQuestion.do")
	public String deleteQuestion(QuestionVO vo) {
		System.out.println("delete vo : " + vo);
	    System.out.println(">>>일대일 문의 삭제");
	    questionService.deleteQuestion(vo);
 		return "redirect:getQuestionList.do";
	}
	
	

	

}
