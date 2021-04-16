package com.smobile.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductInfoEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductInfoRepository;
import com.smobile.service.IProductInfoService;
import com.smobile.service.IProductService;

@Service
public class ProductInfoServiceImpl implements IProductInfoService{

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IProductInfoRepository productInfoRepository;
	
	@Autowired
	IProductService productRepository;
	
	@Override
	public List<ProductInfoEntity> findAllProductInfo() {
		return productInfoRepository.findAll();
	}

	@Override
	public ProductInfoEntity findByProductInfoId(Integer productId) {
		return productInfoRepository.findByProductInfoId(productId);
	}

	@Override
	public ResponseDataModel addNewProductInfo(ProductInfoEntity productInfoEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(productRepository.findByProductId(productInfoEntity.getProductEntity().getProductId()) ==null) {
				responseMsg = "Không tìm sản phẩm cần thêm thông tin chi tiết!";
				LOGGER.warn(responseMsg);
			} else {
 				if(productInfoRepository.findByProductId(productInfoEntity.getProductEntity().getProductId()) != null) {
					responseCode = Constants.RESULT_CD_DUPL;
					responseMsg = "Sản phẩm đã được thêm thông tin chi tiết!";
					LOGGER.warn(responseMsg);
				} else {
					productInfoRepository.saveAndFlush(productInfoEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Thêm mới thông tin chi tiết cho sản phẩm thành công!";
					LOGGER.info(responseMsg);
				}
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới chi tiết sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateProductInfo(ProductInfoEntity productInfoEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(productInfoRepository.findByProductId(productInfoEntity.getProductEntity().getProductId()) == null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Không tìm thất sản phẩm!";
				LOGGER.warn(responseMsg);
			} else {
				productInfoRepository.saveAndFlush(productInfoEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật thông tin chi tiết cho sản phẩm thành công!";
				LOGGER.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật chi tiết sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteProdutInfo(Integer productInfoId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		ProductInfoEntity productInfoEntity = findByProductInfoId(productInfoId);
		try {
			if(productInfoEntity != null) {
				productInfoRepository.deleteById(productInfoId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa thông tin sản phẩm thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy thông tin sản phẩm cần xóa!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
