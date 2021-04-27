package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductCommentEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.UserEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductCommentRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IUserRepository;
import com.smobile.service.IProductCommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductCommentServiceImpl implements IProductCommentService {

	@Autowired
	IProductCommentRepository productCommentRepository;
	
	@Autowired
	IProductRepository productRepository;
	
	@Autowired
	IUserRepository userRepository;
	
	@Override
	public List<ProductCommentEntity> findAllProductComment() {
		List<ProductCommentEntity> productCommentList = new ArrayList<ProductCommentEntity>();
		try {
			productCommentList = productCommentRepository.findAll();
			log.info("Lấy danh sách bình luận của sản phẩm thành công!");
		} catch (Exception e) {
			log.error("Lấy danh sách bình luận của sản phẩm thất bại: " + e.getMessage());
		}
		return productCommentList;
	}

	@Override
	public ProductCommentEntity findByCommentId(Integer commentId) {
		ProductCommentEntity productCommentEntity = new ProductCommentEntity();
		try {
			productCommentEntity = productCommentRepository.findByCommentId(commentId);
			log.info("Tìm kiếm bình luận sản phẩm theo id thành công!");
		} catch (Exception e) {
			log.error("Tìm kiếm bình luận sản phẩm theo id thất bại: " + e.getMessage());
		}
		return productCommentEntity;
	}
	
	@Override
	public List<ProductCommentEntity> findByProductId(Integer productId) {
		List<ProductCommentEntity> productCommentList = new ArrayList<ProductCommentEntity>();
		try {
			productCommentList = productCommentRepository.getListProductCommentByProductId(productId);
			log.info("Lấy danh sách bình luận theo mã sản phẩm thành công!");
		} catch (Exception e) {
			log.warn("Lấy danh sách bình luận theo mã sản phẩm không thành công! " + e.getMessage());
		}
		return productCommentList;
	}

	@Override
	public ResponseDataModel addNewComment(ProductCommentEntity productCommentEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			ProductEntity productEntity = productRepository.findByProductId(productCommentEntity.getProductEntity().getProductId());
			UserEntity userEntity = userRepository.findByUserId(productCommentEntity.getUserEntity().getUserId());
			if(productEntity == null) {
				responseMsg = "Không tìm thấy sản phẩm!";
				log.warn(responseMsg);
			} else if(userEntity == null) {
				responseMsg = "Vui lòng đăng nhập để bình luận!";
				log.warn(responseMsg);
			} else {
				productCommentRepository.saveAndFlush(productCommentEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Bình luận thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Bình luận sản phẩm không thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateComment(ProductCommentEntity productCommentEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			ProductEntity productEntity = productRepository.findByProductId(productCommentEntity.getProductEntity().getProductId());
			UserEntity userEntity = userRepository.findByUserId(productCommentEntity.getUserEntity().getUserId());
			if(productEntity == null) {
				responseMsg = "Không tìm thấy sản phẩm!";
				log.warn(responseMsg);
			} else if(userEntity == null) {
				responseMsg = "Vui lòng đăng nhập để bình luận!";
				log.warn(responseMsg);
			} else {
				productCommentRepository.saveAndFlush(productCommentEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cật nhật bình luận thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật bình luận sản phẩm không thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteCommentById(Integer commnetId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			ProductCommentEntity productCommentEntity = productCommentRepository.findByCommentId(commnetId);
			if(productCommentEntity != null) {
				productCommentRepository.deleteById(commnetId);
				productCommentRepository.flush();
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa bình thuận sản phẩm thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy sản phẩm!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa bình luận không thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
