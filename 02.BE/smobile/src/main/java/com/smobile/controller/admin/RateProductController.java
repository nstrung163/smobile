//package com.smobile.controller.admin;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.smobile.entity.RateProductEntity;
//import com.smobile.model.ResponseDataModel;
//import com.smobile.service.impl.RateProductServiceImpl;
//
//@Controller
//@RequestMapping(value = "/v1/api")
//public class RateProductController {
//
//	@Autowired
//	RateProductServiceImpl rateProductService;
//	
//	@GetMapping(value = "/rate-product-list")
//	@ResponseBody
//	public List<RateProductEntity> getAllRateProduct() {
//		return rateProductService.findAllRateProduct();
//	}
//	
//	@GetMapping(value = "/rate-product/{id}")
//	@ResponseBody
//	public RateProductEntity findByRateId(@PathVariable(value = "id") Integer id) {
//		return rateProductService.findByRateId(id);
//	}
//	
//	@PostMapping(value = "/rate-product")
//	@ResponseBody
//	public ResponseDataModel addNewRateProduct(@RequestBody RateProductEntity rateProductEntity) {
//		return rateProductService.addNewRateProduct(rateProductEntity);
//	}
//	
//	@PutMapping(value = "/rate-product")
//	@ResponseBody
//	public ResponseDataModel updateRateProduct(@RequestBody RateProductEntity rateProductEntity) {
//		return rateProductService.updateRateProduct(rateProductEntity);
//	}
//	
//	@DeleteMapping(value = "/rate-product/{id}")
//	@ResponseBody
//	public ResponseDataModel deleteRateProduct(@PathVariable(value = "id") Integer id) {
//		return rateProductService.deleteRateProductById(id);
//	}
//}
