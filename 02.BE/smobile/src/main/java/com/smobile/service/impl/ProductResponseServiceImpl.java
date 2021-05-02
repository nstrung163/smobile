package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.convert.ObjectToModel;
import com.smobile.entity.ProductCommentEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductInfoEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.entity.PurchaseDetailEntity;
import com.smobile.entity.PurchaseEntity;
import com.smobile.model.CartModel;
import com.smobile.model.ProductCommentModel;
import com.smobile.model.ProductDetailModel;
import com.smobile.model.ProductItemModel;
import com.smobile.model.ProductMemoryPriceModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductCommentRepository;
import com.smobile.repository.IProductImageRepository;
import com.smobile.repository.IProductInfoRepository;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IPurchaseDetailRepository;
import com.smobile.repository.IPurchaseRepository;
import com.smobile.repository.IRateProductRepository;
import com.smobile.service.IProductResponseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductResponseServiceImpl implements IProductResponseService{

	@Autowired
	IProductRepository productRepository;
	
	@Autowired
	IProductImageRepository productImageRepository;
	
	@Autowired
	IRateProductRepository rateRepository;
	
	@Autowired
	IProductInfoRepository productInfoRepository;
	
	@Autowired
	IProductOptionRepository productOptionRepository;
	
	@Autowired
	IProductCommentRepository productCommentRepository;
	
	@Autowired
	IPurchaseRepository purchaseRepository;
	
	@Autowired
	IPurchaseDetailRepository purchaseDetailRepository;
	
	@Autowired
	HttpSession session;

	@Override
	public ResponseDataModel findAllProductItem() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		try {
			List<ProductEntity> productList = productRepository.findAll();
			for (ProductEntity product : productList) {
				 int totalRate = rateRepository.getTotalRateByProductId(product.getProductId());
				 float averagePointRate = 0;
				// Check product have rated?
				 if(totalRate != 0) { 
					 averagePointRate = rateRepository.getAveragePointRate(product.getProductId());
				 }
				 double salePrice = product.getUnitPrice();
				//Check product exist
				 ProductOptionEntity productOptionEntity = productOptionRepository.findProductOptionByProductId(product.getProductId());
				 if(productOptionEntity != null) {
					 salePrice = productOptionRepository.getSalePriceDefault(product.getProductId());
				 }
				 String imageProduct = productImageRepository.getFirstImageUrlByProductId(product.getProductId());
				 ProductItemModel productItem = new ProductItemModel(product, totalRate, averagePointRate, salePrice, imageProduct);
				 productItemList.add(productItem);
			}
			if(productItemList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Lấy danh sách sản phẩm thành công!";
				data.put("productItemList", productItemList);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Lấy danh sách sản phẩm không thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	// Get product outstanding title
	@Override
	public ResponseDataModel getProductOutstanding() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<ProductEntity> productAllList = productRepository.findAll();
			int totalProduct = productAllList.size();
			List<ProductEntity> productList = productRepository.findProductOutstanding();
			if(productList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Lấy danh sách sản phẩm nổi bật thành công!";
				data.put("listProductOutstanding", productList);
				data.put("totalProduct", totalProduct);
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy sản phẩm!";
				log.info(responseMsg);
			}
		} catch (Exception e) { 
			responseMsg = "Lấy danh sách sản phẩm nổi bật thành công! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	// Get data for product detail page
	@Override
	public ResponseDataModel findProductDetailById(Integer productId) {
		int repsonseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			ProductEntity productEntity = productRepository.findByProductId(productId);
			int totalRate = rateRepository.getTotalRateByProductId(productId);
			float averagePointRate = 0;
			if(totalRate != 0) {
				averagePointRate = rateRepository.getAveragePointRate(productId);
			}
			List<String> imagesUrl = productImageRepository.getListImageByProductId(productId);
			ProductInfoEntity productInfoEntity = productInfoRepository.findByProductId(productId);
			ProductOptionEntity productOptionEntity = productOptionRepository.findProductOptionByProductId(productId);
			List<ProductCommentEntity> productCommentList = productCommentRepository.getListProductCommentByProductId(productId);
			List<ProductMemoryPriceModel> productMemoryPriceModels = ObjectToModel.convertToListProductMemoryPrice(productOptionRepository.getListProductByMemoryPrice(productId));
			ProductDetailModel productDetailModel = new ProductDetailModel(productEntity, totalRate, averagePointRate, imagesUrl, productInfoEntity, productOptionEntity, productCommentList, productMemoryPriceModels);
			List<ProductOptionEntity> productOptionListByPriceAndId = productOptionRepository.findByMemoryAndProductId(productOptionEntity.getMemoryProduct(), productId);
			List<ProductCommentModel> productCommentModels = ObjectToModel.convertToListProductCommentModel(productCommentRepository.getProductCommentModel(productId));
			
			data.put("productDetailModel", productDetailModel);
			data.put("productOptionListByPriceAndId", productOptionListByPriceAndId);
			data.put("productCommentModels", productCommentModels);
			repsonseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "Lấy dữ liệu cho trang chi tiết sản phẩm thành công";
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "Lấy dữ liệu cho trang chi tiết sản phẩm không thành công ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(repsonseCode, responseMsg, data);
	}

	@Override
	public ResponseDataModel getListProductOptionByMemoryAndProductId(int memoryProduct, Integer productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<ProductOptionEntity> productOptionList = productOptionRepository.findByMemoryAndProductId(memoryProduct, productId);
			if(productOptionList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Lấy danh sách sản phẩm theo bộ nhớ trong và product_Id thành công!";
				data.put("productOptionList", productOptionList);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Lấy danh sách sản phẩm theo bộ nhớ trong và product_id không thành công!";
			log.info(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public CartModel addProductToCart(Integer productOptionId) {
		CartModel cartModel = new CartModel();
		try {
			ProductEntity productEntity = productRepository.findProductByProductOptionId(productOptionId);
			ProductOptionEntity productOptionEntity  = productOptionRepository.findByProductOptionId(productOptionId);
			double salePrice = productOptionEntity.getSalePrice();
			String productName = productEntity.getProductName() + " "  + productOptionEntity.getColorProductName() + " " + productOptionEntity.getMemoryProduct() +" GB";
			String imageUrl = productOptionEntity.getImageUrl();
			cartModel = new CartModel(productOptionId, productEntity, 1, salePrice, productName, imageUrl);
			log.error("Tạo sản phẩm để thêm vào cart thành công!");
		} catch (Exception e) {
			log.error("Tạo sản phẩm để thêm vào cart thất bại! " + e.getMessage());
		}
		return cartModel;
	}

	@Override
	public ResponseDataModel checkoutCart(PurchaseEntity purchaseEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		@SuppressWarnings("unchecked")
		HashMap<Integer, CartModel> cartItems =(HashMap<Integer, CartModel>) session.getAttribute("cartItems");
		try {
			// Create purchase entity
			if(purchaseEntity != null) {
				purchaseRepository.saveAndFlush(purchaseEntity);
				responseCode = Constants.RESULT_CD_SUCCESS;
				// Add purchase detail into purchase just created above
				if(!cartItems.isEmpty()) {
					PurchaseEntity purchaseCart = purchaseRepository.findPurchaseJustCreated();
					for(Map.Entry<Integer, CartModel> cartItem : cartItems.entrySet()) {
						ProductOptionEntity productOptionEntity = productOptionRepository.findByProductOptionId(cartItem.getValue().getProductOptionId());
						PurchaseDetailEntity purchaseDetailEntity = new PurchaseDetailEntity(null , cartItem.getValue().getQuantity(), cartItem.getValue().getSalePrice(), purchaseCart, cartItem.getValue().getProductEntity(), productOptionEntity);
						purchaseDetailRepository.saveAndFlush(purchaseDetailEntity);
						//Update quantity of product after checkout
						ProductEntity productEntity = cartItem.getValue().getProductEntity();
						productEntity.setQuantity(productEntity.getQuantity() - purchaseDetailEntity.getQuantity());
						if(productEntity.getQuantity() - purchaseDetailEntity.getQuantity() == 0) {
							productEntity.setStatusProduct("Hết hàng");
						}
						productRepository.saveAndFlush(productEntity);
					}
				}
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Thêm mới hóa đơn mua hàng thành công!";
				log.info(responseMsg);
				// Remove session relate to cart
				session.removeAttribute("cartItems");
				session.removeAttribute("totalItem");
				session.removeAttribute("totalPrice");
			} else {
				responseMsg = "Không tìm thấy đối tượng hóa đơn mua hàng: ";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Thêm mới hóa đơn mua hàng không thành công do: " + e.getMessage();
			log.info(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel addProductQuantity(Integer productOptionId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		try {
			@SuppressWarnings("unchecked")
			HashMap<Integer, CartModel> cartItems = (HashMap<Integer, CartModel>) session.getAttribute("cartItems");
			CartModel cartModel = new CartModel();
			if(cartItems.containsKey(productOptionId)) {
				cartModel = cartItems.get(productOptionId);
				ProductEntity productEntity = productRepository.findByProductId(cartModel.getProductEntity().getProductId());
				if(productEntity.getQuantity() < cartModel.getQuantity() + 1) {
					responseMsg = "Số lượng sản trong kho không đủ để đáp ứng. Vui lòng liên hệ 19001919 để đặt hàng!";
					log.warn(responseMsg);
				} else {
					cartModel.setQuantity(cartModel.getQuantity() + 1);
					cartItems.put(productOptionId, cartModel);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Chỉnh sửa số lượng sản phẩm thành công!";
					log.info(responseMsg);
				}
			}
			session.setAttribute("cartItems", cartItems);
			session.setAttribute("totalItem", cartItems.size());
			session.setAttribute("totalPrice", CartModel.getTotalPrice(cartItems));
		} catch (Exception e) {
			responseMsg = "Thêm số lượng sản phẩm cho hóa đơn không thành công do: " + e.getMessage();
			log.info(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

//	@Override
//	public ResponseDataModel getListHistoryBuy(Integer userId) {
//		int responseCode = Constants.RESULT_CD_FAIL;
//		String responseMsg = Strings.EMPTY;
//		try {
//			List<Object[]> listHistoryBuy = purchaseRepository.getListPurchaseDetailByUserId(userId);
//			System.out.println("Số lượng sản phẩm đã mua là: " + listHistoryBuy.size());
//			log.info(responseMsg);
//		} catch (Exception e) {
//			responseMsg = "Lấy danh sách lịch sửa mua hàng thất bại!";
//			log.error(responseMsg);
//		}
//		return new ResponseDataModel(responseCode, responseMsg);
//	}
}
