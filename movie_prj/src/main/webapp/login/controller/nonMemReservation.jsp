<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//비회원 예매하기 
//이메일 인증번호 맞는지 확인 후, 예매사이트로 이동.

//이때 비회원 정보를 세션에 올려놔야 예매를 '완료'한 후에 비회원 정보를 테이블에 insert가능
//테이블 insert완료되고 난 후, 세션에서 삭제해야 함 

String desc = "비회원 예매하기 컨트롤러 (미완)";
%>
<%= desc %>