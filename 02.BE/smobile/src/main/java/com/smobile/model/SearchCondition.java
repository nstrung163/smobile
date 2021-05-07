package com.smobile.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchCondition {

	private String keyword;
	
	private String priceFrom;
	
	private String priceTo;
	
	private List<String> listBrandId;
	
	private List<String> listTypeProduct;
	
	private List<String[]> listRam;
	
	private List<String> listPin;
}
