package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.OptionShippingEntity;

public interface IOptionShippingRepository extends JpaRepository<OptionShippingEntity, Integer>{

	OptionShippingEntity findByOptionShippingId(Integer optionShippingId);
	
	OptionShippingEntity findByOptionShippingName(String optionShippingName);
	
	OptionShippingEntity findByOptionShippingNameAndOptionShippingIdNot(String optionShippingName, Integer optionShippingId);
}
