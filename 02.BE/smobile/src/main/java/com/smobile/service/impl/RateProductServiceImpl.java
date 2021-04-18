package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.RateProductEntity;
import com.smobile.entity.UserEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IRateProductRepository;
import com.smobile.repository.IUserRepository;
import com.smobile.service.IRateProductService;

@Service
public class RateProductServiceImpl implements IRateProductService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IRateProductRepository rateProductRepository;
	
	@Autowired
	IUserRepository userRepository;
	
	@Autowired
	IProductRepository productRepository;
	
	@Override
	public List<RateProductEntity> findAllRateProduct() {
		List<RateProductEntity> listRateProduct = new ArrayList<RateProductEntity>();
		try {
			listRateProduct = rateProductRepository.findAll();
			LOGGER.info("Lấy danh sách đánh giá sản phẩm thành công!");
		} catch (Exception e) {
			LOGGER.info("Lấy danh sách đánh giá sản phẩm thất bại!");
		}
		return listRateProduct;
	}

	@Override
	public RateProductEntity findByRateId(Integer rateId) {
		RateProductEntity rateProductEntity = new RateProductEntity();
		try {
			rateProductEntity = rateProductRepository.findByRateId(rateId);
			LOGGER.info("Lấy đánh giá sản phẩm theo id thành công!");
		} catch (Exception e) {
			LOGGER.info("Lấy đánh giá sản phẩm theo id thất bại!");
		}
		return rateProductEntity;
	}

	@Override
	public ResponseDataModel addNewRateProduct(RateProductEntity rateProductEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			UserEntity userEntity = userRepository.findByUserId(rateProductEntity.getUserEntity().getUserId());
			ProductEntity productEntity = productRepository.findByProductId(rateProductEntity.getProductEntity().getProductId());
			if(userEntity == null) {
				responseMsg = "Không tìm thấy người dùng!"; 
				LOGGER.warn(responseMsg);
			} else if(productEntity == null) {
				responseMsg = "Không tìm thấy sản phẩm!";
				LOGGER.warn(responseMsg);
			} else {
				rateProductRepository.saveAndFlush(rateProductEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Đánh giá sản phẩm thành công!";
				LOGGER.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Đánh giá sản phẩm không thành công! ";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateRateProduct(RateProductEntity rateProductEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			UserEntity userEntity = userRepository.findByUserId(rateProductEntity.getUserEntity().getUserId());
			ProductEntity productEntity = productRepository.findByProductId(rateProductEntity.getProductEntity().getProductId());
			if(userEntity == null) {
				responseMsg = "Không tìm thấy người dùng!"; 
				LOGGER.warn(responseMsg);
			} else if(productEntity == null) {
				responseMsg = "Không tìm thấy sản phẩm!";
				LOGGER.warn(responseMsg);
			} else {
				rateProductRepository.saveAndFlush(rateProductEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật đánh giá sản phẩm thành công!";
				LOGGER.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật đánh giá sản phẩm không thành công! ";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteRateProductById(Integer rateProductId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			RateProductEntity rateProductEntity = rateProductRepository.findByRateId(rateProductId);
			if(rateProductEntity != null) {
				rateProductRepository.deleteById(rateProductId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa đánh giá sản phẩm thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy sản phẩm cần đánh giá!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa đánh giá sản phẩm không thành công! ";
			LOGGER.warn(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
