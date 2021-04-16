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
@Table(name = "PURCHASE")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PURCHASE_ID", columnDefinition = "bigint")
	private Integer purchaseId;
	
	@Column(name = "DATE_OF_ORDER", columnDefinition = "date")
	private Date dateOfOrder;
	
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private UserEntity userEntity;
	
	@JoinColumn(name = "PAYMENT_METHOD_ID", referencedColumnName = "PAYMENT_METHOD_ID")
	@OneToOne(fetch = FetchType.EAGER)
	private PaymentMethodEntity paymentMethodEntity;
	
	@JoinColumn(name = "PURCHASE_STATUS_ID", referencedColumnName = "PURCHASE_STATUS_ID")
	@OneToOne(fetch = FetchType.EAGER)
	private PurchaseStatusEntity purchaseStatusEntity;
	
	@JoinColumn(name = "OPTION_SHIPPING_ID", referencedColumnName = "OPTION_SHIPPING_ID")
	@OneToOne(fetch = FetchType.EAGER)
	private OptionShipping optionShippingEntity;
	
	@JsonIgnore
	@OneToMany(mappedBy = "purchaseEntity", fetch = FetchType.LAZY)
	private Set<PurchaseDetail> purchaseDetailSet;
}
