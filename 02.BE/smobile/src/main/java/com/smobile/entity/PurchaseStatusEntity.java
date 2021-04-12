package com.smobile.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;

@Entity
@Table(name = "PURCHASE_STATUS")
@Data
@AllArgsConstructor
public class PurchaseStatusEntity {

	@Id
	@Column(name = "PURCHASE_STATUS_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long purchaseStatusId;
	
	@Column(name = "PURCHASE_STATUS_NAME", nullable = false)
	private String purchaseStatusName;
}
