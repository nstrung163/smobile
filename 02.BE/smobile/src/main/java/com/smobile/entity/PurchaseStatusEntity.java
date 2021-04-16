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
@Table(name = "PURCHASE_STATUS")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseStatusEntity {

	@Id
	@Column(name = "PURCHASE_STATUS_ID", columnDefinition = "bigint")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer purchaseStatusId;

	@Column(name = "PURCHASE_STATUS_NAME", nullable = false, columnDefinition = "nvarchar(50)")
	private String purchaseStatusName;
	
	@JsonIgnore
	@OneToOne(mappedBy = "purchaseStatusEntity", fetch = FetchType.LAZY)
	private PurchaseEntity purchaseEntity;

}
