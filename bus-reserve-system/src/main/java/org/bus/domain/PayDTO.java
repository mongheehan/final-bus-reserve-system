package org.bus.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayDTO {
	private int payNo;
	private String id;
	private int amount;
	private Date paymentDate;
	private String payStatus;
	private String cardNo;
	private Date birth;
	private String phoneNo;
}
