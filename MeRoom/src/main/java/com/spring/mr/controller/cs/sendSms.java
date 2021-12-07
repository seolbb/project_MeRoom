package com.spring.mr.controller.cs;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class sendSms {
	
	public static void main(String[] args) {
	    String api_key = "NCS0KK5FJ6IWE5UI";
	    String api_secret = "ZRKUDVSG7WSFMX8L6XZ8P0TL73XSCVF4";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01046227566");
	    params.put("from", "01046227566");
	    params.put("type", "SMS");
	    params.put("text", "[미룸]문의답변이 등록되었습니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	  }
	
	

}
