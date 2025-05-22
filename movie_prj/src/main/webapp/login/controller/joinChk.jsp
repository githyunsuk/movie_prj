<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  String name = request.getParameter("name");
  String birth = request.getParameter("birth");
  String email = request.getParameter("email");

  boolean isMember = new Random().nextBoolean();

  if (isMember) {
    request.setAttribute("name", name);
    request.setAttribute("userId", "shinmingi");

    RequestDispatcher dispatcher = request.getRequestDispatcher("/login/alreadyMember.jsp");
    dispatcher.forward(request, response); 
  } else {
%>
	<script>
	  alert("가입 정보가 존재하지 않습니다.");
	  location.href = "<%= request.getContextPath() %>/login/join1verification.jsp";
  </script>
<%
  }
%>