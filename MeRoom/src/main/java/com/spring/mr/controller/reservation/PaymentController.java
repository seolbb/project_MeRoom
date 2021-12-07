package com.spring.mr.controller.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mr.service.user.AdminRewardService;
import com.spring.mr.service.user.MailSendService;
import com.spring.mr.service.user.RewardService;
import com.spring.mr.vo.reservation.PaymentService;
import com.spring.mr.vo.reservation.PaymentVO;
import com.spring.mr.vo.reservation.RefundService;
import com.spring.mr.vo.reservation.RefundVO;
import com.spring.mr.vo.reservation.ReservationService;
import com.spring.mr.vo.user.RewardVO;
import com.spring.mr.vo.user.UserVO;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentservice;
	@Autowired
	private AdminRewardService adRewardService;
	@Autowired
	private RewardService rewardService;
	@Autowired
	private RefundService refundService;
	@Autowired
	private ReservationService reservationservice;
	@Autowired
    private MailSendService mailSendService;
	
	
	@PostMapping("/payment.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class) 
	public int insertPayment(@RequestBody PaymentVO vo, HttpSession session) {
		System.out.println(">>> 입력 전 값 확인 " + vo);
		
		int result = paymentservice.insertPay(vo);
		System.out.println(":: Payment vo확인!!!! : " + vo);
		
		vo.getCategory();
		
		vo.getPrice(); //가격
		
		
		int perPoint = adRewardService.getPerPoint(vo.getCategory());
		int price  = (int) Math.ceil(vo.getPrice()*(perPoint * 0.01)); //적립금
		// 구매시 유저하테 적립금 주기
		RewardVO rewarvo = new RewardVO();
		UserVO uservo = (UserVO) session.getAttribute("vo");
		
		
		rewarvo.setMemberId(uservo.getMemberId());
		
		//포인트 사용했을때 차감
		if(vo.getPoint()>0) {
			rewarvo.setRe_category("숙박 예약 사용");
			rewarvo.setPoint(-vo.getPoint());
			rewardService.insertReward(rewarvo);
		}
		
		rewarvo.setRe_category(vo.getCategory());
		rewarvo.setPoint(price);
		rewardService.insertReward(rewarvo);
		
		System.out.println(price);
		
		//이메일 전송
		
		if(result==1) {
			vo.setPoint(vo.getPrice()+price);
			mailSendService.sendReservationMail(uservo.getEmail(),uservo,vo);
		}
		
		session.removeAttribute("reserVO");
		
		
		return result;
	}
	
	
	//환불 
	
	@RequestMapping("/reserRefund.do")
	   @Transactional(rollbackFor = Exception.class) 
	   public String reserRefund(@RequestParam String rIdx,
			   @RequestParam int rfMoney, HttpSession session) {
	      int result = 0;
	      RefundVO rfvo = new RefundVO();
	      rfvo.setrIdx(rIdx);
	      rfvo.setRfInfo("[주문자 취소]환불조건에 따라 환불처리");
	      
	      
	     // int perPoint = adRewardService.getPerPoint("숙박 예약");
	      //System.out.println("perPoint : " + perPoint);
	      //포인트 가져와서 주기
	      
	      int price  = paymentservice.getPoint(rfvo.getrIdx());
	            
	      
	      
	      rfvo.setRfMoney(rfMoney - price);
	      
	      System.out.println(rfvo);
	      
	      //포인트 뺀 금액 환불
	      result = refundService.insertRefund(rfvo);
	      
	      RewardVO rewarvo = new RewardVO();
	      UserVO uservo = (UserVO) session.getAttribute("vo");
	      
	      
	      //포인트 지우기 
	      rewarvo.setMemberId(uservo.getMemberId());
	      rewarvo.setRe_category("숙박 예약 사용");
	      rewarvo.setPoint(price);
	      
	      rewardService.insertReward(rewarvo);
	      
	      
	      //예약 내역 삭제
	      //System.out.println("삭제 예약 번호 : " + rfvo.getrIdx());
	     // reservationservice.reserDelte(rfvo.getrIdx());
	      
	      System.out.println(result);
	      return "roomCancel.do";
	   }
	
	
	
	@GetMapping("/paymentList.do")
	@ResponseBody
	public List<PaymentVO> getPamentList(){
		List<PaymentVO> list = paymentservice.pamentList();
		
		return list;
	}
}
