package com.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.training.entity.BrandEntity;
import com.training.model.ResponseDataModel;
import com.training.service.IBrandService;

@Controller
@RequestMapping(value = "/brand")
public class BrandController {

	@Autowired
	IBrandService brandService;

	/**
	 * Init page
	 * 
	 * @param model
	 * 
	 */
	@GetMapping
	public String initIndexPage(Model model) {
		return "brand-index";
	}
	
	/**
	 * Find brand by id
	 * 
	 * @param brandId
	 * 
	 */
	@GetMapping("/api/find")
	@ResponseBody
	public ResponseDataModel findBrandByIdApi(@RequestParam("id") Long brandId) {
		return brandService.findBrandByIdApi(brandId);
	}
	
	/**
	 * Show list brand
	 * 
	 * @param pageNumber
	 * 
	 */
	@GetMapping("/api/findAll/{pageNumber}")
	@ResponseBody
	public ResponseDataModel findAllWithPageApi(@PathVariable("pageNumber") int pageNumber) {
		return brandService.findAllWithPageApi(pageNumber);
	}
	
	/**
	 * Add new brand
	 * 
	 * @param brandEntity
	 * 
	 */
	@PostMapping(value = "/api/add")
	@ResponseBody
	public ResponseDataModel addApi(@ModelAttribute BrandEntity brandEntity) {
		return brandService.addApi(brandEntity);
	}
	
	/**
	 * Update brand
	 * 
	 * @param brandEntity
	 * 
	 */
	@PostMapping(value = {"/api/update"})
	@ResponseBody 
	public ResponseDataModel updateApi(@ModelAttribute BrandEntity brandEntity) {
		return brandService.updateApi(brandEntity);
	}
	
	/**
	 *  Delete brand
	 *  
	 * @param brandId
	 * 
	 */
	@DeleteMapping(value = {"/api/delete/{brandId}"})
	@ResponseBody
	public ResponseDataModel deleteApi(@PathVariable("brandId") Long brandId) {
		return brandService.deleteApi(brandId);
	}
	
	/**
	 * Search brand
	 * 
	 * @param brandName
	 * @param pageNumber
	 * 
	 */
	@GetMapping(value = "/api/search/{brandName}/{pageNumber}")
	@ResponseBody
	public ResponseDataModel searchApi(@PathVariable("brandName") String brandName, @PathVariable("pageNumber") int pageNumber) {
		return brandService.searchApi(brandName, pageNumber);
	}
}
