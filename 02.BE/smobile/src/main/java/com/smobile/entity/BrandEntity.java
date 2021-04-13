package com.smobile.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "BRAND")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrandEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BRAND_ID", columnDefinition = "bigint")
	private Integer brandId;

	@Column(name = "BRAND_NAME", nullable = false, columnDefinition = "nvarchar(100)")
	private String brandName;

	@Column(name = "LOGO", nullable = false, columnDefinition = "text")
	private String logo;

	@Column(name = "DESCRIPTION", nullable = true, columnDefinition = "text")
	private String description;

	@Transient
	private MultipartFile[] logoFile;
	
}
