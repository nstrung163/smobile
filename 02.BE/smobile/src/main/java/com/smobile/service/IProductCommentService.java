package com.smobile.service;

import java.util.List;

import com.smobile.entity.ProductCommentEntity;
import com.smobile.model.CommentModel;
import com.smobile.model.ResponseDataModel;

public interface IProductCommentService {

	/**
	 * 
	 * Get all comment
	 * 
	 * @return List<ProductCommentEntity>
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
	
	/**
	 * 
	 * Convert product comment entity to product comment model
	 * 
	 * @param productCommentList
	 * @return List<ProductCommentModel>
	 */
	List<CommentModel> convertCommentEntityToCommentModel(List<ProductCommentEntity> productCommentList);
}
