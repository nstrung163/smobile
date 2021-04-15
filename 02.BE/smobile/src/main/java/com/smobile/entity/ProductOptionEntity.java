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

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PRODUCT_OPTION")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductOptionEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODUCT_OPTION_ID", columnDefinition = "bigint")
	private Integer productOptionId;
	
	@Column(name = "COLOR_PRODUCT_NAME", columnDefinition = "nvarchar(50)", nullable = false)
	private String colorProductName;
	
	@Column(name = "MEMORY_PRODUCT", columnDefinition = "int", nullable = false)
	private int memoryProduct;
	
	@Column(name = "SALE_PRICE", columnDefinition = "double", nullable =  false)
	private double salePrice;
	
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID", nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private ProductEntity productEntity;
	
}
