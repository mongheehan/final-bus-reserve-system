package org.bus.domain;

import lombok.Data;

@Data
public class DispatchVO {
	private int dispatchNo;
	private int busNo;
	private String startPointName;
	private String endPointName;
	private int startPoint;
	private int endPoint;
	private String departureTime;
}
