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

import com.smobile.entity.ProductCommentEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.service.impl.ProductCommentServiceImpl;

@Controller
@RequestMapping(value = "/v1/api")
public class ProductCommentController {

	@Autowired
	ProductCommentServiceImpl productCommentService;
	
	@GetMapping(value = "/comments")
	@ResponseBody
	public List<ProductCommentEntity> getAllProductComment() {
		return productCommentService.findAllProductComment();
	}
	
	@GetMapping(value = "/comment/{id}")
	@ResponseBody
	public ProductCommentEntity findByCommentId(@PathVariable(value = "id") Integer id) {
		return productCommentService.findByCommentId(id);
	}
	
	@GetMapping(value = "/comment/product/{id}")
	@ResponseBody
	public List<ProductCommentEntity> getListCommentByProductId(@PathVariable(value = "id") Integer id) {
		return productCommentService.findByProductId(id);
	}
	
	@PostMapping(value = "/comment")
	@ResponseBody
	public ResponseDataModel addNewComment(@RequestBody ProductCommentEntity productCommentEntity) {
		return productCommentService.addNewComment(productCommentEntity);
	}
	
	@PutMapping(value = "/comment")
	@ResponseBody
	public ResponseDataModel updateComment(@RequestBody ProductCommentEntity productCommentEntity) {
		return productCommentService.updateComment(productCommentEntity);
	}
	
	@DeleteMapping(value = "/comment/{id}") 
	@ResponseBody
	public ResponseDataModel deleteCommentById(@PathVariable(value = "id") Integer id) {
		return productCommentService.deleteCommentById(id);
	}
	
}
