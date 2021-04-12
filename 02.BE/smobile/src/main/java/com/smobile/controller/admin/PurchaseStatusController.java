package com.smobile.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.PurchaseStatusEntity;
import com.smobile.service.impl.PuschaseStatusServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class PurchaseStatusController {

	@Autowired
	private PuschaseStatusServiceImpl purChaseStatusService;
	
	@PutMapping(value = "/products")
	@ResponseBody
	public PurchaseStatusEntity addNewPurStatus(PurchaseStatusEntity purStatus) {
		return purChaseStatusService.addNewPurStatus(purStatus);
	}
}
