package com.smobile.service;

import com.smobile.entity.ProductCommentEntity;
import com.smobile.model.ResponseDataModel;

import java.util.List;

public interface IProductCommentService {

	/**
	 * 
	 * Get all comment
	 * 
	 * @returnList<ProductCommentEntity>
	 */
	List<ProductCommentEntity> findAllProductComment();
	
	/**
	 * 
	 * Fin comment by id
	 * 
	 * @param commentId
	 * @return ProductCommentEntity
	 */
	ProductCommentEntity findByCommentId(Integer commentId);
	
	/**
	 * 
	 * Find comment product by product id
	 * 
	 * @param productId
	 * @return List<ProductCommentEntity>
	 */
	List<ProductCommentEntity> findByProductId(Integer productId);
	
	/**
	 * 
	 * Add new comment for product
	 * 
	 * @param productCommentEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewComment(ProductCommentEntity productCommentEntity);
	
	/**
	 * 
	 * Update comment product
	 * 
	 * @param productCommentEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel updateComment(ProductCommentEntity productCommentEntity);
	
	/**
	 * 
	 * Delete comment by id
	 * 
	 * @param commnetId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteCommentById(Integer commnetId);
	
}
