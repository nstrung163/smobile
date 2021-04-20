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
import com.smobile.entity.BrandEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IBrandRepository;
import com.smobile.service.IBrandService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BrandServiceImp implements IBrandService {
	
	@Value("${parent.folder.images.brand}")
	private String brandLogoFolderPath;
	
	@Autowired
	IBrandRepository brandRepository;

	@Override
	public List<BrandEntity> findAllBrand() {
		List<BrandEntity> brandList = new ArrayList<BrandEntity>();
		try {
			brandList = brandRepository.findAll();
			log.info("Lấy danh sách nhãn hiệu thành công!");
		} catch (Exception e) {
			log.error("Lấy danh sách nhãn hiệu thất bại!");
		}
		return brandList;
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
			log.error("Thêm mới nhãn hiệu thất bại! " + e.getMessage());
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
				} 
				brandRepository.saveAndFlush(brandEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật nhãn hiệu thành công!";
			}
		} catch (Exception e) {
			log.error("Cập nhật nhãn hiệu thất bại! " + e.getMessage());
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
			log.error("Xóa nhãn hiệu thất bại! " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public BrandEntity findByBrandId(Integer bradId) {
		BrandEntity brandEntity = new BrandEntity();
		try {
			brandEntity = brandRepository.findByBrandId(bradId);
			log.info("Tìm kiếm nhãnhiệu theo id thành công!");
		} catch (Exception e) {
			log.error("Tìm kiếm nhãn hiệu theo id không thành công!");
		}
		return brandEntity;
	}

}
