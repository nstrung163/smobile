package com.smobile.controller.admin;

import java.util.List;

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

import com.smobile.entity.PurchaseEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.PurchaseServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class PurchaseController {

	@Autowired
	PurchaseServiceImpl purchaseService;
	
	@GetMapping(value = "/purchases")
	@ResponseBody
	public List<PurchaseEntity> getAllPurchase() {
		return purchaseService.findAllPurchase();
	}
	
	@GetMapping(value = "/purchase/{id}")
	@ResponseBody
	public PurchaseEntity findByPurchaseId(@PathVariable(value = "id") Integer id) {
		return purchaseService.findByPurchaseId(id);
	}
	
	@PostMapping(value = "/purchase")
	@ResponseBody
	public ResponseDataModel addNewPurchase(@RequestBody PurchaseEntity purchaseEntity) {
		return purchaseService.addNewPurchase(purchaseEntity);
	}
	
	@PutMapping(value = "/purchase")
	@ResponseBody
	public ResponseDataModel updatePurchase(@RequestBody PurchaseEntity purchaseEntity) {
		return purchaseService.updatePurchase(purchaseEntity);
	}
	
	@DeleteMapping(value = "/purchase/{id}")
	@ResponseBody
	public ResponseDataModel deletePurchaseById(@PathVariable(value = "id") Integer id) {
		return purchaseService.deletePurchaseById(id);
	}
	
//	@PutMapping(value = "/purchase/{purchaseId}/{purchaseStatusId}")
//	@ResponseBody
//	public ResponseDataModel updateStatusPurchase(@PathVariable(value = "purchaseId") Integer purchaserId, @PathVariable(value = "purchaseStatusId") Integer purchaserStatusId) {
//		return purchaseService.updateStatusPurchase(purchaserId, purchaserStatusId);
//	}
}
