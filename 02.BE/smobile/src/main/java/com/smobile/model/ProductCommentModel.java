package com.smobile.model;

import java.util.Date;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;

import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductCommentModel {

	private Integer productId;
	
	private String commentContent;
	
	private Date dateOfComment;
	
	private String imageCommentUrl;
	
	private String fullName;
	
	private String avatarUrl;
	
	private int rateNumber;
}
