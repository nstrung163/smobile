package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smobile.common.constant.Constants;
import com.smobile.convert.ObjectToModel;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.entity.PurchaseDetailEntity;
import com.smobile.entity.PurchaseEntity;
import com.smobile.model.CartModel;
import com.smobile.model.ProductItemModel;
import com.smobile.model.PurchaseModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IProductCommentRepository;
import com.smobile.repository.IProductImageRepository;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.repository.IPurchaseDetailRepository;
import com.smobile.repository.IPurchaseRepository;
import com.smobile.service.ICartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
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
	
	@Autowired
	IPurchaseRepository purchaseRepository;
	
	@Autowired
	IPurchaseDetailRepository purchaseDetailRepository;

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
					responseMsg = "Tăng số lượng sản phẩm thành công!";
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

	@Override
	public List<PurchaseModel> getAllPurchaseDetail() {
		String responseMsg = Strings.EMPTY;
		List<PurchaseModel> purchaseModelList = new ArrayList<PurchaseModel>();
		try {
			 purchaseModelList = ObjectToModel.convertToListPurchaseModel(purchaseRepository.getAllPurchaseDetail());
			if(purchaseModelList != null) {
				responseMsg = "Lấy danh sách hóa đơn chi tiết thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Lấy dánh sách hóa đơn chi tiết không thành công!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Lỗi khi lấy dánh sách hóa đơn chi tiết do: " + e.getMessage();
			log.warn(responseMsg);
		}
		return purchaseModelList;
	}

	@Override
	public List<PurchaseModel> getListHistoryBuy(Integer userId) {
		List<PurchaseModel>  listHistoryBuy = new ArrayList<PurchaseModel>();
		try {
			 listHistoryBuy = ObjectToModel.convertToListPurchaseModel(purchaseRepository.getListPurchaseDetailByUserId(userId));
			log.info("Lấy danh lịch sử mua hàng thành công!");
		} catch (Exception e) {
			log.error("Lấy danh sách lịch sửa mua hàng thất bại!" + e.getMessage());
		}
		return listHistoryBuy;
	}

	@Override
	public List<PurchaseModel> getPurchaseDetailById(Integer purchaseDetailId) {
		List<PurchaseModel> purchaseModelList = new ArrayList<PurchaseModel>();
		try {
			purchaseModelList = ObjectToModel.convertToListPurchaseModel(purchaseRepository.findPurchaseDetailById(purchaseDetailId));
			log.info("Lấy chi tiết hóa đơn theo mã CTHĐ thành công!");
		} catch (Exception e) {
			log.error("Lấy chi tiết hóa đơn theo mã CTHĐ không thành công");
		}
		return purchaseModelList;
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
				responseMsg = "Đặt hàng thành công!";
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
			responseMsg = "Đặt hàng không thành công do: " + e.getMessage();
			log.info(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg);
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

	@Override
	public ResponseDataModel addProductItemToCart(Integer productOptionId) {
		int repsonseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		try {
			@SuppressWarnings("unchecked")
			HashMap<Integer, CartModel> cartItems = (HashMap<Integer, CartModel>) session.getAttribute("cartItems");
			CartModel cartModel = new CartModel();
			if (cartItems == null) {
				cartItems = new HashMap<Integer, CartModel>();
				cartModel = addProductToCart(productOptionId);
			} else {
				if (cartItems.containsKey(productOptionId)) { // check product exists
					cartModel = cartItems.get(productOptionId);
					cartModel.setQuantity(cartModel.getQuantity() + 1);
				} else {
					cartModel = addProductToCart(productOptionId);
				}
			}

			cartItems.put(productOptionId, cartModel);
			session.setAttribute("cartItems", cartItems);
			session.setAttribute("totalItem", cartItems.size());
			session.setAttribute("totalPrice", CartModel.getTotalPrice(cartItems));
			
			responseMsg = "Thêm số sản phẩm vào giỏ thành công";
			repsonseCode = Constants.RESULT_CD_SUCCESS;
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "Thêm số sản phẩm vào giỏ không thành công do:" + e.getMessage();
			log.error(responseMsg);
		}
		return new ResponseDataModel(repsonseCode, responseMsg);
	}


}
