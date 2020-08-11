package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.annotaion.RequestMapping;

public class MemberController {

	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("MemberController login() 호출...");
		return "";
	}
}
