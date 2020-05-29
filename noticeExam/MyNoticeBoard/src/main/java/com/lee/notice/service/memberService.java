package com.lee.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lee.notice.VO.VOMember;
import com.lee.notice.dao.memberDao;

@Service
public class memberService {
	@Autowired
	memberDao dao;

	public int memInsert(VOMember member) {
		// TODO Auto-generated method stub
		int result= dao.memberInsert(member); //컨트롤러에서 전달받은 멤버클래스 전달
		
		if(result==0) {
			System.out.println("InsertError");
			return -1;
		}
		System.out.println("Insert성공");
		return result;
	}

	public VOMember memberLogin(VOMember member) {
		
		VOMember mem=dao.memberSelect(member);   // 매개변수 값 dao전달
		if(mem==null) { //전달받은 mem 클래스가 null이면 찾을 수 없는 정보 
			System.out.println("Service(Login)실패");
			return null;
		}
		
		else {
			System.out.println(mem.getMemId());
			return mem;
		}
		
	}

}
