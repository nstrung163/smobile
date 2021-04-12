package com.smobile.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.entity.PurchaseStatusEntity;
import com.smobile.repository.IPurchaseStatusRepository;
import com.smobile.service.IPurchaseStatusService;

@Service
public class PuschaseStatusServiceImpl implements IPurchaseStatusService {

	@Autowired
	private IPurchaseStatusRepository purStatusRepository;
	
	@Override
	public PurchaseStatusEntity addNewPurStatus(PurchaseStatusEntity purStatus) {
		return purStatusRepository.saveAndFlush(purStatus);
	}

}
