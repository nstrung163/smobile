package com.smobile.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.ProductItemModel;
import com.smobile.repository.IProductCommentRepository;
import com.smobile.repository.IProductImageRepository;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.service.ICartService;

public class CartServiceImpl implements ICartService {

	@Autowired
	HttpSession session;

	@Autowired
	IProductRepository productRepository;

	@Autowired
	IProductCommentRepository productCommentRepository;

	@Autowired
	IProductOptionRepository productOptionRepository;

	@Autowired
	IProductImageRepository productImageRepository;

	@Override
	public void addProductViewed(Integer productId) {
		@SuppressWarnings("unchecked")
		Map<Integer, ProductItemModel> productsViewed = (HashMap<Integer, ProductItemModel>) session.getAttribute("productsViewed");
		ProductItemModel productItemModel = new ProductItemModel();
		if (productsViewed.isEmpty()) {
			productsViewed = new HashMap<Integer, ProductItemModel>();
			productItemModel = convertProductToProductItemModel(productId);
			productsViewed.put(productId, productItemModel);
		} else {
			// Check exist product in session productsViewed
			if(!productsViewed.containsKey(productId)) {
				productItemModel = convertProductToProductItemModel(productId);
				productsViewed.put(productId, productItemModel);
			}
		}
		session.setAttribute("productsViewed", productsViewed);
	}

	@Override
	public void removeProductViewed() {
		@SuppressWarnings("unchecked")
		Map<Integer, ProductItemModel> productsViewed = (HashMap<Integer, ProductItemModel>) session.getAttribute("productsViewed");
		if(!productsViewed.isEmpty()) {
			session.removeAttribute("productsViewed");
		}
	}

	@Override
	public ProductItemModel convertProductToProductItemModel(Integer productId) {
		ProductEntity product = productRepository.findByProductId(productId);
		int totalRate = productCommentRepository.getTotalRateByProductId(product.getProductId());
		float averagePointRate = 0;
		// Check product have rated?
		if (totalRate != 0) {
			averagePointRate = productCommentRepository.getAveragePointRate(product.getProductId());
		}
		double salePrice = product.getUnitPrice();
		// Check product exist and set sale price
		ProductOptionEntity productOptionEntity = productOptionRepository.findProductOptionByProductId(product.getProductId());
		if (productOptionEntity != null) {
			salePrice = productOptionRepository.getSalePriceDefault(product.getProductId());
		}
		String imageProduct = productImageRepository.getFirstImageUrlByProductId(product.getProductId());
		ProductItemModel productItemModel = new ProductItemModel(product, totalRate, averagePointRate, salePrice, imageProduct);
		return productItemModel;
	}

}
