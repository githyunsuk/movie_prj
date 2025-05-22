package kr.co.yeonflix.member;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class memberDTO {
	int userIdx;
  String memberId; 
  String memberPwd; 
  String nickName; 
  String userName; 
  LocalDate birth; 
  String tel; 
  String isSmsAgreed;
  String email; 
  String isEmailAgreed; 
  LocalDateTime createdAt; 
  String isActive; 
  String picture; 
  String memberIp; 
}

