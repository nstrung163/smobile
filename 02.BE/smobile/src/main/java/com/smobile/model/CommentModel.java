package com.smobile.model;

import com.smobile.entity.ProductCommentEntity;

import lombok.AllArgsConstructor;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentModel {

	private ProductCommentEntity productCommentEntity;
	
	private String productName;
	
	private String fullName;
}
