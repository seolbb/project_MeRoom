package com.spring.mr.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	public UserServiceImpl() {
		System.out.println(">>  UserServiceImpl() 객체 생성");
	}

	@Override
	public int insertUser(UserVO vo) {
		return userDAO.insertUser(vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		return userDAO.updateUser(vo);
	}

	@Override
	public int deleteUser(UserVO vo) {
		return userDAO.deleteUser(vo);
	}

	@Override
	public int deleteAfter(UserVO vo) {
		return userDAO.deleteAfter(vo);
	}
	
	
	
	
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public List<UserVO> getUserList() {
		
		return null;
	}

	@Override
	public List<UserVO> deleteUserList() {
		return userDAO.deleteUserList();
	}

	
	
	
	
	

	@Override
	public UserVO checkId(String memberId) {
		System.out.println("serviceImpl: " + memberId);
		return userDAO.checkId(memberId);
	}

	@Override
	public UserVO login(String memberId, String password) {
		return userDAO.login(memberId, password);
	}

	@Override
	public UserVO idFindMail(String name, String email) {
		return userDAO.idFindMail(name, email);
	}

	@Override
	public UserVO idFindPhone(String name, String phone) {
		return userDAO.idFindPhone(name, phone);
	}

	@Override
	public UserVO pwFindMail(String memberId, String name, String email) {
		return userDAO.pwFindMail(memberId, name, email);
	}

	@Override
	public UserVO pwFindPhone(String memberId, String name, String phone) {
		return userDAO.pwFindPhone(memberId, name, phone);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		
		return userDAO.getUserList(vo);
	}

	@Override
	public UserVO getQnaUser(int idx) {
		// TODO Auto-generated method stub
		return userDAO.getQnaUser(idx);
	}



	

}
