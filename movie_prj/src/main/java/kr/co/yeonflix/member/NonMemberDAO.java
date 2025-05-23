package kr.co.yeonflix.member;

public class NonMemberDAO {

	public static NonMemberDAO nmDAO;
	
	private NonMemberDAO() {};
	
	public static NonMemberDAO getInstance() {
		if(nmDAO == null) {
			nmDAO = new NonMemberDAO();
		}
		return nmDAO;
	}//getInstance();
	
//--------------------------------------------------------------------------------------------------------------------	

	//비회원 회원가입? 
	
	
	
}
