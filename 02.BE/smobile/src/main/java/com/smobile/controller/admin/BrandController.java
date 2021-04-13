package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.BrandEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.BrandServiceImp;

@Controller
@RequestMapping(value = "/v1/api")
public class BrandController {
	
	@Autowired
	BrandServiceImp brandService;
	
	@GetMapping(value = "/brands")
	@ResponseBody
	public List<BrandEntity> getAllBrands() {
		return brandService.findAllBrand();
	}
	
	@GetMapping(value = "/brand/{id}")
	@ResponseBody
	public BrandEntity findByBrandId(@PathVariable(value = "id") Integer id) {
		return brandService.findByBrandId(id);
	}
	
	@PostMapping(value = "/brand")
	@ResponseBody
	public ResponseDataModel addNewBrand(@ModelAttribute BrandEntity brandEntity) {
		return brandService.addNewBrand(brandEntity);
	}
	
	@PutMapping(value = "/brand")
	@ResponseBody
	public ResponseDataModel updateBrand(@ModelAttribute BrandEntity brandEntity) {
		return brandService.updateBrand(brandEntity);
	}
	
	@DeleteMapping(value = "/brand/{id}")
	@ResponseBody
	public ResponseDataModel deleteBrandById(@PathVariable(value = "id") Integer id) {
		return brandService.deleteBrandById(id);
	}

}
