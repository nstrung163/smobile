package com.smobile.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.PurchaseStatusEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.PuschaseStatusServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class PurchaseStatusController {

	@Autowired
	private PuschaseStatusServiceImpl purChaseStatusService;
	
	@PostMapping(value = "/pruchase-status")
	@ResponseBody
	public ResponseDataModel addNewPurStatus(@RequestBody PurchaseStatusEntity purStatus) {
		return purChaseStatusService.addNewPurStatus(purStatus);
	}
	
	@GetMapping(value = "/pruchase-status/{id}")
	@ResponseBody
	public PurchaseStatusEntity findPurchaseStatusById(@PathVariable("id") Integer id) {
		return purChaseStatusService.findByPurchaseStatusId(id);
	}
	
	@PutMapping(value = "/pruchase-status")
	@ResponseBody
	public ResponseDataModel updatePurStatus(@RequestBody PurchaseStatusEntity purStatus) {
		return purChaseStatusService.updatePurStatus(purStatus);
	}
	
	@DeleteMapping(value = "/purchase-status/{id}")
	@ResponseBody
	public ResponseDataModel deletePurchaseStatus(@PathVariable(value = "id") Integer id) {
		return purChaseStatusService.deletePurStatusById(id);
	}
	
	
}
