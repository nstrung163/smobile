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

import com.smobile.entity.OptionShippingEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.OptionShippingServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class OptionShippingController {
	
	@Autowired
	OptionShippingServiceImpl optionShippingService;
	
	@GetMapping(value = "/option-shippings")
	@ResponseBody
	public List<OptionShippingEntity> getAllOptionShipping() {
		return optionShippingService.findAllOptionShipping();
	}
	
	@GetMapping(value = "/option-shipping/{id}")
	@ResponseBody
	public OptionShippingEntity findOptionShippingById(@PathVariable(value = "id") Integer id) {
		return optionShippingService.findOptionShippingById(id);
	}
	
	@PostMapping(value = "/option-shipping")
	@ResponseBody
	public ResponseDataModel addNewOptionShipping(@RequestBody OptionShippingEntity optionShippingEntity) {
		return optionShippingService.addNewOptionShipping(optionShippingEntity);
	}
	
	@PutMapping(value = "/option-shipping")
	@ResponseBody
	public ResponseDataModel updateOptionShipping(@RequestBody OptionShippingEntity optionShippingEntity) {
		return optionShippingService.updateOptionShipping(optionShippingEntity);
	}
	
	@DeleteMapping(value = "/option-shipping/{id}")
	@ResponseBody
	public ResponseDataModel deleteOptionShipping(@PathVariable(value = "id") Integer id) {
		return optionShippingService.deleteOptionShippingById(id);
	}
}
