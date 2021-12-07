package com.spring.mr.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.mr.service.cs.QuestionService;
import com.spring.mr.service.user.AdminRewardService;
import com.spring.mr.service.user.CoolsmsService;
import com.spring.mr.service.user.MailSendService;
import com.spring.mr.service.user.OnedayStateService;
import com.spring.mr.service.user.ReviewService;
import com.spring.mr.service.user.RewardService;
import com.spring.mr.service.user.RoomStateService;
import com.spring.mr.service.user.UserService;
import com.spring.mr.vo.cs.QuestionVO;
import com.spring.mr.vo.user.AdminRewardVO;
import com.spring.mr.vo.user.OnedayStateVO;
import com.spring.mr.vo.user.ReviewVO;
import com.spring.mr.vo.user.RewardVO;
import com.spring.mr.vo.user.RoomStateVO;
import com.spring.mr.vo.user.UserVO;

@Controller
@SessionAttributes("vo") // vo 라는 이름의 Model 있으면 session에 저장
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
    private MailSendService mailSendService;
	@Autowired
	private RewardService rewardService;
	@Autowired
	private AdminRewardService adRewardService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CoolsmsService smsSendService;
	@Autowired
	private RoomStateService roomStateService; 
	@Autowired
	private OnedayStateService onedayStateService;
	@Autowired
	private QuestionService questionService;
	
	public UserController() {
		System.out.println("UserController 객체 생성");
	}
	
	// 회원가입
	
	
	// (관리자) 회원 상세 조회
		@RequestMapping("/getUser.do")
		public String getUser(UserVO vo, Model model) {
			System.out.println("회원 상세 조회");
			UserVO member =userService.getUser(vo);
			model.addAttribute("member", member);
			return "/views/management/mgmtMember/memberInfo/memberInfo.jsp";
		}
		
		// (관리자) 회원 조회
		@RequestMapping("/getUserList.do")
		public String getUserList(UserVO vo, Model model) {
			System.out.println("회원 전체 목록 조회 : " + vo);
			if (vo.getSearchCondition() == null) { vo.setSearchCondition("MEMBERID");}
			if (vo.getSearchKeyword() == null) { vo.setSearchKeyword("");}
			if (vo.getBeginDate() == null) { vo.setBeginDate("");}
			if (vo.getEndDate() == null) { vo.setEndDate("");}
			System.out.println("회원 전체 목록 조회 : " + vo);
			List<UserVO> uvo = userService.getUserList(vo);
			model.addAttribute("memberList", uvo);
			System.out.println("uvo list : " + uvo);
			return "/views/management/mgmtMember/memberList/memberList.jsp";
		}
		
		// (관리자) 회원등록
		@PostMapping("/signUpAdmin.do")
		public String signUp(UserVO vo) {
			System.out.println("회원 가입 요청 정보 : " + vo);
			userService.insertUser(vo);
			return "redirect:getUserList.do";
		}
		
		
		// (관리자)  문의번호를 통해 회원의 상세 정보 조회
		@RequestMapping("/getUserQna.do")
		public UserVO getQnaUser(int idx) {
			System.out.println("id로 회원 상세 조회 : " + idx);
			return userService.getQnaUser(idx);
		}
		
		
	@PostMapping("/signUp.do")
	@Transactional(rollbackFor = Exception.class) 
	public String signUp(UserVO vo, Model model, HttpSession session) {
		int result = userService.insertUser(vo);
		System.out.println("insert result : " + result); 
		model.addAttribute("vo", vo);
		
		String category = "회원가입";
		AdminRewardVO arvo = adRewardService.getAdReward(category);
		int point = arvo.getReward_num();
		System.out.println("point : "  + point);
		
		
		RewardVO rvo = new RewardVO();
		rvo.setMemberId(vo.getMemberId());
		rvo.setRe_category(category);
		rvo.setPoint(point);
		System.out.println("controller rvo  : " + rvo);
		int rewardResult = rewardService.insertReward(rvo);
		System.out.println("rewardResult : "  + rewardResult);
		
		if (result == 1) {
			return "signUpOk.jsp";
		} else {
			return "signUpFail.jsp";
		}
		
	}
	
	// 소셜 회원가입 - 카카오
	
	@PostMapping("/signUpKakao.do")
	@Transactional(rollbackFor = Exception.class) 
	public String signUpSocial(UserVO vo, Model model, HttpSession session) {
		System.out.println("vo : " + vo);
		String id = (String) session.getAttribute("id");
		vo.setMemberId(id);
		System.out.println("set vo : " + vo);
		int result = userService.insertUser(vo);
		System.out.println("insert result : " + result); 
		
		
		model.addAttribute("vo", vo);
		
		
		String category = "회원가입";
		AdminRewardVO arvo = adRewardService.getAdReward(category);
		int point = arvo.getReward_num();
		System.out.println("point : "  + point);
		
		
		RewardVO rvo = new RewardVO();
		rvo.setMemberId(id);
		rvo.setRe_category(category);
		rvo.setPoint(point);
		int rewardResult = rewardService.insertReward(rvo);
		System.out.println("rewardResult : "  + rewardResult);
		
		if (rewardResult == 1) {
			return "signUpOk.jsp";
		} else {
			return "signUpFail.jsp";
		}
		
	}
	
	// 소셜 회원가입 - 네이버, 구글
	
	@PostMapping("/signUpSocial.do")
	@Transactional(rollbackFor = Exception.class) 
	public String signUpNaver(UserVO vo, HttpSession session) {
		System.out.println("vo : " + vo);
		int result = userService.insertUser(vo);
		System.out.println("insert result : " + result); 
		
		session.setAttribute("vo", vo);
		
		String category = "회원가입";
		AdminRewardVO arvo = adRewardService.getAdReward(category);
		int point = arvo.getReward_num();
		System.out.println("point : "  + point);
		
		
		RewardVO rvo = new RewardVO();
		rvo.setMemberId(vo.getMemberId());
		rvo.setRe_category(category);
		rvo.setPoint(point);
		int rewardResult = rewardService.insertReward(rvo);
		System.out.println("rewardResult : "  + rewardResult);
		
		if (rewardResult == 1) {
			return "signUpOk.jsp";
		} else {
			return "signUpFail.jsp";
		}
		
	}
	
	@PostMapping("/social.do")
	public String signUpNaver(UserVO rvo, Model model, HttpSession session) {
		System.out.println("rvo : " + rvo);
		UserVO vo = userService.checkId(rvo.getMemberId());
		System.out.println("rvo : " + vo);
		//model.addAttribute("vo", vo);
		
		//session.setAttribute("vo", vo);
		if(vo != null) {
			session.setAttribute("vo", vo);
			return "main.jsp";
		} else {
			session.setAttribute("rvo", rvo);
			return "signUpSocial.jsp";
			
		}
		
	}
	

	// 아이디 중복체크
	
	@PostMapping("/idOverlap.do")
	public @ResponseBody String checkId(String memberId) {
		System.out.println("checkId() 메소드 실행");
		System.out.println("memberId : " + memberId);
		UserVO vo = userService.checkId(memberId);
		System.out.println("String checkId () vo : " + vo);
		if (vo != null) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	
	// 로그인
	
	@PostMapping("/login.do")
	public String login(UserVO vo, Model model, HttpSession session) {
		System.out.println("vo : "+ vo);
		UserVO loginMember = userService.login(vo.getMemberId(), vo.getPassword());
		if (loginMember != null) {
			System.out.println("로그인 성공");
			System.out.println("vo: " + loginMember);
			model.addAttribute("vo", loginMember);
			session.setAttribute("vo", vo);
			return "main.jsp";
		} else {
			System.out.println("로그인 실패");
			return "login.jsp";
		}
		
	}
	
	// 회원정보 수정 
	@PostMapping("/modifyUser.do")
	public String updateUser(@ModelAttribute("vo") UserVO vo) {
		System.out.println("updateUser 실행 ");
		System.out.println("UserVO vo 실행 :" + vo);
		int result = userService.updateUser(vo);
		if(result == 1) {
			return "updateOk.jsp";
		} else {
			return "updateFail.jsp";
		}
	}
	
	@PostMapping("/modifyPw.do")
	@ResponseBody
	public String updatePw(@ModelAttribute("vo") UserVO vo) {
		System.out.println("updateUser 실행 ");
		System.out.println("UserVO vo 실행 :" + vo);
		int result = userService.updateUser(vo);
		if(result == 1) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	// 회원탈퇴
	@RequestMapping("/delete.do")
	public String deleteAccount(UserVO vo, SessionStatus status) {
		System.out.println("회원탈퇴 실행");
		System.out.println("vo : " + vo);
		int result = userService.deleteUser(vo);
		System.out.println("result : "  + result);
		if (result == 1) {
			System.out.println("실행 ");
			status.setComplete();
			return "redirect:main.jsp";
		} else {
			return "main.jsp";
		}
	}
	

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		System.out.println("로그아웃 실행");
		session.invalidate();
		status.setComplete();
		//session.invalidate();
		System.out.println("로그아웃 cvsd실행");
		return "redirect:/main.jsp";
	}
	
	// 아이디찾기 - 메일
	
	@PostMapping("/idfindMail.do")
	public @ResponseBody String idFindMail(UserVO vo) {
		System.out.println("idFindMail");
		System.out.println("idFindUserVO vo : " + vo);
		UserVO idFind = userService.idFindMail(vo.getName(), vo.getEmail());
		System.out.println("idFind : " + idFind);
		
		if(idFind != null) {
			String id = idFind.getMemberId();
			System.out.println("id: " + id);
			return id;
		} else {
			return "fail";
		}
	}
	
	// 아이디찾기 - 폰
	@PostMapping("/idfindPhone.do")
	public @ResponseBody String idFindPhone(UserVO vo) {
		System.out.println("idFindPhone");
		System.out.println("idFindPhone vo : " + vo);
		UserVO idFind = userService.idFindPhone(vo.getName(), vo.getPhone());
		System.out.println("idFind : " + idFind);
		if(idFind != null) {
			String id = idFind.getMemberId();
			System.out.println("id: " + id);
			return id;
			 
		} else {
			return "fail";
		}
	}
	
	
	// 비밀번호 재설정 - 메일
	@PostMapping("/pwfind.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class) 
	public String pwFindMail(UserVO vo) {
		System.out.println("pwFindMail");
		System.out.println("pwFindMail vo : " + vo);
		System.out.println("v"+ vo.getName());
		UserVO pwFind = userService.pwFindMail(vo.getMemberId(), vo.getName(), vo.getEmail());
		System.out.println("pwFind : " + pwFind);
		if(pwFind != null) {
			String tempPw = mailSendService.sendTempPwMail(pwFind.getEmail());
			System.out.println("tempPw : "  + tempPw);
			pwFind.setPassword(tempPw);
			System.out.println("pwFind.setPassword(tempPw); : " + pwFind);
			int result = userService.updateUser(pwFind);
			System.out.println("result: " + result);
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	// 비밀번호 재설정 - 폰
	@PostMapping("/pwfindPhone.do")
	@Transactional(rollbackFor = Exception.class) 
	public @ResponseBody String pwFindPhone(UserVO vo, Model model) {
		System.out.println("pwFindPhone");
		System.out.println("pwFindPhone vo : " + vo);
		UserVO pwFind = userService.pwFindPhone(vo.getMemberId(), vo.getName(), vo.getPhone());
		System.out.println("pwFind : " + pwFind);
		if(pwFind != null) {
			String pwd = smsSendService.sendTempSms(pwFind.getPhone());
			System.out.println("pwd : " + pwd);
			pwFind.setPassword(pwd);
			int result = userService.updateUser(pwFind);
			System.out.println("result: " + result);
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	// 메일보내기
    @RequestMapping(value = "/sendMail.do", method = RequestMethod.POST)
    @ResponseBody
    public String sendMail(@RequestParam String email) {
    	String result = mailSendService.sendAuthMail(email);
    	
    	return result;
    }
	
    //------------ 리워드 ------------------
    
    //포인트 적립
    @RequestMapping("/insertReward.do")
    public String insertReward(@ModelAttribute UserVO vo, HttpSession session) {
    	String category = (String) session.getAttribute("category");
    	System.out.println("category: " + category);
    	AdminRewardVO arvo = adRewardService.getAdReward(category);
    	int point = arvo.getReward_num();
    	System.out.println("point : "  + point);
    	
		RewardVO rvo = new RewardVO();
		rvo.setMemberId(vo.getMemberId());
		rvo.setRe_category(category);
		rvo.setPoint(point);
		int result = rewardService.insertReward(rvo);
		
		if (result == 1) {
			return "signUpOk.jsp";
		} else {
			System.out.println("포인트 적립 실패");
			return "signUpFail.jsp";
		}
		
    }
    
    
    @RequestMapping("/reward.do")
    public String getRewardList(HttpSession session, Model model) {
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	String memberId = vo.getMemberId();
    	System.out.println("memberId : " + memberId );
    	List<RewardVO> list = rewardService.getRewardList(memberId);
    	System.out.println("list : " + list);
    	int total = rewardService.totalReward(memberId);
    	System.out.println("total : " + total);
    	model.addAttribute("list", list);
    	model.addAttribute("total", total);
    	return "reward.jsp";
    }

    @RequestMapping("/getRewardList.do")
    @ResponseBody
    public List<RewardVO> getRewardList(UserVO vo, Model model) {
       System.out.println("회원 적립금 내역 확인");
       List<RewardVO> rewardOne = rewardService.getRewardList(vo.getMemberId());
       model.addAttribute("rewardOne", rewardOne);
       return rewardOne;
    }
    //------------------리뷰---------------------

    @RequestMapping("/review.do")
    @Transactional(rollbackFor = Exception.class)
    public String insertReview(ReviewVO rvo, HttpSession session) {
    	System.out.println("review.do");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	System.out.println("vo + " + vo);
    	rvo.setMemberId(vo.getMemberId());
    	System.out.println("rvo : " + rvo);
    
    	int result = reviewService.insertReview(rvo);
    	System.out.println("result : " + result);
    	
    	String category = "숙박 후기 작성";
		AdminRewardVO arvo = adRewardService.getAdReward(category);
		int point = arvo.getReward_num();
		System.out.println("point : "  + point);
		
		
		RewardVO revo = new RewardVO();
		revo.setMemberId(vo.getMemberId());
		revo.setRe_category(category);
		revo.setPoint(point);
		System.out.println("controller revo  : " + revo);
		int rewardResult = rewardService.insertReward(revo);
		System.out.println("rewardResult : "  + rewardResult);
    	
    	return "getReviewList.do";
    }
    
    @RequestMapping("/reviewWriteList.do")
    public String reviewWriteList(HttpSession session, Model model) {
    	System.out.println("roomStateList>> 실행");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	String memberId = vo.getMemberId();
    	System.out.println("memberId :" + memberId);
    	List<RoomStateVO> rlist = roomStateService.reviewStateList(memberId);

    	System.out.println("컨트롤러 reviewList : " + rlist);
    	model.addAttribute("rlist", rlist);
    	return "reviewWriteList.jsp";
    }	
    	
    	
    @RequestMapping("/getReviewList.do")
    public String getReviewList(ReviewVO rvo, HttpSession session, Model model) {
    	System.out.println("getReviewList>> ");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	System.out.println("vo : " + vo);
    	rvo.setMemberId(vo.getMemberId());
    	System.out.println("rvo : " + rvo);
    	List<ReviewVO> reviewList = reviewService.getReviewList(rvo);
    	System.out.println("컨트롤러 reviewList : " + reviewList);
    	model.addAttribute("reviewList", reviewList);
    	return "reviewList.jsp";
    }
    
    @RequestMapping("/getReview.do")
    public String getReview(ReviewVO vo, Model model) {
    	System.out.println("ReviewVO vo: " + vo);
    	ReviewVO rvo = reviewService.getReview(vo);
    	System.out.println("rvo : " + rvo);
    	model.addAttribute("rvo", rvo);
    	return "reviewUpdate.jsp";
    }
    
    @RequestMapping("/reviewUpdate.do")
    public String updateReview(ReviewVO rvo, Model model) {
    	System.out.println("updateReview rvo: " + rvo);
    	int result = reviewService.updateReview(rvo);
    	System.out.println("updateReview result : " + result);
    	return "getReviewList.do";
    }
    
    
    @RequestMapping("/deleteReview.do")
    public String deleteReview(ReviewVO rvo) {
    	System.out.println("deleteReview.do rvo: " + rvo);
    	int result = reviewService.deleteReview(rvo);
    	System.out.println("deleteReview" + result);
    	return "getReviewList.do";
    }
    
    // -----RoomState 숙박예약함-----------------------------
    
    @RequestMapping("/roomState.do")
    public String roomStateList(HttpSession session, Model model) {
    	System.out.println("roomStateList>> 실행");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	String memberId = vo.getMemberId();
    	System.out.println("memberId :" + memberId);
    	List<RoomStateVO> rsList = roomStateService.roomStateList(memberId);
    	System.out.println("rsList + " + rsList);
    	
    	model.addAttribute("rsList", rsList);
    	
    	return "roomState.jsp";
    }
    
    @RequestMapping("/roomPassed.do")
    public String lastRoomStateList(HttpSession session, Model model) {
    	System.out.println("roomStateList>> 실행");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	String memberId = vo.getMemberId();
    	System.out.println("memberId :" + memberId);
    	List<RoomStateVO> lastList = roomStateService.lastRoomStateList(memberId);
    	System.out.println("lastList + " + lastList);
    	
    	model.addAttribute("lastList", lastList);
    	
    	return "roomPassed.jsp";
    }
    
    @RequestMapping("/roomCancel.do")
    public String cancelRoomStateList(HttpSession session, Model model) {
        System.out.println("cancelRoomStateList>> 실행");
       	UserVO vo = (UserVO) session.getAttribute("vo");
       	String memberId = vo.getMemberId();
       	System.out.println("memberId :" + memberId);
       	List<RoomStateVO> cancelList = roomStateService.cancelRoomStateList(memberId);
       	System.out.println("cancelList + " + cancelList);
        	
       	model.addAttribute("cancelList", cancelList);
        	
       	return "roomCancel.jsp";
       }   	
    
    
    // -----OnedayState 원데이 예약함-----------------------------
    
    @RequestMapping("/onedayState.do")
    public String onedayStateList(HttpSession session, Model model) {
    	System.out.println("onedayStateList>> 실행");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	String memberId = vo.getMemberId();
    	System.out.println("memberId :" + memberId);
    	List<OnedayStateVO> oneList = onedayStateService.onedayStateList(memberId);
    	System.out.println("oneList + " + oneList);
    	
    	model.addAttribute("oneList", oneList);
    	
    	return "classState.jsp";
    }
    
    @RequestMapping("/onedayPassed.do")
    public String lastOnedayStateList(HttpSession session, Model model) {
    	System.out.println("lastOnedayStateList>> 실행");
    	UserVO vo = (UserVO) session.getAttribute("vo");
    	String memberId = vo.getMemberId();
    	System.out.println("memberId :" + memberId);
    	List<OnedayStateVO> oneList = onedayStateService.lastOnedayStateList(memberId);
    	System.out.println("oneList + " + oneList);
    	
    	model.addAttribute("oneList", oneList);
    	
    	return "classPassed.jsp";
    }
    
    @RequestMapping("/onedayCancel.do")
    public String cancelOnedayStateList(HttpSession session, Model model) {
        System.out.println("cancelRoomStateList>> 실행");
       	UserVO vo = (UserVO) session.getAttribute("vo");
       	String memberId = vo.getMemberId();
       	System.out.println("memberId :" + memberId);
       	List<OnedayStateVO> oneList = onedayStateService.cancelOnedayStateList(memberId);
       	System.out.println("oneList + " + oneList);
        	
       	model.addAttribute("oneList", oneList);
        	
       	return "classCancel.jsp";
       }   	
    
    //-------------- 1:1 문의 -----------------
    
    @RequestMapping("/qnaList.do")
    public String getQnaList(HttpSession session, Model model) {
    	System.out.println("getQnaList controller >>");
    	UserVO vo = (UserVO) session.getAttribute("vo");
       	String memberId = vo.getMemberId();
       	System.out.println("memberId :" + memberId);
       	List<QuestionVO> qnaList = questionService.getQnaList(memberId);
    	System.out.println("qnaList : " + qnaList);
    	model.addAttribute("qnaList", qnaList);
    	
    	return "myQnA.jsp";
    }
    
    // -------------- 마이페이지 ---------------------
    @RequestMapping("/myPage.do")
    public String myPage(HttpSession session, Model model) {
    	System.out.println("getQnaList controller >>");
    	UserVO vo = (UserVO) session.getAttribute("vo");
       	String memberId = vo.getMemberId();
       	System.out.println("memberId :" + memberId);
       	int total = rewardService.totalReward(memberId);
       	System.out.println("total : " + total);
       	model.addAttribute("total", total);        
       	
        int roomstates = roomStateService.roomStateCount(memberId);
        int lastroom = roomStateService.lastRoomStateCount(memberId);
        int roomcancel = roomStateService.cancelRoomStateCount(memberId);
       	System.out.println("roomstates : " + roomstates);
        System.out.println("roomstates : " + roomstates + "lastroom : " + lastroom + "roomcancel :" + roomcancel);
        model.addAttribute("roomstates", roomstates);        
        model.addAttribute("lastroom", lastroom);        
        model.addAttribute("roomcancel", roomcancel);        
        
        
        int daystates = onedayStateService.onedayStateCount(memberId);
        int daylast = onedayStateService.lastOnedayStateCount(memberId);
        int daycancel = onedayStateService.cancelOnedayStateCount(memberId);
        System.out.println("daystates : " + daystates + "daylast : " + daylast + "daycancel :" + daycancel);
        
        model.addAttribute("daystates", daystates);        
        model.addAttribute("daylast", daylast);        
        model.addAttribute("daycancel", daycancel);        
        
        List<ReviewVO> rvList = reviewService.userReviewList(memberId);
        System.out.println("rvList : " + rvList);
        model.addAttribute("rvList", rvList);        
        
        List<QuestionVO> qnaList = questionService.userQnaList(memberId);
        System.out.println("qnaList : " + qnaList);
        
		model.addAttribute("qnaList", qnaList);        
        
       	return "myPage.jsp";
    }
    
    
}
