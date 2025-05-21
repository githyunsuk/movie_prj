package kr.co.yeonflix.schedule;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ScheduleDTO {

	private int scheduleIdx, movieIdx, theaterIdx;
	private Date screenDate;
	private Timestamp startTime, endTime;
}
