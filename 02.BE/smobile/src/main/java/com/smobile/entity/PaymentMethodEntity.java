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
@Table(name = "PAYMENT_METHOD")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentMethodEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PAYMENT_METHOD_ID", columnDefinition = "bigint")
	private Integer paymentMethodId;

	@Column(name = "PAYMENT_METHOD_NAME", columnDefinition = "nvarchar(100)", nullable = false)
	private String paymentMethodName;
	
	@JsonIgnore
	@OneToOne(mappedBy = "paymentMethodEntity", fetch = FetchType.LAZY)
	private PurchaseEntity purchaseEntity;

}
