package kr.co.yeonflix.theater;

import java.sql.SQLException;
import java.util.List;

public class TheaterService {

	public List<TheaterDTO> searchAllTheater(){
		List<TheaterDTO> list = null;
		
		TheaterDAO thDAO = TheaterDAO.getInstance();
		try {
			list = thDAO.selectAllTheater();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//searchAllTheater
}
