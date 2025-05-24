<%@page import="java.util.Enumeration"%>
<%@page import="kr.co.yeonflix.member.MemberService"%>
<%@page import="kr.co.yeonflix.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

/* 	Enumeration<String> params = request.getParameterNames();
	while (params.hasMoreElements()) {
    String paramName = params.nextElement();
    String paramValue = request.getParameter(paramName);
    System.out.println(paramName + " = " + paramValue);
	} */
	
	String memberId = request.getParameter("memberId");
	String memberPwd = request.getParameter("memberPwd");
	
	MemberService memService = new MemberService();
	MemberDTO loginUser = memService.loginMember(memberId, memberPwd);
	
	if(loginUser != null && loginUser.getUserIdx() > 0){
	  //보안상 초기화 
	  session.invalidate(); // 기존 세션 제거
	  session = request.getSession(true); // 새로운 세션 생성
		session.setAttribute("loginUser", loginUser);
		response.setContentType("text/plain;charset=UTF-8");
		out.print("success");
	} else {
	  response.setContentType("text/plain;charset=UTF-8");
		out.print("fail");
	}

%>
