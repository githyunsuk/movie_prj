<%@page import="java.net.URLEncoder"%>
<%@page import="lombok.extern.log4j.Log4j2"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="kr.co.yeonflix.member.MemberService"%>
<%@page import="kr.co.yeonflix.member.MemberDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%-- <jsp:useBean id="member" class="kr.co.yeonflix.member.MemberDTO" scope="page" /> --%>

<%
//멤버객체
MemberDTO memberVO = new MemberDTO(); 

MultipartRequest multi = null;
int fileMaxSize = 10 * 1024 * 1024; // 10MB
String savePath = application.getRealPath("/common/userProfiles"); 
File saveDir = new File(savePath);
if (!saveDir.exists()) {
    saveDir.mkdirs(); // 디렉토리 생성
}

if (ServletFileUpload.isMultipartContent(request)) { //multipart 요청이냐?
	//MultipartRequest 이거 쓰자... FileItem 이거 너무 어렵다. 
	//싹 고쳐야함 
	System.out.println("이것은 MultipartContent이다 ");

	
	try{
		multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
	} catch (Exception e){
		e.printStackTrace();
		out.println("<script>alert('처리 중 오류가 발생했습니다'); history.back();</script>");
	}

	String memberId = multi.getParameter("userId");
	String password = multi.getParameter("password");
	String nickName = multi.getParameter("nickName");
	String birthday = multi.getParameter("birthday");
	String userName = multi.getParameter("userName");
	String email = multi.getParameter("email");
	String emailConsent = multi.getParameter("emailConsent");
	String phone = multi.getParameter("phone");
	String smsConsent = multi.getParameter("smsConsent");
	
	memberVO.setMemberId(memberId);
	memberVO.setMemberPwd(password);
	memberVO.setNickName(nickName);
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	memberVO.setBirth(LocalDate.parse(birthday, formatter));
	memberVO.setUserName(userName);
	memberVO.setEmail(email);
	memberVO.setIsEmailAgreed(emailConsent);
	memberVO.setTel(phone);
	memberVO.setIsSmsAgreed(smsConsent);

	//나머지 memberVO 채우기
	memberVO.setCreatedAt(LocalDateTime.now()); //생성시각
	memberVO.setIsActive("Y"); //활동유저인가, 기본값 : Y
	memberVO.setMemberIp(request.getRemoteAddr()); //접속 IP

	//이미지 처리 
	/*  
		multi.getFile("profileImage")
			-> 파일을 서버의 임시 디렉토리에 저장하고, 해당 파일 객체(File) 를 반환
	*/
	File profileFile = multi.getFile("profileImage");
	String newProfile = null;
	
	/*
		profileFile.exists()
			-> 객체는 있지만, 서버 임시 경로에 그 파일이 정상적으로 저장되었는지까지 확인하는 것.	
	*/
		if(profileFile != null && profileFile.exists()){ //업로드 한 사진이 있고, 그 사진이 임시저장까지 됐냐? 
			System.out.println("임시저장한 절대경로: " + profileFile.getAbsolutePath());
		
			String ext = profileFile.getName().substring(profileFile.getName().lastIndexOf(".")+1).toUpperCase();
			if(ext.equals("PNG") || ext.equals("JPG") || ext.equals("GIF") || ext.equals("JPEG")){
				String profileName = System.currentTimeMillis() + "_" + profileFile.getName();
				File uploadedProfile = new File(savePath + "/" +  profileName);
	
				profileName = URLEncoder.encode(profileName, "UTF-8");
				memberVO.setPicture(profileName);
			}
		} else if(profileFile == null) { //업로드한 사진이 없다면?
			memberVO.setPicture("default_img.png");
		}
	
	//서비스 호출
	MemberService memberService = new MemberService();
	boolean result = memberService.joinMember(memberVO);

	if (result) {
		// 성공시 완료 페이지로 이동
		request.setAttribute("memberVO", memberVO);
		request.getRequestDispatcher("/login/join4complete.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath() + "/login/join4complete.jsp");
	} else {
		// 실패시 에러 메시지와 함께 이전 페이지로
		out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
	}


} 


%>