package com.smobile.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smobile.common.constant.Constants;
import com.smobile.common.util.FileHelper;
import com.smobile.entity.ProductImageEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductImageRepository;
import com.smobile.service.IProductImageService;

@Service
public class ProductImageServiceImpl implements IProductImageService{

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IProductImageRepository productImageRepository;
	
	@Value("${parent.folder.images.product}")
	private String productImagePathFolder;
	
	@Override
	public List<ProductImageEntity> findAllProductImage() {
		return productImageRepository.findAll();
	}
	
	@Override
	public ProductImageEntity findByProductImageId(Integer productImageId) {
		return productImageRepository.findByProductImageId(productImageId);
	}

	@Override
	public ResponseDataModel addProductImage(ProductImageEntity productImageEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			MultipartFile[] imagesFile = productImageEntity.getImagesFile();
			if(imagesFile != null && imagesFile[0].getSize() > 0) {
				for (int i = 0; i < imagesFile.length; i++) {
					ProductImageEntity productImageTemp = new ProductImageEntity();
					String imagePath = FileHelper.addNewFile(productImagePathFolder, imagesFile[i]);
					productImageTemp.setImageUrl(imagePath);
					productImageTemp.setProductEntity(productImageEntity.getProductEntity());
					productImageRepository.saveAndFlush(productImageTemp);
					LOGGER.info("Thêm mới ảnh thứ " + (i + 1) + " cho sản phẩm thành công!");
				}
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm ảnh cho sản phẩm hoàn tất!";
			} else {
				responseMsg = "Vui lòng chọn ảnh cho sản phẩm!";
			}
		} catch (Exception e) {
			responseMsg = "Thêm ảnh cho sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	/**
	 * Chỉ update 1 ảnh 1 lần
	 */
	@Override
	public ResponseDataModel updateProductImage(ProductImageEntity productImageEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			MultipartFile[] imageFile = productImageEntity.getImagesFile();
			if(imageFile != null && imageFile[0].getSize() > 0) {
				String imagePath = FileHelper.editFile(productImagePathFolder, imageFile, productImageEntity.getImageUrl());
				productImageEntity.setImageUrl(imagePath);
				productImageRepository.saveAndFlush(productImageEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật ảnh sản phẩm thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Vui lòng chọn ảnh cho sản phẩm";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Chỉnh sửa ảnh cho sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteProductImage(Integer productImageId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			ProductImageEntity productImgTemp = findByProductImageId(productImageId);
			if(productImgTemp != null) {
				productImageRepository.deleteById(productImageId);
				productImageRepository.flush();
				FileHelper.deleteFile(productImgTemp.getImageUrl());
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa ảnh của sản phẩm thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Sản phẩm không tồn tại!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa ảnh của sản phẩm thất bại!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
