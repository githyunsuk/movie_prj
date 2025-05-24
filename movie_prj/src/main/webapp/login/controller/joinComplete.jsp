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
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.StandardCopyOption" %>

<%
//멤버객체
MemberDTO memberVO = new MemberDTO(); 

MultipartRequest multi = null;
int fileMaxSize = 10 * 1024 * 1024; // 10MB

// 그냥 이게 제일 낫다.server
String savePath = "C:\\dev\\movie\\userProfiles"; //고정시켜버려, server.xml에 설정중 

File saveDir = new File(savePath);

if (!saveDir.exists()) {
    boolean created = saveDir.mkdirs(); // 디렉토리 생성
    System.out.println("디렉토리 생성 결과: " + created + ", 경로: " + savePath);
}

if (ServletFileUpload.isMultipartContent(request)) { //multipart 요청이냐?
	//MultipartRequest 이거 쓰자... FileItem 이거 너무 어렵다. 
	
	try{
		multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		System.out.println("MultipartRequest 생성 완료, 저장 경로: " + savePath);
	} catch (Exception e){
		e.printStackTrace();
		out.println("<script>alert('처리 중 오류가 발생했습니다'); history.back();</script>");
		return; // 에러 시 처리 중단
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
	File profileFile = multi.getFile("profileImage");
	String originalFileName = multi.getOriginalFileName("profileImage");
	String savedFileName = multi.getFilesystemName("profileImage");
	
	System.out.println("원본 파일명: " + originalFileName);
	System.out.println("저장된 파일명: " + savedFileName);
	System.out.println("프로필 파일 객체: " + profileFile);
	
	if(profileFile != null && profileFile.exists() && originalFileName != null && !originalFileName.trim().isEmpty()){ 
		System.out.println("업로드된 파일 경로: " + profileFile.getAbsolutePath());
		System.out.println("파일 크기: " + profileFile.length() + " bytes");
		
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1).toUpperCase();
		System.out.println("파일 확장자: " + ext);
		
		if(ext.equals("PNG") || ext.equals("JPG") || ext.equals("GIF") || ext.equals("JPEG")){
			// MultipartRequest가 이미 파일을 저장했으므로 savedFileName 사용
			if(savedFileName != null) {
				// URL 인코딩은 필요시에만 적용 (보통 DB 저장시에는 원본명 사용)
				memberVO.setPicture(savedFileName);
				System.out.println("DB에 저장할 파일명: " + savedFileName);
			} else {
				memberVO.setPicture("default_img.png");
				System.out.println("파일 저장 실패, 기본 이미지 사용");
			}
		} else {
			memberVO.setPicture("default_img.png");
			System.out.println("지원하지 않는 파일 형식, 기본 이미지 사용");
		}
	} else { 
		memberVO.setPicture("default_img.png");
		System.out.println("업로드된 파일이 없음, 기본 이미지 사용");
	}
	
	// 최종 파일 확인
	if(!memberVO.getPicture().equals("default_img.png")) {
		File finalFile = new File(savePath + "/" + memberVO.getPicture());
		System.out.println("최종 파일 존재 여부: " + finalFile.exists());
		System.out.println("최종 파일 경로: " + finalFile.getAbsolutePath());
	}
	
	//서비스 호출
	MemberService memberService = new MemberService();
	boolean result = memberService.joinMember(memberVO);

	if (result) {
		// 성공시 완료 페이지로 이동
		session.setAttribute("memberVO", memberVO);
		response.sendRedirect(request.getContextPath() + "/login/join4complete.jsp");
	} else {
		// 실패시 에러 메시지와 함께 이전 페이지로
		out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
	}
} 
%>