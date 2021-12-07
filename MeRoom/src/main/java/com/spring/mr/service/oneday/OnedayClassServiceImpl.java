package com.spring.mr.service.oneday;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.oneday.OnedayClassVO;

@Service("onedayClassService")
public class OnedayClassServiceImpl implements OnedayClassService {
	@Autowired
	private OnedayClassDAO onedayclassDAO;
	
	public OnedayClassServiceImpl() {
		System.out.println(">> OnedayClassServiceImpl() 객체생성");
	}
	
	@Override
	public void insertClass(OnedayClassVO vo) {
		onedayclassDAO.insertClass(vo);
	}

	@Override
	public void updateClass(OnedayClassVO vo) {
		onedayclassDAO.updateClass(vo);
	}

	@Override
	public void deleteClass(OnedayClassVO vo) {
		onedayclassDAO.deleteClass(vo);
	}

	@Override
	public OnedayClassVO getClass(OnedayClassVO vo) {
		return onedayclassDAO.getClass(vo);
	}

	@Override
	public List<OnedayClassVO> getClassList() {
		return onedayclassDAO.getClassList();
	}

	@Override
	public String restCnt(Map<String, String> param) {
		return onedayclassDAO.restCnt(param);
	}



}
