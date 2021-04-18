package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.service.IProductOptionService;

@Service
public class ProductOptionServiceImpl implements IProductOptionService{

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IProductOptionRepository proOptionRepository;

	@Autowired
	IProductRepository productRepository;
	
	@Override
	public List<ProductOptionEntity> findAllProductOption() {
		List<ProductOptionEntity> productOptions = new ArrayList<ProductOptionEntity>();
		try {
			productOptions = proOptionRepository.findAll();
			LOGGER.info("Lấy danh sách tùy chọn sản phẩm thành công!");
		} catch (Exception e) {
			LOGGER.info("Lấy danh sách tùy chọn sản phẩm thất bại!");
		}
		return productOptions;
	}

	@Override
	public ProductOptionEntity findByProductOption(Integer productOptionId) {
		ProductOptionEntity productOptionEntity = new ProductOptionEntity();
		try {
			productOptionEntity = proOptionRepository.findByProductOptionId(productOptionId);
			LOGGER.info("Lấy tùy chọn sản phẩm theo id thành công!");
		} catch (Exception e) {
			LOGGER.info("Lấy tùy chọn sản phẩm theo id thất bại");
		}
		return productOptionEntity;
	}

	@Override
	public ResponseDataModel addNewProductOption(ProductOptionEntity productOptionEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			ProductEntity productEntity = productRepository.checkExistesProductTest(productOptionEntity.getProductEntity().getProductId());
			if(productEntity != null) {
				proOptionRepository.saveAndFlush(productOptionEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới lựa chọn sản phẩm thành công!";
				data.put("productEntity", productEntity);
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy sản phẩm cần cập nhât!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới tùy chọn sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public ResponseDataModel updateProductOption(ProductOptionEntity productOptionEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			ProductEntity productEntity = productRepository.checkExistesProductTest(productOptionEntity.getProductEntity().getProductId());
			if(productEntity != null) {
				proOptionRepository.saveAndFlush(productOptionEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật thông tin tùy chọn sản phẩm thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy sản phẩm cần cập nhật!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật thông tin tùy chọn sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteProductOption(Integer productOptionId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		ProductOptionEntity productOptionEntity = findByProductOption(productOptionId);
		try {
			if(productOptionEntity != null) {
				proOptionRepository.deleteById(productOptionId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa tùy chọn của sản phẩm thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy tùy chọn sản phẩm cần xóa!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa tùy tùy chọn sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
}
