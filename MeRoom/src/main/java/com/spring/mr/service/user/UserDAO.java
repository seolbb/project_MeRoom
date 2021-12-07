package com.spring.mr.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원가입
	public int insertUser(UserVO vo) {
		System.out.println("회원가입 insertUser(UserVO vo) 실행");
		return mybatis.insert("userDAO.insertUser", vo);
		
	}
	
	
	// 아이디 중복 검사
	public UserVO checkId(String memberId) {
		System.out.println(">> DAO checkId() 메소드 실행");
		return mybatis.selectOne("userDAO.selectOne", memberId);
	}
	
	// 로그인
	public UserVO login(String memberId, String password) {
		System.out.println(">>DAO login() 실행");
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("password", password);
		return mybatis.selectOne("userDAO.login", map);
	}
	
	// 회원정보 수정
	public int updateUser(UserVO vo) {
		System.out.println("DAO updateUser() 실행");
		return mybatis.update("userDAO.updateUser", vo);
	}
	
	
	// 회원 탈퇴
	public int deleteUser(UserVO vo) {
		System.out.println("DAO deleteUser() 실행");
		return mybatis.update("userDAO.deleteUser", vo);
	}
	
	// 회원삭제 
	
	public int deleteAfter(UserVO vo) {
		System.out.println("DAO deleteAfter() 실행");
		return mybatis.delete("userDAO.deleteAfter", vo);
	}
	
	// 관리자 삭제회원 조회
	public List<UserVO> deleteUserList() {
		return mybatis.selectList("userDAO.deleteUserList");
	}
	
	
	
	// 유저 조회
	public UserVO getUser(UserVO vo) {
		System.out.println("DAO getUSerVO");
		return mybatis.selectOne("userDAO.selectOne", vo.getMemberId());
	}
	
	// 아이디찾기
	
	public UserVO idFindMail(String name, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		return mybatis.selectOne("userDAO.idFindMail", map);
	}
	
	public UserVO idFindPhone(String name, String phone) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("phone", phone);
		return mybatis.selectOne("userDAO.idFindPhone", map);
	}
	
	// 비밀번호 찾기
	public UserVO pwFindMail(String memberId, String name, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("name", name);
		map.put("email", email);
		return mybatis.selectOne("userDAO.pwFindMail", map);
	}
	
	public UserVO pwFindPhone(String memberId, String name, String phone) {
		Map<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("name", name);
		map.put("phone", phone);
		return mybatis.selectOne("userDAO.pwFindPhone", map);
	}


	public List<UserVO> getUserList(UserVO vo) {

		return mybatis.selectList("userDAO.selectList",vo);
	}


	public UserVO getQnaUser(int idx) {

		return mybatis.selectOne("userDAO.selectOneQna",idx);
	}
	
}
