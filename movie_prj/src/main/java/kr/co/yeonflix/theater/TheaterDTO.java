package kr.co.yeonflix.theater;

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
public class TheaterDTO {
	
	private int theaterIdx, moviePrice;
	private String theaterType, theaterName;
	
}
