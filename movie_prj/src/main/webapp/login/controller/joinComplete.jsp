<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<%
	//multipart/form-data 는 request.getParameter() 로 못가져온다.
    // multipart/form-data 체크
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
    // 텍스트 필드값 저장을 위한 변수들
    String userId = "";
    String password = "";
    String userName = "";
    String email = "";
    String phone = "";
    String emailConsent = "N"; // 기본값 N
    String smsConsent = "N"; // 기본값 N
    String profileImageName = ""; // 업로드된 파일 이름
    
    if (isMultipart) {
        // 파일 업로드를 위한 설정
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        // 저장될 임시 경로 설정
        String tempDir = application.getRealPath("/temp");
        factory.setRepository(new File(tempDir));
        
        // 업로드 핸들러 생성
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        int maxSize = 1024 * 1024 * 10; //업로드용량
        upload.setSizeMax(maxSize);
        
        try {
            // 모든 폼 필드 파싱
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();
            
            // 업로드 파일이 저장될 경로
            String uploadPath = application.getRealPath("/uploads/profiles");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // 디렉토리가 없으면 생성
            }
            
            while (iter.hasNext()) {
                FileItem item = iter.next();
                
                if (item.isFormField()) {
                    // 일반 폼 필드 처리 (텍스트 데이터)
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8"); // 인코딩 지정
                    
                    switch (fieldName) {
                        case "userId":
                            userId = fieldValue;
                            break;
                        case "password":
                            password = fieldValue;
                            break;
                        case "userName":
                            userName = fieldValue;
                            break;
                        case "email":
                            email = fieldValue;
                            break;
                        case "phone":
                            phone = fieldValue;
                            break;
                        case "emailConsent":
                            emailConsent = fieldValue; // "Y"값이 올 것임
                            break;
                        case "smsConsent":
                            smsConsent = fieldValue; // "Y"값이 올 것임
                            break;
                    }
                } else {
                    // 파일 필드 처리 (프로필 이미지)
                    String fieldName = item.getFieldName();
                    
                    if ("profileImage".equals(fieldName) && item.getSize() > 0) {
                        // 중복 방지를 위한 파일명 처리 (UUID 사용)
                        String originalName = new File(item.getName()).getName();
                        String fileExt = originalName.substring(originalName.lastIndexOf('.'));
                        String savedName = UUID.randomUUID().toString() + fileExt;
                        File uploadedFile = new File(uploadPath, savedName);
                        
                        // 파일 저장
                        item.write(uploadedFile);
                        profileImageName = savedName;
                    }
                }
            }
            
            // 이름 마스킹 처리
            String maskedName = "";
            if(userName != null && userName.length() > 1){
                if(userName.length() == 2){
                    maskedName = userName.charAt(0) + "*";
                } else {
                    maskedName = userName.charAt(0) + "*" + userName.charAt(userName.length() - 1);
                }
            } else {
                maskedName = userName;
            }
            
            // 이메일 마스킹 처리
            String maskedEmail = "";
            if(email != null){
                int atIndex = email.indexOf("@");
                if(atIndex > 2){
                    String prefix = email.substring(0, 2); //첫두글자만
                    String stars = "*".repeat(atIndex - 2);
                    String domain = email.substring(atIndex);
                    maskedEmail = prefix + stars + domain;
                } else {
                    maskedEmail = email; //너무 짧아서.. 그럴리없겠지만
                }
            }
            
            // 세션에 데이터 저장
            session.setAttribute("userId", userId);
            session.setAttribute("userName", userName);
            session.setAttribute("maskedName", maskedName);
            session.setAttribute("email", email);
            session.setAttribute("maskedEmail", maskedEmail);
            session.setAttribute("phone", phone);
            session.setAttribute("emailConsent", emailConsent);
            session.setAttribute("smsConsent", smsConsent);
            session.setAttribute("profileImageName", profileImageName);
            
            // 서비스호출: 위 변수들을 매개변수로 던져서 체크 및 추가 처리
            // 이부분은 실제 서비스 로직으로 대체
            
            // 다음 페이지로 포워딩
            request.setAttribute("name", maskedName);
            request.setAttribute("email", maskedEmail);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login/join4complete.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // 에러 처리 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    } else {
        // multipart/form-data가 아닌 경우 처리
        response.sendRedirect(request.getContextPath() + "/error.jsp");
    }
%>