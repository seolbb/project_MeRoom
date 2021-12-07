package com.spring.mr.service.user;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service("smsSendService")
public class CoolsmsService {
	
	
	public String sendTempSms (String userPhone) { 
		
	    String api_key = "NCS0KK5FJ6IWE5UI";
	    String api_secret = "ZRKUDVSG7WSFMX8L6XZ8P0TL73XSCVF4";
	    Message coolsms = new Message(api_key, api_secret);
	    String authKey = getRandom();

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhone);
	    params.put("from", "01046227566");
	    params.put("type", "SMS");
	    params.put("text", "[MEROOM] 임시비밀번호 " + authKey + " 보내드립니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	    
	    return authKey;
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
