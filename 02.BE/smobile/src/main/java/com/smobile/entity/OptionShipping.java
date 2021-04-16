package com.smobile.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "OPTION_SHIPPING")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OptionShipping {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OPTION_SHIPPING_ID", columnDefinition = "bigint")
	private Integer optionShippingId;
	
	@Column(name = "OPTION_SHIPPING_NAME", columnDefinition = "nvarchar(100)", nullable = false)
	private String optionShippingName;
	
	@Column(name = "OPTION_SHIPPING_FEE", columnDefinition = "double", nullable = false)
	private double optionShippingFee;
	
	@Column(name = "DESCRIPTION", columnDefinition = "text", nullable = false)
	private String description;
	
	@JsonIgnore
	@OneToOne(mappedBy = "optionShippingEntity", fetch = FetchType.LAZY)
	private PurchaseEntity purchaseEntity;
	
}
