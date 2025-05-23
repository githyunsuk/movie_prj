package kr.co.yeonflix.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import kr.co.yeonflix.dao.DbConnection;

public class MemberDAO {

	public static MemberDAO mDAO;
	
	private MemberDAO () {};
	
	public static MemberDAO getInstance() {
		if(mDAO == null) {
			mDAO = new MemberDAO();
		}
		return mDAO;
	}//getInstance();
	
//--------------------------------------------------------------------------------------------------------------------	
	//비회원가입
	
	//운영자가입
	
	//일반 회원가입
	public boolean insertMember(MemberDTO memberDTO) throws SQLException {

		boolean isSuccess = false;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		ResultSet rs = null;
		
		PreparedStatement commonUserPstmt = null;
		PreparedStatement getUserIdxPstmt = null;
		PreparedStatement memberPstmt = null;
		PreparedStatement getRoleIdxPstmt = null;
		PreparedStatement memberRolePstmt = null;
		
		int generatedUserIdx  = -1;
		int getRoleIdx = -1;
		
		try {
			con = dbCon.getDbConn();

			String insertCommonUser = " INSERT INTO common_user (user_idx, user_type) VALUES (USER_IDX_SEQ.NEXTVAL, ? ) "; //?는 GUEST, MEMBER, ADMIN 중에 MEMBER
			String getUserIdxQuery = " SELECT USER_IDX_SEQ.CURRVAL FROM dual ";
			String insertMember = " INSERT INTO member (USER_IDX, MEMBER_ID, MEMBER_PWD, NICK_NAME, USER_NAME, BIRTH, TEL, IS_SMS_AGREED, EMAIL, IS_EMAIL_AGREED, CREATED_AT, IS_ACTIVE, PICTURE, MEMBER_IP) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
			String getRoleIdxQuery = " SELECT role_idx FROM role WHERE role_name = 'ROLE_MEMBER' ";
			String insertUserRoleTable = " INSERT INTO user_role_table (user_idx, role_idx) VALUES (?, ?) "; //getUserIdx, getRoleIdx
			
			con.setAutoCommit(false); //트랜잭션 시작
			
			//1.common_user 테이블 데이터 생성
			commonUserPstmt = con.prepareStatement(insertCommonUser);
			commonUserPstmt.setString(1, "MEMBER"); //명시적으로.. ENUM으로 고칠까?
			commonUserPstmt.executeUpdate();
			
			//2.생성된 common_user의 user_idx 가져와서 
			getUserIdxPstmt = con.prepareStatement(getUserIdxQuery);
			rs = getUserIdxPstmt.executeQuery();
			if(rs.next()) {
				generatedUserIdx = rs.getInt(1);
			}
			
			//3.member테이블 회원데이터 생성하고 
			memberPstmt = con.prepareStatement(insertMember);
			memberPstmt.setInt(1, generatedUserIdx); //받은 user_idx 대입
			memberPstmt.setString(2, memberDTO.getMemberId());
			memberPstmt.setString(3, memberDTO.getMemberPwd());
			memberPstmt.setString(4, memberDTO.getNickName());
			memberPstmt.setString(5, memberDTO.getUserName());
			memberPstmt.setDate(6, Date.valueOf( memberDTO.getBirth()));
			memberPstmt.setString(7, memberDTO.getTel());
			memberPstmt.setString(8, memberDTO.getIsSmsAgreed());
			memberPstmt.setString(9, memberDTO.getEmail());
			memberPstmt.setString(10, memberDTO.getIsEmailAgreed());
			memberPstmt.setTimestamp(11, Timestamp.valueOf( memberDTO.getCreatedAt()));
			memberPstmt.setString(12, memberDTO.getIsActive());
			memberPstmt.setString(13, memberDTO.getPicture());
			memberPstmt.setString(14, memberDTO.getMemberIp());
			
			memberPstmt.executeUpdate();
			
			//3.권한테이블에서 ROLE_MEMBER의 idx 가져와서, 
			getRoleIdxPstmt = con.prepareStatement(getRoleIdxQuery);
			rs = getRoleIdxPstmt.executeQuery();
			if(rs.next()) {
				getRoleIdx = rs.getInt(1);
			}
			
			//4.user_role_table에 데이터 대입 
			memberRolePstmt = con.prepareStatement(insertUserRoleTable);
			memberRolePstmt.setInt(1, generatedUserIdx);
			memberRolePstmt.setInt(2, getRoleIdx);
			memberRolePstmt.executeUpdate();
			
			//커밋
	    con.commit();
	    isSuccess = true;
	    
		} catch (SQLException e) {
			if(con != null) {
				con.rollback(); //실패-> 롤백
			}
			e.printStackTrace();
			throw e;
		} finally {
		    if (rs != null) try { rs.close(); } catch (SQLException e) {}
		    if (commonUserPstmt != null) commonUserPstmt.close();
		    if (getUserIdxPstmt != null) getUserIdxPstmt.close();
		    if (memberPstmt != null) memberPstmt.close();
		    if (getRoleIdxPstmt != null) getRoleIdxPstmt.close();
		    if (memberRolePstmt != null) memberRolePstmt.close();
		    if (con != null) con.setAutoCommit(true); // 다시 원래대로 autocommit으로 설정 
		    if (con != null) con.close();
		}

		return isSuccess; 
	}
	
	//수정
	
	//회원탈퇴
	
	//조회(idx)
	
	//조회리스트
	
	//아이디 중복 검사
	public boolean selectMemberId(String memberId) throws SQLException {
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isDuplicate = false;

		try {
			con = dbCon.getDbConn();

			String selectQuery = " SELECT COUNT(*) FROM member WHERE member_id = ? ";

			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
        int count = rs.getInt(1); //조회결과의 인덱스1을 가져옴
        isDuplicate = (count > 0); // 중복이면 true
    }

		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return isDuplicate;
	}
	
	//닉네임 중복 검사
	public boolean selectNickname(String nickName) throws SQLException {
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isDuplicate = false;
		
		try {
			con = dbCon.getDbConn();
			
			String selectQuery = " SELECT COUNT(*) FROM member WHERE nick_name = ? ";
			
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, nickName);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int count = rs.getInt(1);
        isDuplicate = (count > 0); // 중복이면 true
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return isDuplicate;
		
	}
	//핸드폰 중복 검사 
	public boolean selectTel(String tel) throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isDuplicate = false;
		
		try {
			con = dbCon.getDbConn();
			
			String selectQuery = " SELECT COUNT(*) FROM member WHERE tel = ? ";
			
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, tel);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int count = rs.getInt(1);
				isDuplicate = (count > 0);
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return isDuplicate;
	}
	
	//이메일 중복 검사
	public boolean selectEmail(String email) throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isDuplicate = false;
		
		try {
			con = dbCon.getDbConn();
			
			String selectQuery = " SELECT COUNT(*) FROM member WHERE email = ? ";
			
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				int count = rs.getInt(1);
				isDuplicate = (count > 0);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return isDuplicate;
	}
	
	
	
	
	
	
}
