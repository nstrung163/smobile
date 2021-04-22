package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductEntity;
import com.smobile.model.ProductItemModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductImageRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IRateProductRepository;
import com.smobile.service.IProductItemModelService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductItemModelServiceImpl implements IProductItemModelService{

	@Autowired
	IProductRepository productRepository;
	
	@Autowired
	IProductImageRepository productImageRepository;
	
	@Autowired
	IRateProductRepository rateRepository;

	@Override
	public ResponseDataModel findAllProductItem() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		try {
			List<ProductEntity> productList = productRepository.findAll();
			for (ProductEntity product : productList) {
				 int totalRate = rateRepository.getTotalRateByProductId(product.getProductId());
				 float averagePointRate = 0;
				 if(totalRate != 0) { // Check product have rated?
					 averagePointRate = rateRepository.getAveragePointRate(product.getProductId());
				 }
				 String imageProduct = productImageRepository.getFirstImageUrlByProductId(product.getProductId());
				 ProductItemModel productItem = new ProductItemModel(product, totalRate, averagePointRate, imageProduct);
				 productItemList.add(productItem);
			}
			if(productItemList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Lấy danh sách sản phẩm thành công!";
				data.put("productItemList", productItemList);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Lấy danh sách sản phẩm không thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public ResponseDataModel getProductOutstanding() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<ProductEntity> productList = productRepository.findProductOutstanding();
			if(productList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Lấy danh sách sản phẩm nổi bật thành công!";
				data.put("listProductOutstanding", productList);
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy sản phẩm!";
				log.info(responseMsg);
			}
		} catch (Exception e) { 
			responseMsg = "Lấy danh sách sản phẩm nổi bật thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}
	
	
}
