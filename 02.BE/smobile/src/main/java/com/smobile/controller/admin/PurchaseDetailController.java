package com.smobile.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;


import com.smobile.model.ResponseDataModel;
import com.smobile.entity.PurchaseDetailEntity;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.smobile.service.impl.PurchaseDetailServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/v1/api")
public class PurchaseDetailController {

	@Autowired
	PurchaseDetailServiceImpl purchaseDetailService;
	
	@GetMapping(value = "/purchase-details")
	@ResponseBody
	public List<PurchaseDetailEntity> getAllPurchaseDetail() {
		return purchaseDetailService.findAllPurchaseDetail();
	}
	
	@GetMapping(value = "/purchase-detail/{id}")
	@ResponseBody
	public PurchaseDetailEntity findByPurchaseDetailId(@PathVariable(value = "id") Integer id) {
		return purchaseDetailService.findByPurchaseDetailId(id);
	}
	
	@PostMapping(value = "/purchase-detail")
	@ResponseBody
	public ResponseDataModel addNewPurchaseDetail(@RequestBody PurchaseDetailEntity purchaseDetailEntity) {
		return purchaseDetailService.addNewPurchaseDetail(purchaseDetailEntity);
	}
	
	@PutMapping(value = "/purchase-detail")
	@ResponseBody
	public ResponseDataModel updatePurchase(@RequestBody PurchaseDetailEntity purchaseDetailEntity) {
		return purchaseDetailService.updatePurchaseDetail(purchaseDetailEntity);
	}
	
	@DeleteMapping(value = "/purchase-detail/{id}")
	@ResponseBody
	public ResponseDataModel deletePurchaseDetail(@PathVariable(value = "id") Integer id) {
		return purchaseDetailService.deletePurchaseDetailById(id);
	}
}
