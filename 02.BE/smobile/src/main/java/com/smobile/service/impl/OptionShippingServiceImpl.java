package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.entity.OptionShippingEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IOptionShippingRepository;
import com.smobile.service.IOptionShippingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OptionShippingServiceImpl implements IOptionShippingService{

	@Autowired
	IOptionShippingRepository optionShippingRepository;
	
	@Override
	public List<OptionShippingEntity> findAllOptionShipping() {
		List<OptionShippingEntity> optionShippings = new ArrayList<OptionShippingEntity>();
		try {
			optionShippings = optionShippingRepository.findAll();
			log.info("Lấy danh sách sản tùy chọn shipping thành công!");
		} catch (Exception e) {
			log.info("Lấy danh sách sản tùy chọn shipping thất bại!");
		}
		return optionShippings;
	}

	@Override
	public OptionShippingEntity findOptionShippingById(Integer optionShippingId) {
		OptionShippingEntity optionShippingEntity = new OptionShippingEntity();
		try {
			optionShippingEntity = optionShippingRepository.findByOptionShippingId(optionShippingId);
			log.info("Lấy lựa chọn shipping theo id thành công!");
		} catch (Exception e) {
			log.info("Lấy lựa chọn shipping theo id thất bại!");
		}
		return optionShippingEntity;
	}

	@Override
	public ResponseDataModel addNewOptionShipping(OptionShippingEntity optionShippingEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(optionShippingRepository.findByOptionShippingName(optionShippingEntity.getOptionShippingName()) != null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Tên phương thức chuyển hàng đã bị trùng!";
				log.warn(responseMsg);
			} else {
				optionShippingRepository.saveAndFlush(optionShippingEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới chuyển hàng thành công";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới phương thức chuyển hàng thất bại!";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateOptionShipping(OptionShippingEntity optionShippingEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			if(optionShippingRepository.
			   findByOptionShippingNameAndOptionShippingIdNot(optionShippingEntity.getOptionShippingName(), optionShippingEntity.getOptionShippingId()) != null) {
				responseCode = Constants.RESULT_CD_DUPL;
				responseMsg = "Tên phương thức chuyển hàng đã bị trùng!";
				log.warn(responseMsg);
			} else {
				optionShippingRepository.saveAndFlush(optionShippingEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Cật nhập phương thức chuyển hàng thành công!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cật nhật phương thức chuyển hàng thất bại!";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteOptionShippingById(Integer optionShippingId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			OptionShippingEntity optionShippingEntity = optionShippingRepository.findByOptionShippingId(optionShippingId);
			if(optionShippingEntity != null) {
				optionShippingRepository.deleteById(optionShippingId);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa phương thức chuyển hàng thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy phương thức chuyển hàng cần xóa!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Xóa phương thức chuyển hàng";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
