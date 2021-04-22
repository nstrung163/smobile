package com.smobile.model;

import java.util.List;

import com.smobile.entity.ProductCommentEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductInfoEntity;
import com.smobile.entity.ProductOptionEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetailModel {

	private ProductEntity productEntity;
	
	private int totalRate;
	
	private float averagePointRate;
	
	private List<String> imagesUrl;
	
	private ProductInfoEntity productInfoEntity;
	
	private ProductOptionEntity productOption;
	
	private List<ProductCommentEntity> productCommentList;
}
