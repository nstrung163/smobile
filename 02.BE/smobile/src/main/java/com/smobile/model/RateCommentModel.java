package com.smobile.model;


import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.smobile.entity.ProductEntity;
import com.smobile.entity.UserEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RateCommentModel {

	private String commentContent;
	
	private Date dateOfComment;
	
	private UserEntity userEntity;
	
	private ProductEntity productEntity;
	
	private int rateNumber;
	
	private String imageCommentUrl;
	
	private MultipartFile imageFile;
}
