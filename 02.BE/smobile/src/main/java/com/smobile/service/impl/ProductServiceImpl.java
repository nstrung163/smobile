package com.smobile.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductRepository;
import com.smobile.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService{

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IProductRepository productRepository;
	
	@Override
	public List<ProductEntity> findAllProduct() {
		return productRepository.findAll();
	}

	@Override
	public ProductEntity findByProductId(Integer productId) {
		return productRepository.findByProductId(productId);
	}

	@Override
	public ResponseDataModel addNewProduct(ProductEntity productEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(productRepository.findByProductName(productEntity.getProductName()) != null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Tên sản phẩm đã tồn tại!";
			} else {
				productRepository.saveAndFlush(productEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới sản phẩm thành công!";
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới sản phẩm thất bại!";
			LOGGER.error("Thêm mới sản phẩm thất bại: " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateProduct(ProductEntity productEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(productRepository.findByProductNameAndProductIdNot(productEntity.getProductName(), productEntity.getProductId()) != null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Tên sản phẩm đã tồn tại!";
			} else {
				productRepository.saveAndFlush(productEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật sản phẩm thành công!";
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật sản phẩm thất bại!";
			LOGGER.error("Cập nhật sản phẩm thất bại: " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteProductById(Integer productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(findByProductId(productId) != null) {
				productRepository.deleteById(productId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa sản phẩm thành công!";
			} else {
				responseMsg = "Không tìm thấy sản phẩm!";
			}
		} catch (Exception e) {
			responseMsg = "Xóa sản phẩm thất bại!";
			LOGGER.error("Xóa sản phẩm thất bại: " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
