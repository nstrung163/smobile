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
import com.smobile.entity.BrandEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IBrandRepository;
import com.smobile.service.IBrandService;

@Service
public class BrandServiceImp implements IBrandService {
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Value("${parent.folder.images.brand}")
	private String brandLogoFolderPath;
	
	@Autowired
	IBrandRepository brandRepository;

	@Override
	public List<BrandEntity> findAllBrand() {
		return brandRepository.findAll();
	}

	@Override
	public ResponseDataModel addNewBrand(BrandEntity brandEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(brandRepository.findByBrandName(brandEntity.getBrandName()) != null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Tên nhãn hiệu đã tồn tại vui lòng nhập tên khác!";
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFile();
				if(logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.addNewFile(brandLogoFolderPath, logoFiles);
					brandEntity.setLogo(imagePath);
					brandRepository.saveAndFlush(brandEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Thêm mới nhãn hiệu thành công!";
				} else {
					responseMsg = "Vui lòng chọn ảnh cho nhãn hiệu!";
				}
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới nhãn hiệu thất bại!";
			LOGGER.error("Thêm mới nhãn hiệu thất bại! " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateBrand(BrandEntity brandEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(brandRepository.findByBrandNameAndBrandIdNot(brandEntity.getBrandName(), brandEntity.getBrandId()) != null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Tên nhãn hiệu đã tồn tại vui lòng nhập tên khác!";
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFile();
				if(logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.editFile(brandLogoFolderPath, logoFiles, brandEntity.getLogo());
					brandEntity.setLogo(imagePath);
					brandRepository.saveAndFlush(brandEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Cập nhật nhãn hiệu thành công!";
				} else {
					responseMsg = "Vui lòng chọn ảnh của nhãn hiệu!";
				}
			}
		} catch (Exception e) {
			LOGGER.error("Cập nhật nhãn hiệu thất bại! " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteBrandById(Integer brandId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		BrandEntity brandEntity = findByBrandId(brandId);
		try {
			if(brandEntity != null) {
				brandRepository.deleteById(brandId);
				brandRepository.flush();
				FileHelper.deleteFile(brandEntity.getLogo());
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa nhãn hiệu thành công!";
			} else {
				responseMsg = "Xóa nhãn hiệu thất bại!";
			}
		} catch (Exception e) {
			responseMsg = "Xóa nhãn hiệu thất bại!";
			LOGGER.error("Xóa nhãn hiệu thất bại! " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public BrandEntity findByBrandId(Integer bradId) {
		return brandRepository.findByBrandId(bradId);
	}

}
