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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PURCHASE_DETAIL")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseDetailEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PURCHASE_DETAIL_ID", columnDefinition = "bigint")
	private Integer purchaseDetailId;

	@Column(name = "QUANTITY", columnDefinition = "int")
	private int quantity;

	@Column(name = "SALE_PRICE", columnDefinition = "double")
	private double salePrice;

	@JoinColumn(name = "PURCHASE_ID", referencedColumnName = "PURCHASE_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private PurchaseEntity purchaseEntity;
	
	@JsonIgnoreProperties(value = "brandEntity")
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private ProductEntity productEntity;
	
	@JsonIgnoreProperties(value = "productEntity")
	@JoinColumn(name = "PRODUCT_OPTION_ID", referencedColumnName = "PRODUCT_OPTION_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private ProductOptionEntity productOptionEntity;
	
}
