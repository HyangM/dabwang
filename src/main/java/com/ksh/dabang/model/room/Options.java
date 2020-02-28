package com.ksh.dabang.model.room;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Options {
	private String optionId;
	private String optionName;
	private int optionType;
	
	@Builder
	public Options(String optionId, String optionName, int optionType) {

		this.optionId = optionId;
		this.optionName = optionName;
		this.optionType = optionType;
	}
	
	
	
	
	
	
	

	
	
	
		

}
