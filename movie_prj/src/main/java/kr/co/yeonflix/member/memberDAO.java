package kr.co.yeonflix.member;

public class memberDAO {

	public static memberDAO mDAO;
	
	private memberDAO () {};
	
	public static memberDAO getInstance() {
		if(mDAO == null) {
			mDAO = new memberDAO();
		}
		return mDAO;
	}//getInstance();
	
	
	//수정
	
	//등록
	
	//회원탈퇴
	
	//조회(idx)
	
	//조회리스트
	
	
	
	
	
	
	
	
	
}
