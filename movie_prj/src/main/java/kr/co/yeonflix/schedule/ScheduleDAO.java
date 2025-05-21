package kr.co.yeonflix.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.yeonflix.dao.DbConnection;

class ScheduleDAO {

	private static ScheduleDAO schDAO;
	
	private ScheduleDAO() {
		
	}//ScheduleDAO
	
	public static ScheduleDAO getInstance() {
		if(schDAO == null) {
			schDAO = new ScheduleDAO();
		}
		
		return schDAO;
	}//ScheduleDAO
	
	/**
	 * 상영스케줄을 추가하는 코드
	 * @param schDTO
	 * @throws SQLException
	 */
	public void insertSchedule(ScheduleDTO schDTO) throws SQLException {
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dbCon.getDbConn();
			String query = "insert into (schedule_idx, movie_idx, theater_idx, screen_date, start_time, end_time)"
					+ "values(schedule_idx_seq.nextval(),?,?,?,?,?)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, schDTO.getMovieIdx());
			pstmt.setInt(2, schDTO.getTheaterIdx());
			pstmt.setDate(3, schDTO.getScreenDate());
			pstmt.setTimestamp(4, schDTO.getStartTime());
			pstmt.setTimestamp(5, schDTO.getEndTime());
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(null, pstmt, con);
		}
	}//insertSchedule
	
}//class
