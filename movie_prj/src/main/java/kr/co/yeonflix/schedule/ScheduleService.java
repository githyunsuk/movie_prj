package kr.co.yeonflix.schedule;

import java.sql.SQLException;

public class ScheduleService {

	public boolean addSchedule(ScheduleDTO schDTO) {
		boolean flag = false;
		
		ScheduleDAO schDAO = ScheduleDAO.getInstance();
		try {
			schDAO.insertSchedule(schDTO);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}//addSchedule
	
}//class
