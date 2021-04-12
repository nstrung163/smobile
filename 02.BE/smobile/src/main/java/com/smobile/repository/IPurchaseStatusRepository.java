package com.smobile.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smobile.entity.PurchaseStatusEntity;

public interface IPurchaseStatusRepository extends JpaRepository<PurchaseStatusEntity, Long> {

}
