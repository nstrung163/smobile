package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.convert.ObjectToModel;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.PageModel;
import com.smobile.model.ProductItemModel;
import com.smobile.model.ProductStatisticModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductCommentRepository;
import com.smobile.repository.IProductImageRepository;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.service.IProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	IProductRepository productRepository;
	
	@Autowired
	IProductCommentRepository productCommentRepository;
	
	@Autowired
	IProductOptionRepository productOptionRepository;
	
	@Autowired
	IProductImageRepository productImageRepository;
	
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
			log.error("Thêm mới sản phẩm thất bại: " + e.getMessage());
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
			log.error("Cập nhật sản phẩm thất bại: " + e.getMessage());
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
			log.error("Xóa sản phẩm thất bại: " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
	@Override
	public List<ProductStatisticModel> getListProductStatisticModel() {
		List<ProductStatisticModel> productStatisticModels = new ArrayList<ProductStatisticModel>();
		try {
			List<Object[]> productStatictisObject = productRepository.getListProductStatistic();
			productStatisticModels = ObjectToModel.convertToListProductStatistic(productStatictisObject);
			log.info("Lấy danh sách thống số lượng sản phẩm đã bán thành công!");
		} catch (Exception e) {
			log.warn("Thống kê số lượng sản phẩm đã bán không thành công do: " + e.getMessage());
		}
		return productStatisticModels;
	}

	@Override
	public ResponseDataModel findByProductNameContainingIgnoreCase(int pageNumber, String productName) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productModelList = new ArrayList<ProductItemModel>();
		try {
			Sort sortList = Sort.by(Sort.Direction.DESC, "unitPrice");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<ProductEntity> producEntitisPage = productRepository.findByProductNameContainingIgnoreCase(productName, pageable);
			List<ProductEntity> productList = producEntitisPage.getContent();
			productModelList = convertProductEntityToProductItemModel(productList);
			responseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "Tìm thấy " + productList.size() + " kết quả với từ khóa " + productName;
			data.put("totalResult", productList.size());
			data.put("keyword", productName);
			data.put("productList", productModelList);
			data.put("paginationList", new PageModel(pageNumber, producEntitisPage.getTotalPages()));
			log.info(responseMsg);
		} catch (Exception e) {
			log.error("Tìm kiếm sản phẩm thất bại do: " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public List<ProductItemModel> convertProductEntityToProductItemModel(List<ProductEntity> productList) {
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		for (ProductEntity product : productList) {
			 int totalRate = productCommentRepository.getTotalRateByProductId(product.getProductId());
			 float averagePointRate = 0;
			 // Check product have rated?
			 if(totalRate != 0) { 
				 averagePointRate = productCommentRepository.getAveragePointRate(product.getProductId());
			 }
			 double salePrice = product.getUnitPrice();
			 //Check product exist
			 ProductOptionEntity productOptionEntity = productOptionRepository.findProductOptionByProductId(product.getProductId());
			 if(productOptionEntity != null) {
				 salePrice = productOptionRepository.getSalePriceDefault(product.getProductId());
			 }
			 String imageProduct = productImageRepository.getFirstImageUrlByProductId(product.getProductId());
			 ProductItemModel productItem = new ProductItemModel(product, totalRate, averagePointRate, salePrice, imageProduct);
			 productItemList.add(productItem);
		}
		return productItemList;
	}

}
