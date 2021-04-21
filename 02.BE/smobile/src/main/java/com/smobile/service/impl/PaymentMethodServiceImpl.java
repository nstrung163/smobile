package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.PaymentMethodEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IPaymentMethodRepository;
import com.smobile.service.IPaymentMethodService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentMethodServiceImpl implements IPaymentMethodService {

	@Autowired
	IPaymentMethodRepository paymentRepository;

	@Override
	public List<PaymentMethodEntity> findAllPaymentMethod() {
		List<PaymentMethodEntity> paymentMethods = new ArrayList<PaymentMethodEntity>();
		try {
			paymentMethods = paymentRepository.findAll();
			log.info("Lấy danh sách phương thức thanh toán thành công!");
		} catch (Exception e) {
			log.error("Lấy danh sách phương thức thanh toán thất bại!");
		}
		return paymentMethods;
	}

	@Override
	public PaymentMethodEntity findByPaymentMethodId(Integer payMethodId) {
		PaymentMethodEntity paymentMethodEntity = new PaymentMethodEntity();
		try {
			paymentMethodEntity = paymentRepository.findByPaymentMethodId(payMethodId);
			log.info("Lấy phương thức thanh toán theo id thành công!");
		} catch (Exception e) {
			log.error("Lấy phương thức thanh toán theo id thất bại!");
		}
		return paymentMethodEntity;
	}

	@Override
	public ResponseDataModel addNewPaymentMethod(PaymentMethodEntity paymentMethodEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(paymentRepository.findByPaymentMethodName(paymentMethodEntity.getPaymentMethodName()) != null) {
				responseMsg = "Tên của phương thức thanh toán đã bị trùng!";
				responseCode = Constants.RESULT_CD_DUPL;
				log.warn(responseMsg);
			} else {
				paymentRepository.saveAndFlush(paymentMethodEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới phương thức thanh toán thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới phương thức thanh toán thất bại!";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updatePaymentMethod(PaymentMethodEntity paymentMethodEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(paymentRepository.findByPaymentMethodNameAndPaymentMethodIdNot(paymentMethodEntity.getPaymentMethodName(), paymentMethodEntity.getPaymentMethodId()) != null) {
				responseMsg = "Tên của phương thức thanh toán đã bị trùng!";
				responseCode = Constants.RESULT_CD_DUPL;
				log.warn(responseMsg);
			} else {
				paymentRepository.saveAndFlush(paymentMethodEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cập nhật phương thức thanh toán thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật phương thức thanh toán thất bại!";
			log.warn(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deletePaymentMethod(Integer payMethodId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			PaymentMethodEntity paymentMethodEntity = paymentRepository.findByPaymentMethodId(payMethodId);
			if(paymentMethodEntity != null) {
				paymentRepository.deleteById(payMethodId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xoá phương thức thanh toán thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy phương thức thanh toán!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa phương thức thanh toán thất bại!";
			log.warn(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}
	
	
}
