package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.OptionShippingEntity;
import com.smobile.entity.PaymentMethodEntity;
import com.smobile.entity.PurchaseDetailEntity;
import com.smobile.entity.PurchaseEntity;
import com.smobile.entity.PurchaseStatusEntity;
import com.smobile.entity.UserEntity;
import com.smobile.model.IPurchaseQuantity;
import com.smobile.model.IRevenuePrice;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IOptionShippingRepository;
import com.smobile.repository.IPaymentMethodRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IPurchaseDetailRepository;
import com.smobile.repository.IPurchaseRepository;
import com.smobile.repository.IPurchaseStatusRepository;
import com.smobile.repository.IUserRepository;
import com.smobile.service.IPurchaseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PurchaseServiceImpl implements IPurchaseService{
	
	@Autowired
	IPurchaseRepository purchaseRepository;
	
	@Autowired
	IUserRepository userRepository;
	
	@Autowired
	IPaymentMethodRepository paymentRepository;
	
	@Autowired
	IPurchaseStatusRepository purchaseStatusRepository;
	
	@Autowired
	IOptionShippingRepository optionShippingRepository;
	
	@Autowired
	IPurchaseDetailRepository purchaseDetailRepository;
	
	@Autowired
	IProductRepository productRepository;

	@Override
	public List<PurchaseEntity> findAllPurchase() {
		List<PurchaseEntity> purchaseList = new ArrayList<PurchaseEntity>();
		try {
			purchaseList = purchaseRepository.findAll();
			log.info("Lấy danh sách hóa đơn thành công!");
		} catch (Exception e) {
			log.error("Lấy danh sách hóa đơn thất bại!" + e.getMessage());
		}
		return purchaseList;
	}

	@Override
	public PurchaseEntity findByPurchaseId(Integer purchaseId) {
		PurchaseEntity purchaseEntity = new PurchaseEntity();
		try {
			purchaseEntity = purchaseRepository.findByPurchaseId(purchaseId);
			log.info("Lấy hóa đơn theo mã hóa đơn thành công!");
		} catch (Exception e) {
			log.error("Lấy hóa đơn theo mã hóa đơn thất bại!");
		}
		return purchaseEntity;
	}

	@Override
	public ResponseDataModel addNewPurchase(PurchaseEntity purchaseEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(userRepository.findByUserId(purchaseEntity.getUserEntity().getUserId()) != null &&
			   paymentRepository.findByPaymentMethodId(purchaseEntity.getPaymentMethodEntity().getPaymentMethodId()) != null &&
			   purchaseStatusRepository.findByPurchaseStatusId(purchaseEntity.getPurchaseStatusEntity().getPurchaseStatusId()) != null &&
			   optionShippingRepository.findByOptionShippingId(purchaseEntity.getOptionShippingEntity().getOptionShippingId()) != null) {
			   purchaseRepository.saveAndFlush(purchaseEntity);
			   responseCode = Constants.RESULT_CD_SUCCESS;
			   responseMsg = "Thêm mới hóa đơn thành công!";
			   log.info(responseMsg);
			} else {
				responseMsg = "Thông tin truyền vào hóa đơn không chính xác! ";
				log.error(responseMsg);
			}
			
		} catch (Exception e) {
			responseMsg = "Thêm mới hóa đơn thất bại! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updatePurchase(PurchaseEntity purchaseEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PaymentMethodEntity paymentMethodEntity = paymentRepository.findByPaymentMethodId(purchaseEntity.getPaymentMethodEntity().getPaymentMethodId());
			PurchaseStatusEntity purchaseStatusEntity = purchaseStatusRepository.findByPurchaseStatusId(purchaseEntity.getPurchaseStatusEntity().getPurchaseStatusId());
			UserEntity userEntity = userRepository.findByUserId(purchaseEntity.getUserEntity().getUserId());
			OptionShippingEntity optionShippingEntity = optionShippingRepository.findByOptionShippingId(purchaseEntity.getOptionShippingEntity().getOptionShippingId());
			if(paymentMethodEntity != null && purchaseStatusEntity != null && userEntity != null && optionShippingEntity != null) {
				purchaseEntity.setPaymentMethodEntity(paymentMethodEntity);
				purchaseEntity.setPurchaseStatusEntity(purchaseStatusEntity);
				purchaseEntity.setUserEntity(userEntity);
				purchaseEntity.setOptionShippingEntity(optionShippingEntity);
				try {
					purchaseRepository.saveAndFlush(purchaseEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Cập nhật hóa đơn thành công!";
					log.info(responseMsg);
				} catch (Exception e) {
					log.error("Lỗi khi cập nhật hóa đơn: " + e.getMessage());
				}
				
			} else {
				responseMsg = "Thông tin truyền vào hóa đơn không chính xác! ";
				log.warn(responseMsg);
			}
			
		} catch (Exception e) {
			responseMsg = "Cập nhật hóa đơn thất bại! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deletePurchaseById(Integer purchaseId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PurchaseEntity purchaseEntity = purchaseRepository.findByPurchaseId(purchaseId);
			List<PurchaseDetailEntity> purchaseDetailList = purchaseDetailRepository.getListPurchaseDetailByPurchaseId(purchaseId);
			if(purchaseEntity != null && purchaseDetailList != null && purchaseDetailList.size() != 0) {
				for(PurchaseDetailEntity purchaseDetail : purchaseDetailList) {
					purchaseDetailRepository.deleteById(purchaseDetail.getPurchaseDetailId());
				}
				purchaseRepository.deleteById(purchaseId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa hóa đơn thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy hóa đơn cần xóa!";
				log.error(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa hóa đơn thất bại! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateStatusPurchase(Integer purchaseId, Integer purchaseStatusId, int quantity, Integer purchaseDetailId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PurchaseEntity purchaseEntity = purchaseRepository.findByPurchaseId(purchaseId);
			PurchaseDetailEntity purchaseDetailEntity = purchaseDetailRepository.findByPurchaseDetailId(purchaseDetailId);
			PurchaseStatusEntity purchaseStatusEntity = purchaseStatusRepository.findByPurchaseStatusId(purchaseStatusId);
			if(purchaseEntity != null) {
				purchaseEntity.setPurchaseStatusEntity(purchaseStatusEntity); // Update purchase status
				purchaseRepository.saveAndFlush(purchaseEntity);
				purchaseDetailEntity.setQuantity(quantity); // Update quantity product
				purchaseDetailRepository.saveAndFlush(purchaseDetailEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật trạng thái hóa đơn thành công!";
				log.warn(responseMsg);
			} else {
				responseMsg = "Không tìm thấy hóa đơn!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cật nhật trạng thái hóa đơn thất bại do : " + e.getMessage();
			log.warn(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public List<IPurchaseQuantity> getListPurchaseQuantityEachMonth(Integer year) {
		List<IPurchaseQuantity> purchaseQuantities = new ArrayList<IPurchaseQuantity>();
		try {
			purchaseQuantities = purchaseRepository.getListPurchaseQuantityEachMonth(year);
			log.info("Lấy danh tổng số đơn đặt hằng mỗi tháng thành công!");
		} catch (Exception e) {
			log.warn("Lấy danh tổng số đơn đặt hằng mỗi tháng không thành công do: " + e.getMessage());
		}
		return purchaseQuantities;
	}

	@Override
	public List<IRevenuePrice> getListRevenueEachMonth(Integer year) {
		List<IRevenuePrice> revenuePrices = new ArrayList<IRevenuePrice>();
		try {
			revenuePrices = purchaseRepository.getListRevenuePriceEachMonth(year);
			log.info("Lấy danh sách tổng doanh thu theo tháng thàng công");
		} catch (Exception e) {
			log.info("Lấy danh sách tổng doanh thu theo tháng không thàng công do: " + e.getMessage());
		}
		return revenuePrices;
	}

}
