package com.training.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.training.entity.BrandEntity;

@Repository
public interface IBrandDao extends JpaRepository<BrandEntity, Long> {

	/**
	 * Find by  brand by brand name
	 * 
	 * @param brandName
	 * @return brand
	 */
	BrandEntity findByBrandName(String brandName);
	
	
	/**
	 * Find by  brand by brand id
	 * 
	 * @param brandId
	 * @return brand
	 */
	BrandEntity findByBrandId(Long brandId); 
	
	/**
	 * Find by  brand by brand name and not brand id
	 * 
	 * @param brandName
	 * @param brandId
	 * @return brand
	 */
	BrandEntity findByBrandNameAndBrandIdNot(String brandName, Long brandId);
	
	/**
	 * Find by  brand by brand name like
	 * 
	 * @param brandName
	 * @param pageable
	 */
	Page<BrandEntity> findByBrandNameLike(String brandName, Pageable pageable);
	
}
