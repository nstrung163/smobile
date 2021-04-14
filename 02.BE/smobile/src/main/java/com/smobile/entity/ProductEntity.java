package com.smobile.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PRODUCT")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODUCT_ID", columnDefinition = "bigint")
	private Integer productId;
	
	@Column(name = "PRODUCT_NAME", columnDefinition = "nvarchar(100)", nullable = false)
	private String productName;
	
	@Column(name = "UNIT_PRICE", columnDefinition = "double", nullable = false)
	private double unitPrice;
	
	@Column(name = "QUANTITY", columnDefinition = "int", nullable = false)
	private int quantity;
	
	@Column(name = "SALE_DATE", columnDefinition = "date", nullable = false)
	private Date saleDate;
	
	@Column(name = "STATUS_PRODUCT", columnDefinition = "nvarchar(45)", nullable = false)
	private String statusProduct;
	
	@JoinColumn(name = "BRAND_ID", referencedColumnName = "BRAND_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private BrandEntity brandEntity;
	
	@JsonIgnore
	@OneToOne(mappedBy = "productEntityInfo", fetch = FetchType.LAZY)
	private ProductInfoEntity productInfoEntity;
	
	@JsonIgnore
	@OneToMany(mappedBy = "productEntity", fetch = FetchType.LAZY)
	private Set<ProductImageEntity> productImageSet;
	
}
