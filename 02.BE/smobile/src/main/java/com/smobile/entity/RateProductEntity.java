package com.smobile.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "RATE_PRODUCT")
public class RateProductEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RATE_ID", columnDefinition = "bigint")
	private Integer rateId;
	
	@Column(name = "RATE_NUMBER", columnDefinition = "int", nullable = false)
	private int rateNumber;
	
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private ProductEntity productEntity;
	
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private UserEntity userEntity;
	
}
