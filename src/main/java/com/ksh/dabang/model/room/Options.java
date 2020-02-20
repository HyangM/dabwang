package com.ksh.dabang.model.room;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Options {
	private String optionId;
	private String optionName;
	
	@Builder
	public Options(String optionId, String optionName) {

		this.optionId = optionId;
		this.optionName = optionName;
	}
	
	
	
	
	
	
	

	
	
	
		

}
