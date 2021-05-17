package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.model.ProductStatisticModel;
import com.smobile.model.PurchaseModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.ICartService;
import com.smobile.service.IProductResponseService;
import com.smobile.service.IProductService;
import com.smobile.service.IPurchaseDetailService;
import com.smobile.service.IPurchaseService;

@Controller
@RequestMapping(value = "/admin")
public class HomeAdminControllerApi {

	@Autowired
	IProductResponseService productResponseService;
	
	@Autowired
	IPurchaseService purchaseService;
	
	@Autowired
	IPurchaseDetailService purchaseDetailService;
	
	@Autowired
	ICartService cartService;
	
	@Autowired
	IProductService productService;
	
	@GetMapping(value = "/purchase-details")
	@ResponseBody
	public List<PurchaseModel> getAllPurchaseDetail() {
		return cartService.getAllPurchaseDetail();
	}
	
	@GetMapping(value = "/purchase-detail/{id}")
	@ResponseBody
	public List<PurchaseModel> findPurchaseDetailById(@PathVariable(value = "id") Integer id) {
		return cartService.getPurchaseDetailById(id);
	}
	
	@RequestMapping(value = "/purchase-detail/update", method = {RequestMethod.POST, RequestMethod.PUT})
	@ResponseBody
	public ResponseDataModel updatePurchaseDetail(@ModelAttribute PurchaseModel purchaseModel) {
		System.out.println("Giá trị purchaseModel là: " + purchaseModel.toString());
		return purchaseService.updateStatusPurchase(purchaseModel.getPurchaseId(), Integer.valueOf(purchaseModel.getPurchaseStatusName()));
	}
	
	@DeleteMapping(value = "/purchase-detail/{id}")
	@ResponseBody
	public ResponseDataModel deletePurchaseDetailById(@PathVariable(value = "id") Integer id) {
		return purchaseDetailService.deletePurchaseDetailById(id);
	}
	
	@GetMapping(value = "/statistic/products")
	@ResponseBody
	public List<ProductStatisticModel> getListProductStatistic() {
		return productService.getListProductStatisticModel();
	}
}
