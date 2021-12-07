package com.spring.mr.service.user;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.reservation.PaymentVO;
import com.spring.mr.vo.user.UserVO;

@Service("mailSendService")
public class MailSendService {
	
    @Autowired
    private JavaMailSenderImpl mailSender;



    //인증메일 보내기
    public String sendAuthMail(String email) {
    	int ran = new Random().nextInt(100000) + 10000;
        //6자리 난수 인증번호 생성
        String authKey = String.valueOf(ran);
        
        //인증메일 보내기
        try {
        	MailHandler sendMail = new MailHandler(mailSender);
            sendMail.setSubject("MEROOM에서 이메일 인증번호 보내드립니다.");
            sendMail.setText(new StringBuffer().append("<p align=\"center\" style=\"text-align: center; \">")
            .append("<span style=\"font-size: 36pt; font-family: arial, sans-serif; color: rgb(0, 158, 37);\">")
            .append("<b><span style=\"color: rgb(1, 91, 40);\"><br></span></b></span></p>")
            .append("<p align=\"center\" style=\"text-align: center; \">")
            .append("<span style=\"font-size: 36pt; font-family: arial, sans-serif; color: rgb(0, 158, 37);\">")
            .append("<b><span style=\"color: rgb(1, 91, 40);\">MEROOM</span></b></span></p><p align=\"center\" style=\"text-align: center; \">")
            .append("<span style=\"font-size: 36pt; font-family: arial, sans-serif; color: rgb(0, 158, 37);\">")
            .append("<span style=\"color: rgb(0, 0, 0); font-size: 12pt;\">﻿MEROOM에서 인증번호 보내드립니다.</span></span></p>")
            .append("<p align=\"center\" style=\"text-align: center; \"><font face=\"arial, sans-serif\">")
            .append("<span style=\"font-size: 16px;\">아래 번호를 인증번호창에 입력해주세요&nbsp;</span></font></p>")
            .append("<p align=\"center\" style=\"text-align: center; \"><br></p><p align=\"center\" style=\"text-align: center; \">")
            .append("<font face=\"arial, sans-serif\"><span style=\"font-size: 18pt;\"><u style=\"\">" + authKey + "</u></span></font></p>")
            .append("<p align=\"center\" style=\"text-align: center; \"><br></p>")
            .toString());
            sendMail.setFrom("cmn719@gmail.com", "meroom");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return authKey;
    }
    
    public String sendTempPwMail(String email) {
    	 String authKey = getRandom();
        System.out.println("authKey : " + authKey);
        //인증메일 보내기
        try {
        	MailHandler sendMail = new MailHandler(mailSender);
            sendMail.setSubject("[MEROOM] 회원님의 임시 비밀번호입니다");
            sendMail.setText(new StringBuffer().append("<p align=\"center\" style=\"text-align: center; \">")
            .append("<span style=\"font-size: 36pt; font-family: arial, sans-serif; color: rgb(0, 158, 37);\">")
            .append("<b><span style=\"color: rgb(1, 91, 40);\"><br></span></b></span></p>")
            .append("<p align=\"center\" style=\"text-align: center; \">")
            .append("<span style=\"font-size: 36pt; font-family: arial, sans-serif; color: rgb(0, 158, 37);\">")
            .append("<b><span style=\"color: rgb(1, 91, 40);\">MEROOM</span></b></span></p><p align=\"center\" style=\"text-align: center; \">")
            .append("<span style=\"font-size: 36pt; font-family: arial, sans-serif; color: rgb(0, 158, 37);\">")
            .append("<span style=\"color: rgb(0, 0, 0); font-size: 12pt;\">﻿MEROOM에서 임시비밀번호를 보내드립니다.</span></span></p>")
            .append("<p align=\"center\" style=\"text-align: center; \"><font face=\"arial, sans-serif\">")
            .append("<span style=\"font-size: 16px;\">로그인 후 꼭 새로운 비밀번호를 설정해주세요. &nbsp;</span></font></p>")
            .append("<p align=\"center\" style=\"text-align: center; \"><br></p><p align=\"center\" style=\"text-align: center; \">")
            .append("<font face=\"arial, sans-serif\"><span style=\"font-size: 18pt;\"><u style=\"\">" + authKey + "</u></span></font></p>")
            .append("<p align=\"center\" style=\"text-align: center; \"><br></p>")
            .toString());
            sendMail.setFrom("cmn719@gmail.com", "meroom");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return authKey;
    }
    
    
    
    
    
    
    
    /*
     * <b><span style="color: rgb(0, 158, 37);">₩ 40,500</span></b></td></tr><tr style="background-color: rgb(255, 255, 255); font-family: sans-serif;"></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td bgcolor="#ffffff" style="margin: 0px; padding: 30px 0px;"><table width="100%" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px;"><tbody><tr><td style="margin: 0px; padding: 0px; font-size: 18px; line-height: 1.44444;"><table width="100%" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px;"><tbody><tr><td style="margin: 0px; padding: 0px;"><table width="100%" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px;"><tbody><tr style="font-family: sans-serif;"><td align="left" colspan="2" style="margin: 0px; padding: 0px;"><br></td></tr><tr style="font-family: sans-serif;"></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><p><br></p><p><br></p>

     * 
     */
    
    // 예약시 메일 전송
    public void sendReservationMail(String email,UserVO userVO, PaymentVO payVO) {
    	try {
    		MailHandler sendMail = new MailHandler(mailSender);
    		 sendMail.setSubject("[MEROOM] 예약내역 입니다.");
    		 sendMail.setText(new StringBuffer().append("<table align=\"center\" width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0px; padding: 0px;\">")
    				 .append("<tbody><tr><td style=\"margin: 0px; padding: 0px;\">")
    		 		 .append("<img src=\"https://mail.naver.com/write/image/path/?attachID=NPKwKxuZKAUTFqb9BquZbrJ5pr9GWou9aLYlaxbdKqEXaAbwKxM.&amp;cid=e05ef9c0ba2187dbee7cd85064717c9d@cweb013.nm.nfra.io\" loading=\"lazy\">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;")
    		 		 .append("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0px; padding: 0px;\">")
    		 		 .append("<tbody><tr><td style=\"margin: 0px; padding: 0px; font-size: 18px; line-height: 1.44444;\">")
    		 		 .append("<h2 style=\"margin: 1em 0px; padding: 0px; font-size: 38px; font-weight: 300;\">")
    		 		 .append("예약하신 내역을 안내해 드립니다.")
    		 		 .append("</h2><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0px; padding: 0px;\">")
    		 		 .append("<tbody><tr><td style=\"margin: 0px; padding: 0px;\"><br><br>")
    		 		 .append("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0px; padding: 0px;\">")
    		 		 .append("<tbody><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\">")
    		 		 .append("<th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 .append("예약 번호</th>")
    		 		 //예약번호 받아서 밑에 값에 전달
    		 		 .append("<td style=\"margin: 0px; padding: 0px; font-size: 14px;\">"+payVO.getrIdx()+"</td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\">")
    		 		 .append("<td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td>")
    		 		 .append("</tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\">")
    		 		 .append("<td colspan=\"2\" height=\"1\" bgcolor=\"#ebebeb\" style=\"margin: 0px; padding: 0px;\"></td>")
    		 		 .append("</tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\">")
    		 		 .append("<td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td>")
    		 		 .append("</tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //예약값 밑에 전달
    		 		 .append("예약 일시</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">"+payVO.getPayDate()+"</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"40\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" style=\"margin: 0px; padding: 0px; font-size: 20px;\"><br></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"10\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#666\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"20\" style=\"margin: 0px; padding: 0px;\">")
    		 		 .append("</td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" style=\"margin: 0px; padding: 0px;\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0px; padding: 0px;\"><tbody><tr><td valign=\"top\" width=\"25%\" style=\"margin: 0px; padding: 0px;\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0px; padding: 0px;\"><tbody><tr><th align=\"left\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 0px; font-size: 14px;\"><br></th></tr>")
    		 		 .append("</tbody></table></td><td valign=\"top\" style=\"margin: 0px; padding: 0px 0px 0px 20px;\">&nbsp; &nbsp;</td></tr></tbody></table></td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\">")
    		 		 .append("<td colspan=\"2\" height=\"20\" style=\"margin: 0px; padding: 0px;\"></td></tr>")
    		 		 
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" style=\"margin: 0px; padding: 0px; font-size: 20px;\">예약자 정보</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"10\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#666\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //사용자 이름 들어가야함
    		 		 .append("이름</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">"+userVO.getName()+"</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#ebebeb\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //휴대전화 들어가야함
    		 		 .append("휴대전화</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">"+userVO.getPhone()+"</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#ebebeb\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //이메일 정보 들어가야함
    		 		 .append("이메일</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">"+userVO.getEmail()+"</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"40\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" style=\"margin: 0px; padding: 0px; font-size: 20px;\">")
    		 		 .append("결제 정보</td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"10\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#666\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //결제시간 들어가야함
    		 		 .append("결제 시각</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">"+payVO.getPayDate()+"</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#ebebeb\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //결제 수단
    		 		 .append("결제 수단</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">신용카드</td></tr><tr style=\"background-color: rgb(255, 255, 255); ")
    		 		 .append("font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#ebebeb\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 //결제금액
    		 		 .append("총 상품금액</th><td style=\"margin: 0px; padding: 0px; font-size: 14px;\">₩ "+payVO.getPrice()+"</td></tr>")
    		 		 .append("<tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"1\" bgcolor=\"#ebebeb\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><td colspan=\"2\" height=\"12\" style=\"margin: 0px; padding: 0px;\"></td></tr><tr style=\"background-color: rgb(255, 255, 255); font-family: sans-serif;\"><th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" style=\"margin: 0px; padding: 0px 15px 0px 0px; width: 74.9008px; white-space: nowrap; font-size: 14px;\">")
    		 		 .toString());
             		 sendMail.setFrom("akdrhtn2@gmail.com", "meroom");
             		 sendMail.setTo(email);
             		 sendMail.send();
    	}catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
    public static String getRandom() {
    	StringBuffer temp = new StringBuffer();
    	Random rnd = new Random();
    	for (int i = 0; i < 6; i++) {
    	    int rIndex = rnd.nextInt(3);
    	    switch (rIndex) {
    	    case 0:
    	        // a-z 소문자
    	    	temp.append((char) ((int) (rnd.nextInt(26)) + 97));
    	        break;
    	    case 1:
    	        // A-Z 대문자
    	    	temp.append((char) ((int) (rnd.nextInt(26)) + 65));
    	        break;
    	    case 2:
    	        // 0-9 숫자
    	    	temp.append((rnd.nextInt(10)));
    	        break;
    	    }
    	}


    	System.out.println(temp);
    	String tempPw = temp.toString();
    	return tempPw;
    	

    }
    
    
    
}