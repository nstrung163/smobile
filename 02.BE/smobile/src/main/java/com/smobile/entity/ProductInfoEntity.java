package com.smobile.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PRODUCT_INFO")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductInfoEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODUCT_INFO_ID", columnDefinition = "bigint")
	private Integer productInfoId;
	
	@Column(name = "SCREEN", columnDefinition = "nvarchar(150)", nullable = false)
	private String screen;
	
	@Column(name = "OPERATING_SYSTEM", columnDefinition = "nvarchar(150)", nullable = false)
	private String operatingSystem;
	
	@Column(name = "FRONT_CAMERA", columnDefinition = "nvarchar(150)", nullable = false)
	private String frontCamera;
	
	@Column(name = "REAR_CAMERA", columnDefinition = "nvarchar(150)", nullable = false)
	private String rearCamera;
	
	@Column(name = "CPU", columnDefinition = "nvarchar(150)", nullable = false)
	private String cpu;	
	
	@Column(name = "RAM", columnDefinition = "int", nullable = false)
	private int ram;
	
	@Column(name = "INTERNAL_MEMORY", columnDefinition = "int", nullable = false)
	private int internalMemory;
	
	@Column(name = "SIM", columnDefinition = "nvarchar(150)", nullable = false)
	private String sim;
	
	@Column(name = "BATTERY_CAPACITY", columnDefinition = "nvarchar(150)", nullable = false)
	private String batteryCapacity;
	
	@Column(name = "INTRODUCTION", columnDefinition = "text", nullable = true)
	private String introduction;
	
	@Column(name = "TYPE_PRODUCT", columnDefinition = "nvarchar(200)", nullable = false)
	private String typeProduct;
	
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
	@OneToOne(fetch = FetchType.EAGER)
	private ProductEntity productEntity;
	
}
