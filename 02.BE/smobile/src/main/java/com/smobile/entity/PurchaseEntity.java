package com.smobile.entity;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PURCHASE")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PURCHASE_ID", columnDefinition = "bigint")
	private Integer purchaseId;
	
	@Column(name = "DATE_OF_ORDER", columnDefinition = "date", nullable = false)
	private Date dateOfOrder;
	
	@Column(name = "FULL_NAME", columnDefinition = "nvarchar(200)")
	private String fullName;
	
	@Column(name = "PHONE_NUMBER", columnDefinition = "nvarchar(13)")
	private String phoneNumber;
	
	@Column(name = "NOTE_PURCHASE", columnDefinition = "nvarchar(200)")
	private String notePurchase;
	
	@Column(name = "DELIVERY_ADDRESS", columnDefinition = "nvarchar(200)")
	private String deliveryAddress;
	
	@JsonIgnoreProperties(value = "purchaseEntitySet")
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private UserEntity userEntity;
	
	@JsonIgnoreProperties(value = "purchaseEntitySet")
	@JoinColumn(name = "PAYMENT_METHOD_ID", referencedColumnName = "PAYMENT_METHOD_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private PaymentMethodEntity paymentMethodEntity;
	
	@JsonIgnoreProperties(value = "purchaseEntitySet")
	@JoinColumn(name = "PURCHASE_STATUS_ID", referencedColumnName = "PURCHASE_STATUS_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private PurchaseStatusEntity purchaseStatusEntity;
	
	@JsonIgnoreProperties(value = "purchaseEntitySet")
	@JoinColumn(name = "OPTION_SHIPPING_ID", referencedColumnName = "OPTION_SHIPPING_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private OptionShippingEntity optionShippingEntity;
	
	@JsonIgnore
	@OneToMany(mappedBy = "purchaseEntity", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<PurchaseDetailEntity> purchaseDetailSet;
}
