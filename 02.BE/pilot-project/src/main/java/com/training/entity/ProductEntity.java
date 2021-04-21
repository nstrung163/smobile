package com.training.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "PRODUCT")
public class ProductEntity {
	@Id
	@Column(name = "PRODUCT_ID", nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long productId;

	@Column(name = "PRODUCT_NAME", nullable = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String productName;

	@Column(name = "QUANTITY", nullable = true)
	private int quantity;

	@Column(name = "PRICE", nullable = true)
	private double price;

	@Column(name = "SALE_DATE", nullable = true)
	private Date saleDate;

	@Column(name = "IMAGE", nullable = true)
	private String image;

	@Transient
	private MultipartFile[] logoFiles;

	@Column(name = "DESCRIPTION", nullable = true)
	private String description;

	@JoinColumn(name = "BRAND_ID", referencedColumnName = "BRAND_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private BrandEntity brandEntity;

	public ProductEntity() {
	}

	/**
	 * @return the productId
	 */
	public Long getProductId() {
		return productId;
	}

	/**
	 * @param productId the productId to set
	 */
	public void setProductId(Long productId) {
		this.productId = productId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the saleDate
	 */
	public Date getSaleDate() {
		return saleDate;
	}

	/**
	 * @param saleDate the saleDate to set
	 */
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * @return the logoFiles
	 */
	public MultipartFile[] getLogoFiles() {
		return logoFiles;
	}

	/**
	 * @param logoFiles the logoFiles to set
	 */
	public void setLogoFiles(MultipartFile[] logoFiles) {
		this.logoFiles = logoFiles;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the brandEntity
	 */
	public BrandEntity getBrandEntity() {
		return brandEntity;
	}

	/**
	 * @param brandEntity the brandEntity to set
	 */
	public void setBrandEntity(BrandEntity brandEntity) {
		this.brandEntity = brandEntity;
	}

	
}
