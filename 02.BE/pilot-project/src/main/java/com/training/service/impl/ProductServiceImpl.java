package com.training.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.training.common.constant.Constants;
import com.training.common.util.FileHelper;
import com.training.dao.IProductDao;
import com.training.entity.ProductEntity;
import com.training.model.PageModel;
import com.training.model.ResponseDataModel;
import com.training.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Value("${parent.folder.images.product}")
	private String productLogoFolderPath;

	@Autowired
	IProductDao productDao;
	
	//	List all products
	@Override
	public ResponseDataModel findAllProductWithPage(int pageNumber) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		try {
			Sort sortList = Sort.by(Sort.Direction.DESC, "productId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<ProductEntity> productEntitiesPage = productDao.findAll(pageable);
			responseMap.put("productsList", productEntitiesPage.getContent());
			responseMap.put("paginationList", new PageModel(pageNumber, productEntitiesPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error when get all products", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}
	
	//	Add new product
	@Override
	public ResponseDataModel addProduct(ProductEntity productEntity) {
		
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if ( findByProductName(productEntity.getProductName()) != null) {
				responseMsg = "Product name have been exist!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] imageFiles = productEntity.getLogoFiles();
				if ( imageFiles != null && imageFiles[0].getSize() > 0) {
					String imagePath = FileHelper.addNewFile(productLogoFolderPath, imageFiles);
					productEntity.setImage(imagePath);
				}
				productDao.saveAndFlush(productEntity);
				responseMsg = "Add new product successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error. Can't add new product";
			LOGGER.error("Cant't add new product! Error:", e);
		} 
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
	//	Find product by name
	@Override
	public ProductEntity findByProductName(String productName) {
		return productDao.findByProductName(productName);
	}
	
	//	Update product
	@Override
	public ResponseDataModel updateProduct(ProductEntity productEntity) {
		int responseCode = Constants.RESULT_CD_SUCCESS;
		String  responseMsg = StringUtils.EMPTY;
		try {
			if(productDao.findByProductNameAndProductIdNot(productEntity.getProductName(), productEntity.getProductId()) != null) {
				responseMsg = "Product name have been exist!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = productEntity.getLogoFiles();
				if ( logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.editFile(productLogoFolderPath, logoFiles, productEntity.getImage());
					productEntity.setImage(imagePath);
				}
			}
			productDao.saveAndFlush(productEntity);
			responseMsg = "Update product is successfully!";
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMsg = "Error. Can't update product!";
			LOGGER.error("Can't update product. Error:",e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
	//	Find product by id 
	@Override
	public ResponseDataModel findProductById(Long productId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		ProductEntity productEntity = null;
		try {
			productEntity = productDao.findByProductId(productId);
			if ( productEntity != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error. Can't get find product by id";
			LOGGER.error("Can't find product by id! Error: ",e);
		}
		return new ResponseDataModel(responseCode, responseMsg, productEntity);
	}
	
	//	Delete product
	@Override
	public ResponseDataModel deleteProduct(Long productId) {
		
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		ProductEntity productEntity = productDao.findByProductId(productId);
		try {
			if (productEntity != null) {
				productDao.deleteById(productId);
				productDao.flush();
				FileHelper.deleteFile(productEntity.getImage());
				responseMsg = "Delete product successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error. Can't delete product.";
			LOGGER.error("Can't delete product. Error:",e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
	// Search product with conditions
	@Override
	public ResponseDataModel searchProductWithConditions(Map<String, Object> searchConditions, int pageNumber) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<String, Object>();
		try { 	
			Sort sortList = Sort.by(Sort.Direction.DESC,"productId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<ProductEntity> productEntitesPage = productDao.findAll(IProductDao.getSearchCondition(searchConditions),pageable);
			responseMap.put("productsList", productEntitesPage.getContent());
			responseMap.put("paginationList", new PageModel(pageNumber, productEntitesPage.getTotalPages()));
			if ( productEntitesPage.getTotalElements() > 0) {
				responseMsg = "The number of product found is " + productEntitesPage.getTotalElements() + " product";
			} else {
				responseMsg = "There is no product found out";
			}
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error! Search brand name or product name by price is failed: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}
}
