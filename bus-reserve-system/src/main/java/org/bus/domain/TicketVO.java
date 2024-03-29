package org.bus.domain;

import lombok.Data;

@Data
public class TicketVO {
	private int ticketNo;
	private int payNo;
	private int dispatchNo;
	private String id;
	private int seatNo;
	private String ticketStatus;
}
