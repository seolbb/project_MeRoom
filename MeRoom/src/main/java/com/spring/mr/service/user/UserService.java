package com.spring.mr.service.user;

import java.util.List;

import com.spring.mr.vo.user.UserVO;

public interface UserService {
	
	int insertUser(UserVO vo);
	int updateUser(UserVO vo);
	int deleteUser(UserVO vo);
	int deleteAfter(UserVO vo);
	UserVO getUser (UserVO vo);
	List<UserVO> getUserList();
	List<UserVO> getUserList(UserVO vo);
	List<UserVO> deleteUserList();
	
	UserVO checkId(String memberId);
	UserVO login(String memberId, String password);
	
	UserVO idFindMail(String name, String email);
	UserVO idFindPhone(String name, String phone);
	UserVO pwFindMail(String memberId, String name, String email);
	UserVO pwFindPhone(String memberId, String name, String phone);
	UserVO getQnaUser(int idx);
}
