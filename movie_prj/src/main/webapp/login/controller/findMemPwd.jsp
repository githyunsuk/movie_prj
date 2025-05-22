<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String userId = request.getParameter("userId");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String verifiedCode = request.getParameter("verifiedCode");
	
	//서비스호출: 위 변수들을 매개변수로 던져서 체크: 이름도 가져와.
	
	String name = "임시이름";
	
	//이름과 이메일 가리기
	String maskedName = "";
	if(name != null && name.length() > 1){
		if(name.length() == 2){
			maskedName = name.charAt(0) + "*";
		} else {
			maskedName = name.charAt(0) + "*" + name.charAt(name.length() - 1);
		}
	} else {
		maskedName = name;
	}
	
	String maskedEmail = "";
	if(email != null){
		int atIndex = email.indexOf("@");
		if(atIndex > 2){
			String prefix = email.substring(0,2); //첫두글자만
			String stars = "*".repeat(atIndex - 2);
			String domain = email.substring(atIndex);
			maskedEmail = prefix + stars + domain;
		} else {
			maskedEmail = email; //너무 짧아서.. 그럴리없겠지만
		}
	}
	
	request.setAttribute("name", maskedName);
	request.setAttribute("email", maskedEmail);
	
	//조회결과 인증번호가 맞다면?
	RequestDispatcher dispatcher = request.getRequestDispatcher("/login/temporarily.jsp");
	dispatcher.forward(request, response);
	
	//인증번호가 틀리다면?
	//어떻게 처리할까 ajax로 할껄그랬나? 
	
			
	
	//아 그리고, 여기서 회원 비밀번호 임시비밀번호로 수정해야돼. 
			
			
%>