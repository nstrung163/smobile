package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smobile.common.constant.Constants;
import com.smobile.common.util.FileHelper;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.service.IProductOptionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductOptionServiceImpl implements IProductOptionService{

	@Value("${parent.folder.images.product}")
	private String productOptionPathFolder;
	
	@Autowired
	IProductOptionRepository productOptionRepository;

	@Autowired
	IProductRepository productRepository;
	
	@Override
	public List<ProductOptionEntity> findAllProductOption() {
		List<ProductOptionEntity> productOptions = new ArrayList<ProductOptionEntity>();
		try { 
			productOptions = productOptionRepository.findAll();
			log.info("Lấy danh sách tùy chọn sản phẩm thành công!");
		} catch (Exception e) {
			log.info("Lấy danh sách tùy chọn sản phẩm thất bại!");
		}
		return productOptions;
	}

	@Override
	public ProductOptionEntity findByProductOption(Integer productOptionId) {
		ProductOptionEntity productOptionEntity = new ProductOptionEntity();
		try {
			productOptionEntity = productOptionRepository.findByProductOptionId(productOptionId);
			log.info("Lấy tùy chọn sản phẩm theo id thành công!");
		} catch (Exception e) {
			log.info("Lấy tùy chọn sản phẩm theo id thất bại");
		}
		return productOptionEntity;
	}

	@Override
	public ResponseDataModel addNewProductOption(ProductOptionEntity productOptionEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		log.info("Bắt đầu thêm mới tùy chọn sản phẩm");
		try {
			MultipartFile imageFile = productOptionEntity.getImageFile();
			if(imageFile != null && imageFile.getSize() > 0) {
				String imageUrl = FileHelper.addNewFile(productOptionPathFolder, imageFile);
				productOptionEntity.setImageUrl(imageUrl);
				productOptionRepository.saveAndFlush(productOptionEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới lựa chọn sản phẩm thành công!";
				log.info(responseMsg);
				} else {
					responseMsg = "Vui lòng chọn ảnh cho sản phẩm!";
					log.warn(responseMsg);
				}
		} catch (Exception e) {
			responseMsg = "Thêm mới tùy chọn sản phẩm thất bại!";
			log.error(responseMsg + e.getMessage());
		}
		log.info("Kết thúc thêm mới tùy chọn sản phẩm");
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateProductOption(ProductOptionEntity productOptionEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		log.info("Bắt đầu cập nhật tùy chọn sản phẩm");
		try {
			MultipartFile imageFile = productOptionEntity.getImageFile();
			if(imageFile != null && imageFile.getSize() > 0) {
				String imageUrl = FileHelper.editFile(productOptionPathFolder, imageFile, productOptionEntity.getImageUrl());
				productOptionEntity.setImageUrl(imageUrl);
			}
			productOptionRepository.saveAndFlush(productOptionEntity);
			responseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "Cập nhật thông tin tùy chọn sản phẩm thành công!";
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "Cập nhật thông tin tùy chọn sản phẩm thất bại!";
			log.error(responseMsg + e.getMessage());
		}
		log.info("Kết thúc cập nhật tùy chọn sản phẩm");
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteProductOption(Integer productOptionId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		log.info("Bắt đầu xóa tùy chọn sản phẩm");
		ProductOptionEntity productOptionEntity = findByProductOption(productOptionId);
		try {
			if(productOptionEntity != null) {
				productOptionRepository.deleteById(productOptionId);
				productOptionRepository.flush();
				FileHelper.deleteFile(productOptionEntity.getImageUrl());
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa tùy chọn của sản phẩm thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy tùy chọn sản phẩm cần xóa!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa tùy tùy chọn sản phẩm thất bại!";
			log.error(responseMsg + e.getMessage());
		}
		log.info("Kết thúc xóa tùy chọn sản phẩm");
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
}
