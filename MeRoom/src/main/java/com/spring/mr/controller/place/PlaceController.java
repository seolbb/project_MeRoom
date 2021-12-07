 package com.spring.mr.controller.place;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import com.google.gson.JsonObject;
import com.spring.mr.service.place.PlaceService;
import com.spring.mr.vo.place.PlaceVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@SessionAttributes("place")
public class PlaceController {
	@Autowired
	private PlaceService PlaceService;
	
	public PlaceController() {
		System.out.println(">> PlaceController() 객체 생성");
	}
	
	
//	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
//	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행된다.
//	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		System.out.println("--->> Map searchConditionMap() 실행");
//		Map<String, String> conditionMap = new HashMap<String, String>();
//		conditionMap.put("제목", "PTITLE");
////		conditionMap.put("내용", "CONTENT");
//		return conditionMap;
//	}
	
	@RequestMapping("/insertPlace.do")
	public String insertPlace(PlaceVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 장소 입력");
		System.out.println("insert vo : " + vo);
		PlaceService.insertPlace(vo);
		
		//return "redirect:getPlaceList.do";
		return "redirect:getPlaceListAdmin.do";
	}
	
	
	@RequestMapping("/updatePlace.do")
	public String updatePlace(@ModelAttribute("place") PlaceVO vo) {
		System.out.println(">> 장소 수정");
		System.out.println("update vo : " + vo);
		PlaceService.updatePlace(vo);
		
		return "redirect:getPlaceListAdmin.do";
	}
	
	// 장소 삭제
	@RequestMapping("/deletePlace.do")
	public String deletePlace(PlaceVO vo) {
		System.out.println(">> 장소 삭제");
		System.out.println("delete vo : " + vo);
		PlaceService.deletePlace(vo);
		
		return "redirect:getPlaceListAdmin.do";
	}
	
	
	@RequestMapping("/getPlaceList.do")
	public String getPlaceList(PlaceVO vo, Model model) {
		System.out.println("장소목록 전체 보여주기");
		System.out.println("getPlaceList vo : " +  vo);
		List<PlaceVO> placeList = PlaceService.getPlaceList(vo);
		System.out.println("placeList vo : " + placeList);
		
		model.addAttribute("placeList", placeList);
		
		return "place.jsp";
		//return "updateTest.jsp";
		//return "getPlaceList.jsp";
	}
	
	// 관리자 전체 목록
	@RequestMapping("/getPlaceListAdmin.do")
	public String getPlaceListAdmin(Model model) {
		System.out.println("장소목록 전체 보여주기");
		List<PlaceVO> placeList = PlaceService.getPlaceList();
		System.out.println("placeList vo : " + placeList);
		
		model.addAttribute("placeList", placeList);
		
		return "/views/information/branch/place/placeMain.jsp";
	}
	
	@RequestMapping("/getPlace.do")
	public String getPlace(PlaceVO vo, Model model) {
		System.out.println("장소상세보여주기");
		System.out.println("getPlace vo : " + vo);
		PlaceVO place = PlaceService.getPlace(vo);
		System.out.println("getPlace vo : " + vo);
		
		model.addAttribute("place", place); // Model 객체 사용  view로 전달
		
		return "updatePlace.jsp";
	}
	
	
	
	
	@RequestMapping("/getJsonPlace.do")
	@ResponseBody
	public PlaceVO getJsonPlace(@RequestBody PlaceVO vo) { // @RequestBody post방식 전달데이터 처리
		System.out.println(">> getJsonPlace() vo : " + vo);
		PlaceVO place = PlaceService.getPlace(vo);
		System.out.println("getJsonPlace() place : " + place);
		
		return place;
		
	}
	
	
	
	// ---------------------------------------------------------------------------------------
	// 멀티파트
	
	
	@PostMapping(value = "/uploadAjaxAction2.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	//public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {
	public ResponseEntity<List<PlaceVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
//		// 이미지 파일 체크
//		for (MultipartFile multipartFile : uploadFile) {
//			File checkfile = new File(multipartFile.getOriginalFilename());
//			String type = null;
//			
//			try {
//				type = Files.probeContentType(checkfile.toPath());
//				System.out.println("MIME TYPE : "  +type);
//				
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			if (!type.startsWith("image")) {
//				
//				//List<AttachImageVO> list = null;
//			}
//			
//			
//		}
		
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
		
		List<PlaceVO> list = new ArrayList<PlaceVO>();
		
		for (MultipartFile multipartFile : uploadFile ) {
			
			// 이미지 정보 객체
			PlaceVO vo = new PlaceVO();
			
			// 파일이름
			String uploadFileName = multipartFile.getOriginalFilename();
//			 vo.setFileName(uploadFileName);
//			 vo.setUploadPath(datePath);
			
			// uuid 적용 파일 이름   /  uuid란 범용 고유 식별자
			String uuid = UUID.randomUUID().toString();
//			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName; // 그냥 파일 이름
			
			// 파일 위치, 파일 이름을 합친 File 객체
			File saveFile = new File(uploadPath, uploadFileName);
			 
			// 파일 저장
			try {
				multipartFile.transferTo(saveFile);
				
				// 방법1
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); // 파일 썸네일 이름
//				vo.setThumbnail(datePath.toString() + "s+" + uploadFileName);
//				vo.setPfile(datePath.toString() + "/s_" + uploadFileName);
				vo.setPfilepath(datePath.toString() + "/s_" + uploadFileName);
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
				
				
				// 방법 2
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);				
//				Thumbnails.of(saveFile)
//				.size(160, 160)
//				.toFile(thumbnailFile);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<PlaceVO>> result = new ResponseEntity<List<PlaceVO>>(list, HttpStatus.OK);
		System.out.println("result : " + result);
		return result;
	}
	
	
	// 이미지 화면 출력
	// 이미지 화면 출력
		@GetMapping("/display2.do")
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
	
		@PostMapping("/deleteFile2.do")
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
	
	
	//--------------------------------------------------------------------------
	
	//	Summernote API 사용시 업로드된 이미지 파일정보 받아오는 ajax
		@RequestMapping(value="/uploadSummernoteImageFile2.do", produces="application/json; charset=utf-8")
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
	
	
	
	
	
}
