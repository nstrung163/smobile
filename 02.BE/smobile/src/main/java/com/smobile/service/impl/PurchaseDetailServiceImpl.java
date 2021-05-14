package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.entity.PurchaseDetailEntity;
import com.smobile.entity.PurchaseEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IPurchaseDetailRepository;
import com.smobile.repository.IPurchaseRepository;
import com.smobile.service.IPurchaseDetailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PurchaseDetailServiceImpl implements IPurchaseDetailService{
	
	@Autowired
	IPurchaseDetailRepository purchaseDetailRepository;
	
	@Autowired
	IPurchaseRepository purchaseRepository;
	
	@Autowired
	IProductRepository productRepository;
	
	@Autowired
	IProductOptionRepository productOptionRepository;
	
	@Override
	public List<PurchaseDetailEntity> findAllPurchaseDetail() {
		List<PurchaseDetailEntity> purchaseDetailList = new ArrayList<PurchaseDetailEntity>();
		try {
			purchaseDetailList = purchaseDetailRepository.findAll();
			log.info("Lấy danh sách hóa đơn mua hàng thành công!");
		} catch (Exception e) {
			log.error("Lấy danh sách hóa đơn mua hành thất bại: " + e.getMessage());
		}
		return purchaseDetailList;
	}

	@Override
	public PurchaseDetailEntity findByPurchaseDetailId(Integer purchaseDetailId) {
		PurchaseDetailEntity purchaseDetailEntity = new PurchaseDetailEntity();
		try {
			purchaseDetailEntity = purchaseDetailRepository.findByPurchaseDetailId(purchaseDetailId);
			log.info("Tìm kiếm chi tiết hóa đơn theo id thành công!");
		} catch (Exception e) {
			log.error("Tìm kiếm chi tiết hóa đơn mua hàng theo id thất bại: " + e.getMessage());
		}
		return purchaseDetailEntity;
	}

	@Override
	public ResponseDataModel addNewPurchaseDetail(PurchaseDetailEntity purchaseDetailEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PurchaseEntity purchaseEntity = purchaseRepository.findByPurchaseId(purchaseDetailEntity.getPurchaseEntity().getPurchaseId());
			ProductEntity productEntity  = productRepository.findByProductId(purchaseDetailEntity.getProductEntity().getProductId());
			ProductOptionEntity productOptionEntity = productOptionRepository.findByProductOptionId(purchaseDetailEntity.getProductOptionEntity().getProductOptionId());
			if(purchaseEntity == null) {
				responseMsg = "Hóa đơn mua hàng không tồn tại!";
				log.warn(responseMsg);
			} else if(productEntity == null) {
				responseMsg = "Sản phẩm không tồn tại!";
				log.warn(responseMsg);
			} else if(productOptionEntity == null) {
				responseMsg = "Tùy chọn của sản phẩm không tồn tại!";
				log.warn(responseMsg);
			} else {
				purchaseDetailRepository.saveAndFlush(purchaseDetailEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới chi tiết hóa đơn thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới chi tiết hóa đơn thất bại! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updatePurchaseDetail(PurchaseDetailEntity purchaseDetailEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PurchaseEntity purchaseEntity = purchaseRepository.findByPurchaseId(purchaseDetailEntity.getPurchaseEntity().getPurchaseId());
			ProductEntity productEntity  = productRepository.findByProductId(purchaseDetailEntity.getProductEntity().getProductId());
			ProductOptionEntity productOptionEntity = productOptionRepository.findByProductOptionId(purchaseDetailEntity.getProductOptionEntity().getProductOptionId());
			if(purchaseEntity == null) {
				responseMsg = "Hóa đơn mua hàng không tồn tại!";
				log.warn(responseMsg);
			} else if(productEntity == null) {
				responseMsg = "Sản phẩm không tồn tại!";
				log.warn(responseMsg);
			} else if(productOptionEntity == null) {
				responseMsg = "Tùy chọn của sản phẩm không tồn tại!";
				log.warn(responseMsg);
			} else {
				purchaseDetailRepository.saveAndFlush(purchaseDetailEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật hóa đơn chi tiết thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật hóa đơn chi tiết thất bại! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deletePurchaseDetailById(Integer purchaseDetailId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PurchaseDetailEntity purchaseDetailEntity = purchaseDetailRepository.findByPurchaseDetailId(purchaseDetailId);
			if(purchaseDetailEntity != null) {
				purchaseDetailRepository.deleteById(purchaseDetailId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa chi tiết hóa đơn thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy chi tiết hóa đơn cần xóa!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa chi tiết hóa đơn thất bại! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
}
