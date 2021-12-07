package com.spring.mr.controller.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.mr.service.user.UserService;
import com.spring.mr.vo.user.UserVO;

@Controller
public class KakaoController {
	
	@Autowired
	private UserService userService;

	private final static String K_CLIENT_ID = "c80f9b0fbece8c66d7feef895ade32f0";
	// 이런식으로 REDIRECT_URI를 써넣는다. // //
	private final static String K_REDIRECT_URI = "http://localhost:8080/mr/kakaologin.do";
	
	
	public static String getAuthorizationUrl(HttpSession session) {
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&response_type=code";
		return kakaoUrl;
	}

	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "c80f9b0fbece8c66d7feef895ade32f0")); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/mr/kakaologin.do")); // 리다이렉트
																												// URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;
	}

	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);
		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;

	}

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("카카오 로그인 컨트롤러");
		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		String kid = null;
		String kemail = null;
		String kname = null;
		// 유저정보 카카오에서 가져오기 Get properties
		
		JsonNode id = userInfo.path("id");
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kid = id.path("id").asText();
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		
		String kakao = id + "@k";
		session.setAttribute("id", kakao);
		session.setAttribute("email", kemail);
		session.setAttribute("nickname", kname);
		
		System.out.println("accessToken .toString(): " + accessToken.toString());
		System.out.println("accessToken : " + accessToken);
		System.out.println("userInfo .toString(): " + userInfo.toString());
		System.out.println("userInfo : " + userInfo);
		System.out.println("세션값 : id=" + id + "kakao : " + kakao + ","+ kid + ","+ kemail + "," + kname);
		
		UserVO vo = userService.checkId(kakao);
		System.out.println("vo : " + vo);
		if(vo == null) {
			mav.setViewName("signUpKakao.jsp");
			return mav;
		} else {
			session.setAttribute("vo", vo);
			mav.setViewName("redirect:main.jsp");
			return mav;
		}
	

	} // end kakaoLogin()

}
