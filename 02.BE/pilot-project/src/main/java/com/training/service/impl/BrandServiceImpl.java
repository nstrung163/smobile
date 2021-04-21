package com.training.service.impl;

import java.util.HashMap;
import java.util.List;
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
import com.training.dao.IBrandDao;
import com.training.entity.BrandEntity;
import com.training.model.PageModel;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

@Service
public class BrandServiceImpl implements IBrandService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Value("${parent.folder.images.brand}")
	private String brandLogoFolderPath;

	@Autowired
	IBrandDao brandDao;

	@Override
	public BrandEntity findByBrandName(String brandName) {
		return brandDao.findByBrandName(brandName);
	}
	
	//	Find all brand
	@Override
	public ResponseDataModel findAllWithPageApi(int pageNumber) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<>();
		try {
			Sort sortList = Sort.by(Sort.Direction.DESC, "brandId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<BrandEntity> brandEntitiesPage = brandDao.findAll(pageable);
			responseMap.put("brandsList", brandEntitiesPage.getContent());
			responseMap.put("paginationList", new PageModel(pageNumber, brandEntitiesPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Error when get all brand", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}

	@Override

	//  Search brand by brand name
	public ResponseDataModel searchApi(String brandName , int pageNumber) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> responseMap = new HashMap<String, Object>();
		try {
			Sort sortList = Sort.by(Sort.Direction.DESC, "brandId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<BrandEntity> brandEntitesPage = brandDao.findByBrandNameLike("%" + brandName + "%", pageable);
			responseMap.put("brandsList", brandEntitesPage.getContent());
			responseMap.put("paginationList", new PageModel(pageNumber, brandEntitesPage.getTotalPages()));
			responseCode = Constants.RESULT_CD_SUCCESS;
			if ( brandEntitesPage.getTotalElements() > 0) {
				responseMsg = "The number of brand found is " + brandEntitesPage.getTotalElements() + " brand";
			} else {
				responseMsg = "The " + brandName + " is not exist!";
			}
		} catch (Exception e) {
			responseMsg = e.getMessage();
			LOGGER.error("Search brand name failed:",e);
		}
		return new ResponseDataModel(responseCode, responseMsg, responseMap);
	}
	
	//  Find brand by id
	@Override
	public ResponseDataModel findBrandByIdApi(Long brandId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		BrandEntity brandEntity = null;
		try {
			brandEntity = brandDao.findByBrandId(brandId);
			if (brandEntity != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error when finding brand by ID";
			LOGGER.error("Error when finding brand by ID: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg, brandEntity);
	}

	//	Add new brand
	@Override
	public ResponseDataModel addApi(BrandEntity brandEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if (findByBrandName(brandEntity.getBrandName()) != null) {
				responseMsg = "Brand name have been exist!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFiles();
				if (logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.addNewFile(brandLogoFolderPath, logoFiles);
					brandEntity.setLogo(imagePath);
				}
				brandDao.saveAndFlush(brandEntity);
				responseMsg = "Add new brand successfully";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error. Can't add new brand!";
			LOGGER.error("Error. Can't add new brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	// Update brand
	@Override
	public ResponseDataModel updateApi(BrandEntity brandEntity) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			/* Check brand name duplicated */
			if (brandDao.findByBrandNameAndBrandIdNot(brandEntity.getBrandName(), brandEntity.getBrandId()) != null) {
				responseMsg = "Brand name have been exist!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				MultipartFile[] logoFiles = brandEntity.getLogoFiles();
				if (logoFiles != null && logoFiles[0].getSize() > 0) {
					String imagePath = FileHelper.editFile(brandLogoFolderPath, logoFiles, brandEntity.getLogo());
					brandEntity.setLogo(imagePath);
				}
			}
			brandDao.saveAndFlush(brandEntity);
			responseMsg = "Update brand is successfully!";
			responseCode = Constants.RESULT_CD_SUCCESS;

		} catch (Exception e) {
			responseMsg = "Error. Can't update brand";
			LOGGER.error("Error. Can't update brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	// Delete brand
	@Override
	public ResponseDataModel deleteApi(Long brandId) {

		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		BrandEntity brandEntity = brandDao.findByBrandId(brandId);
		try {
			if (brandEntity != null) {
				brandDao.deleteById(brandId);
				brandDao.flush();
				FileHelper.deleteFile(brandEntity.getLogo());
				responseMsg = "Delete brand successfully!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Error! Can't delete brand.";
			LOGGER.error("Can't delete brand: ", e);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	/*
	 * // Search brand
	 * 
	 * @Override public ResponseDataModel searchApi(String brandName , int
	 * pageNumber) {
	 * 
	 * List<BrandEntity> brandsList = brandDao.findByBrandNameLike("%" + brandName +
	 * "%"); int responseCode = Constants.RESULT_CD_FAIL; String responseMsg =
	 * StringUtils.EMPTY; Map<String, Object> responseMap = new HashMap<String,
	 * Object>(); try { Sort sortList = Sort.by(Sort.Direction.DESC, "brandId");
	 * Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE,
	 * sortList);
	 * 
	 * int start = (int) pageable.getOffset(); int end = (start +
	 * pageable.getPageSize()) > brandsList.size() ? brandsList.size() : (start +
	 * pageable.getPageSize()); Page<BrandEntity> brandEntitesPage = new
	 * PageImpl<BrandEntity>(brandsList.subList(start, end), pageable,
	 * brandsList.size()); responseMap.put("brandsList",
	 * brandEntitesPage.getContent()); responseMap.put("paginationList", new
	 * PageModel(pageNumber, brandEntitesPage.getTotalPages())); if
	 * (brandsList.size() > 0) { responseMsg = "The number of results found is " +
	 * brandsList.size() + " brand!"; } else { responseMsg =
	 * "The brand isn't exist!"; } responseCode = Constants.RESULT_CD_SUCCESS; }
	 * catch (Exception e) { responseMsg = e.getMessage();
	 * LOGGER.error("Search brand name failed:",e); } return new
	 * ResponseDataModel(responseCode, responseMsg, responseMap); }
	 */

	// Get all brand and sort DESC 
	@Override
	public List<BrandEntity> getAll() {
		return brandDao.findAll(Sort.by(Sort.Direction.DESC, "brandId"));
	}
	
}
