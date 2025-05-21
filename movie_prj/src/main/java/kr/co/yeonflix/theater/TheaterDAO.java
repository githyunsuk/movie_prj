package kr.co.yeonflix.theater;

public class TheaterDAO {

	public static TheaterDAO thDAO;
	
	private TheaterDAO() {
		
	}//TheaterDAO
	
	public static TheaterDAO getInstance() {
		if(thDAO == null) {
			thDAO = new TheaterDAO();
		}
		
		return thDAO;
	}//getInstance
	
	
}
