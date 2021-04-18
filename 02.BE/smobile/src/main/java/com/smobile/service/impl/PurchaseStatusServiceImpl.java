package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.PurchaseStatusEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IPurchaseStatusRepository;
import com.smobile.service.IPurchaseStatusService;

@Service
public class PurchaseStatusServiceImpl implements IPurchaseStatusService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IPurchaseStatusRepository purStatusRepository;

	@Override
	public List<PurchaseStatusEntity> findAllPurchaseStatus() {
		List<PurchaseStatusEntity> purchaseStatusList = new ArrayList<PurchaseStatusEntity>();
		try {
			purchaseStatusList = purStatusRepository.findAll();
			LOGGER.info("Lấy danh sách trạng thái hóa đơn thành công!");
		} catch (Exception e) {
			LOGGER.error("Lấy danh sách hóa đơn thất bại!");
		}
		return purchaseStatusList;
	}

	
	@Override
	public ResponseDataModel addNewPurStatus(PurchaseStatusEntity purStatus) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(findByPurchaseStatusName(purStatus.getPurchaseStatusName()) != null) {
				responseMsg = "Trạng thái đơn hàng đã tồn tại vui lòng chọn tên khác!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				purStatusRepository.saveAndFlush(purStatus);
				responseMsg = "Thêm mới trạng thái đơn hàng thành công!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Can't add new purchse status!";
			LOGGER.info("Error when add new our purchase status");
			System.out.println("Can't add new purchase stauts " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public PurchaseStatusEntity findByPurchaseStatusName(String purStatusName) {
		return purStatusRepository.findByPurchaseStatusName(purStatusName);
	}

	@Override
	public ResponseDataModel updatePurStatus(PurchaseStatusEntity purStatus) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(findByPurchaseStatusName(purStatus.getPurchaseStatusName()) != null &&
			   findByPurchaseStatusId(purStatus.getPurchaseStatusId()) != null) {
				responseMsg = "Trạng thái đơn hàng đã trùng vui lòng chọn tên khác!";
				responseCode = Constants.RESULT_CD_DUPL;
			} else {
				purStatusRepository.saveAndFlush(purStatus);
				responseMsg = "Cập nhật trạng thái đơn hàng thành công!";
				responseCode = Constants.RESULT_CD_SUCCESS;
			}
		} catch (Exception e) {
			responseMsg = "Không thể cập nhật trạng thái đơn hàng!";
			LOGGER.info("Lỗi khi cập nhật đơn hàng");
			System.out.println("Không thể cập nhật trạng thái đơn hàng: " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public PurchaseStatusEntity findByPurchaseStatusId(Integer pusStatusId) {
		return purStatusRepository.findByPurchaseStatusId(pusStatusId);
	}

	@Override
	public ResponseDataModel deletePurStatusById(Integer pusStatusId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(findByPurchaseStatusId(pusStatusId) != null) {
				purStatusRepository.deleteById(pusStatusId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa trạng thái đơn hàng thành công!";
			} else {
				responseMsg = "Xóa trạng thái đơn hàng thất bại!";
			}
		} catch (Exception e) {
			LOGGER.info("Lỗi khi xóa trạng thái đơn hàng!");
			System.out.println("Không thể xóa trạng thái đơn hàng vì " + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}


}
