package com.smobile.service;

import java.util.List;

import com.smobile.entity.OptionShippingEntity;
import com.smobile.model.ResponseDataModel;

public interface IOptionShippingService {

	/**
	 * 
	 * Get all option shipping
	 * 
	 * @return List<OptionShippingEntity>
	 */
	List<OptionShippingEntity> findAllOptionShipping();
	
	/**
	 * 
	 * Find option shipping by id
	 * 
	 * @param optionShippingId
	 * @return OptionShippingEntity
	 */ 
	OptionShippingEntity findOptionShippingById(Integer optionShippingId);
	
	/**
	 * 
	 * Add new option shipping 
	 * 
	 * @param optionShippingEntity
	 * @return ResponseDataModel
	 */
	ResponseDataModel addNewOptionShipping(OptionShippingEntity optionShippingEntity);
	
	/**
	 * 
	 * Update option shipping
	 * 
	 * @param optionShippingEntity
	 * @return ResponseDataModel
	 */ 
	ResponseDataModel updateOptionShipping(OptionShippingEntity optionShippingEntity);
	
	/**
	 * 
	 * Delete option shipping by id
	 * 
	 * @param optionShippingId
	 * @return ResponseDataModel
	 */
	ResponseDataModel deleteOptionShippingById(Integer optionShippingId);
	
}
