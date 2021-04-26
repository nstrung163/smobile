package com.smobile.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smobile.entity.BrandEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.BrandServiceImp;

@Controller
@RequestMapping(value = "/admin")
public class BrandController {
	
	@Autowired
	BrandServiceImp brandService;
	
//	@GetMapping(value = "/admin/brand-list")
//	public String initPage() {
//		return "admin/brand-admin";
//	}
	
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
	
	@PostMapping(value = "/brand/add")
	@ResponseBody
	public ResponseDataModel addNewBrand(@ModelAttribute BrandEntity brandEntity) {
		return brandService.addNewBrand(brandEntity);
	}
	
	@RequestMapping(value = "/brand/update", method = {RequestMethod.POST, RequestMethod.PUT})
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
