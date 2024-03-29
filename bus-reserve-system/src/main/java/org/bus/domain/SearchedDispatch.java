package org.bus.domain;

import lombok.Data;

@Data
public class SearchedDispatch {
	private int dispatchNo;
	private int busNo;
	private String busType;
	private int totalSeat;
	private int startPoint;
	private int endPoint;
	private String departureTime;
	private String startRegion;
	private String endRegion;
	private String startTerminal;
	private String endTerminal;
	
}
