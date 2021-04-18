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

import com.smobile.entity.PaymentMethodEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.PaymentMethodServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class PaymentMethodController {
	
	@Autowired
	PaymentMethodServiceImpl paymentService;
	
	@GetMapping(value = "/payment-methods")
	@ResponseBody
	public List<PaymentMethodEntity> getAllPaymentMethod() {
		return paymentService.findAllPaymentMethod();
	}
	
	@GetMapping(value = "/payment-method/{id}")
	@ResponseBody
	public PaymentMethodEntity findByPaymentMethodId(@PathVariable(value = "id") Integer id) {
		return paymentService.findByPaymentMethodId(id);
	}
	
	@PostMapping(value = "/payment-method")
	@ResponseBody
	public ResponseDataModel addNewPayment(@RequestBody PaymentMethodEntity paymentMethodEntity) {
		return paymentService.addNewPaymentMethod(paymentMethodEntity);
	}
	
	@PutMapping(value = "/payment-method")
	@ResponseBody
	public ResponseDataModel updatePayment(@RequestBody PaymentMethodEntity paymentMethodEntity) {
		return paymentService.updatePaymentMethod(paymentMethodEntity);
	}
	
	@DeleteMapping(value = "/payment-method/{id}")
	@ResponseBody
	public ResponseDataModel deletePaymentMethodById(@PathVariable(value = "id") Integer id) {
		return paymentService.deletePaymentMethod(id);
	}

}
