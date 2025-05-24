package kr.co.yeonflix.member;

import java.sql.SQLException;

import at.favre.lib.crypto.bcrypt.BCrypt;

public class MemberService {

  private MemberDAO memberDAO;

  public MemberService() {
    this.memberDAO = MemberDAO.getInstance();
  }

  /**
   * 로그인
   */
  public MemberDTO loginMember(String memberId, String memberPwd) {
    MemberDTO memberDTO = new MemberDTO();

    try {
      memberDTO = memberDAO.memberLogin(memberId, memberPwd);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return memberDTO;
  }

  /**
   * 회원가입 처리
   * 
   * @param memberDTO 회원 정보
   * @return 성공 여부
   */
  public boolean joinMember(MemberDTO memberDTO) {
    try {
      // 1. 데이터 유효성 검증
      if (!validateMemberData(memberDTO)) {
        return false;
      }

      // 2. 비밀번호 암호화 (BCrypt사용함)
      String encryptedPassword = encryptPassword(memberDTO.getMemberPwd());
      memberDTO.setMemberPwd(encryptedPassword);

      // 3. 중복 검사 (아이디, 닉네임, 이메일)
      if (memberDAO.selectMemberId(memberDTO.getMemberId())) {
        System.out.println("이미 존재하는 아이디입니다: " + memberDTO.getMemberId());
        return false;
      }

      if (memberDAO.selectNickname(memberDTO.getNickName())) {
        System.out.println("이미 존재하는 닉네임입니다: " + memberDTO.getNickName());
        return false;
      }

      if (memberDAO.selectEmail(memberDTO.getEmail())) {
        System.out.println("이미 존재하는 이메일입니다: " + memberDTO.getEmail());
        return false;
      }
      if (memberDAO.selectTel(memberDTO.getTel())) {
        System.out.println("이미 존재하는 핸드폰 번호입니다: " + memberDTO.getTel());
        return false;
      }

      // 4. 데이터베이스에 회원 정보 저장
      boolean result = memberDAO.insertMember(memberDTO);

      if (result) {
        System.out.println("회원가입 성공: " + memberDTO.getMemberId());

        // 5. 회원가입 완료 후 추가 작업 (이메일 발송 등)
        sendWelcomeEmail(memberDTO);

        return true;
      } else {
        System.out.println("회원가입 실패: 데이터베이스 저장 오류");
        return false;
      }

    } catch (Exception e) {
      System.out.println("회원가입 처리 중 오류 발생: " + e.getMessage());
      e.printStackTrace();
      return false;
    }
  }

  /**
   * 회원 데이터 유효성 검증
   * 
   * @param memberDTO 회원 정보
   * @return 유효성 검사 결과
   */
  private boolean validateMemberData(MemberDTO memberDTO) {
    // 필수 필드 검증
    if (memberDTO.getMemberId() == null || memberDTO.getMemberId().trim().isEmpty()) {
      System.out.println("아이디가 입력되지 않았습니다.");
      return false;
    }

    if (memberDTO.getMemberPwd() == null || memberDTO.getMemberPwd().trim().isEmpty()) {
      System.out.println("비밀번호가 입력되지 않았습니다.");
      return false;
    }

    // 아이디 형식 검증 (영문, 숫자 조합 6-20자)
    if (!memberDTO.getMemberId().matches("^[a-zA-Z0-9]{6,20}$")) {
      System.out.println("아이디 형식이 올바르지 않습니다.");
      return false;
    }

    // 비밀번호 형식 검증 (영문, 숫자, 특수문자 조합 8자 이상)
    if (!memberDTO.getMemberPwd().matches("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")) {
      System.out.println("비밀번호 형식이 올바르지 않습니다.");
      return false;
    }

    if (memberDTO.getNickName() == null || memberDTO.getNickName().trim().isEmpty()) {
      System.out.println("닉네임이 입력되지 않았습니다.");
      return false;
    }

    // 닉네임 형식 검증 (한글, 영문, 숫자 조합 2-20자)
    if (!memberDTO.getNickName().matches("^[가-힣a-zA-Z0-9]{2,20}$")) {
      System.out.println("닉네임 형식이 올바르지 않습니다.");
      return false;
    }

    if (memberDTO.getUserName() == null || memberDTO.getUserName().trim().isEmpty()) {
      System.out.println("이름이 입력되지 않았습니다.");
      return false;
    }

    if (memberDTO.getEmail() == null || memberDTO.getEmail().trim().isEmpty()) {
      System.out.println("이메일이 입력되지 않았습니다.");
      return false;
    }

    // 이메일 형식 검증
    if (!memberDTO.getEmail().matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
      System.out.println("이메일 형식이 올바르지 않습니다.");
      return false;
    }

    // 수신체크 안되어 있으면 "N" 대입
    if (memberDTO.getIsEmailAgreed() == null || memberDTO.getEmail().trim().isEmpty()) {
      memberDTO.setIsEmailAgreed("N");
    }
    if (memberDTO.getIsSmsAgreed() == null || memberDTO.getEmail().trim().isEmpty()) {
      memberDTO.setIsSmsAgreed("N");
    }

    if (memberDTO.getTel() == null || memberDTO.getTel().trim().isEmpty()) {
      System.out.println("전화번호가 입력되지 않았습니다.");
      return false;
    }

    return true;
  }

  /**
   * 비밀번호 암호화
   * 
   * @param password 원본 비밀번호
   * @return 암호화된 비밀번호
   */
  private String encryptPassword(String password) {
    String encryptedPwd = "";
    // 스프링 시큐리티에서 쓰이는 암호화 라이브러리, 단방향 해시 알고리즘 (at.favre.lib:bcrypt 버전)
    encryptedPwd = BCrypt.withDefaults().hashToString(12, password.toCharArray());
    return encryptedPwd;
  }

  // 가입 환영 이멜.. 보낼까?
  private void sendWelcomeEmail(MemberDTO memberDTO) {
    // 이메일 수신 허용한 경우에만
    if ("Y".equals(memberDTO.getEmail())) {
    }
  }

  /* 중복검사 버튼을 클릭시에는 이게 필요하겠지? */
  // 아이디 중복 확인
  public boolean checkUserIdDuplicate(String userId) throws SQLException {
    return memberDAO.selectMemberId(userId);
  }

  // 닉네임 중복 호가인
  public boolean checkNickNameDuplicate(String nickName) throws SQLException {
    return memberDAO.selectNickname(nickName);
  }

}