package org.bus.domain;

import lombok.Data;

@Data
public class BusVO {
	private int busNo;
	private String busType;
	private String company;
	private int totalSeat;
}
