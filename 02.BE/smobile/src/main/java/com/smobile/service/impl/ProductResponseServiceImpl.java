package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smobile.common.constant.Constants;
import com.smobile.common.util.FileHelper;
import com.smobile.convert.ObjectToModel;
import com.smobile.entity.ProductCommentEntity;
import com.smobile.entity.ProductEntity;
import com.smobile.entity.ProductInfoEntity;
import com.smobile.entity.ProductOptionEntity;
import com.smobile.model.PageModel;
import com.smobile.model.ProductCommentModel;
import com.smobile.model.ProductDetailModel;
import com.smobile.model.ProductItemModel;
import com.smobile.model.ProductMemoryPriceModel;
import com.smobile.model.ResponseDataModel;
import com.smobile.model.SearchCondition;
import com.smobile.repository.IProductCommentRepository;
import com.smobile.repository.IProductImageRepository;
import com.smobile.repository.IProductInfoRepository;
import com.smobile.repository.IProductOptionRepository;
import com.smobile.repository.IProductRepository;
import com.smobile.service.IProductResponseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductResponseServiceImpl implements IProductResponseService{

	@Value("${parent.folder.images.comment}")
	private String commentFolderPath;
	
	@Autowired
	IProductRepository productRepository;
	
	@Autowired
	IProductImageRepository productImageRepository;
	
	@Autowired
	IProductInfoRepository productInfoRepository;
	
	@Autowired
	IProductOptionRepository productOptionRepository;
	
	@Autowired
	IProductCommentRepository productCommentRepository;
	
	@Autowired
	HttpSession session;

	@Override
	public ResponseDataModel findAllProductItem() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		try {
			List<ProductEntity> productList = productRepository.findAllProductItem();
			productItemList = convertProductEntityToProductItemModel(productList);
			if(productItemList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "L???y danh s??ch s???n ph???m th??nh c??ng!";
				data.put("productItemList", productItemList);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "L???y danh s??ch s???n ph???m kh??ng th??nh c??ng! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}
	
	@Override
	public ResponseDataModel getTenProductDiscountHighest() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		try {
			List<ProductEntity> productList = productRepository.getTenProductDiscountHighest();
			productItemList = convertProductEntityToProductItemModel(productList);
			if(productItemList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "L???y danh s??ch s???n ph???m gi???m gi?? cao nh???t th??nh c??ng!";
				data.put("productItemList", productItemList);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "L???y danh s??ch s???n ph???m gi???m gi?? cao nh???t th??nh c??ng! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}
	
	@Override
	public ResponseDataModel findAllProductApi(int pageNumber) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		try {
			// Add list order sort by total rate and average rate
//			List<Order> orders = new ArrayList<Sort.Order>();
//			Order orderTotalRate = new Order(Sort.Direction.DESC, "PM.TOTAL_RATE");
//			orders.add(orderTotalRate);
//			Order orderAverageRate = new Order(Sort.Direction.DESC, "PM.AVERAGE_RATE");
//			orders.add(orderAverageRate);
//			Sort sortList = Sort.by(orders);
			Sort sortList = Sort.by(Sort.Direction.ASC, "productId");
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<ProductEntity> productEntitiesPage =  productRepository.findAll(pageable);
			List<ProductEntity> productList = productEntitiesPage.getContent();
			productItemList = convertProductEntityToProductItemModel(productList);
			if(productItemList != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "L???y danh s??ch s???n ph???m th??nh c??ng!";
				data.put("productItemList", productItemList);
				data.put("paginationList", new PageModel(pageNumber, productEntitiesPage.getTotalPages()));
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "L???y danh s??ch s???n ph???m kh??ng th??nh c??ng! " + e.getMessage();
			log.error(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}
	
	@Override
	public ResponseDataModel getSearchCondition(SearchCondition searchCondition, int pageNumber) {
		int responseCode = Constants.RESULT_CD_FAIL; 
		String responseMsg = Strings.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		try {
			Sort sortList = null;
			if(searchCondition.getSortBy().equals("ASC")) {
				 sortList = Sort.by(Sort.Direction.ASC, "unitPrice");
			} else {
				 sortList = Sort.by(Sort.Direction.DESC, "unitPrice");
			}
			Pageable pageable = PageRequest.of(pageNumber - 1, Constants.PAGE_SIZE, sortList);
			Page<ProductEntity> productEntitiesPage = productRepository.findAll(IProductRepository.getSearchCondition(searchCondition), pageable);
			List<ProductEntity> productList = productEntitiesPage.getContent();
			// Convert product entity to product item model
			productItemList = convertProductEntityToProductItemModel(productList);
			responseCode = Constants.RESULT_CD_SUCCESS;
			data.put("productItemList", productItemList);
			data.put("paginationList", new PageModel(pageNumber, productEntitiesPage.getTotalPages()));
			if(productEntitiesPage.getTotalElements() <= 0) {
				responseMsg = "Kh??ng t??m th???y k???t qu??? n??o ph?? h???p";
			} else {
				responseMsg = "T??m th???y " + productEntitiesPage.getTotalElements() + " s???n ph???m!";
			}
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "T??m ki???m theo ??i???u ki??n kh??ng th??nh c??ng!" + e.getMessage();
			log.error(responseMsg);
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
				responseMsg = "L???y danh s??ch s???n ph???m n???i b???t th??nh c??ng!";
				data.put("listProductOutstanding", productList);
				data.put("totalProduct", totalProduct);
				log.info(responseMsg);
			} else {
				responseMsg = "Kh??ng t??m th???y s???n ph???m!";
				log.info(responseMsg);
			}
		} catch (Exception e) { 
			responseMsg = "L???y danh s??ch s???n ph???m n???i b???t th??nh c??ng! ";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public ResponseDataModel findProductDetailById(Integer productId) {
		int repsonseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			ProductEntity productEntity = productRepository.findByProductId(productId);
			int totalRate = productCommentRepository.getTotalRateByProductId(productId);
			float averagePointRate = 0;
			if(totalRate != 0) {
				averagePointRate = productCommentRepository.getAveragePointRate(productId);
			}
			List<String> imagesUrl = productImageRepository.getListImageByProductId(productId);
			ProductInfoEntity productInfoEntity = productInfoRepository.findByProductId(productId);
			ProductOptionEntity productOptionEntity = productOptionRepository.findProductOptionByProductId(productId);
			List<ProductCommentEntity> productCommentList = productCommentRepository.getListProductCommentByProductId(productId);
			List<ProductMemoryPriceModel> productMemoryPriceModels = ObjectToModel.convertToListProductMemoryPrice(productOptionRepository.getListProductByMemoryPrice(productId));
			ProductDetailModel productDetailModel = new ProductDetailModel(productEntity, totalRate, averagePointRate, imagesUrl, productInfoEntity, productOptionEntity, productCommentList, productMemoryPriceModels);
			
			List<ProductOptionEntity> productOptionListByPriceAndId = new ArrayList<ProductOptionEntity>();
			if(productInfoEntity != null) {
				productOptionListByPriceAndId = productOptionRepository.findByMemoryAndProductId(productOptionEntity.getMemoryProduct(), productId);
			}
			List<ProductCommentModel> productCommentModels = ObjectToModel.convertToListProductCommentModel(productCommentRepository.getTop3ProductCommentModel(productId));
			List<Integer> listTotalRate = productCommentRepository.getListTotalRateEachRate(productId);
			data.put("productDetailModel", productDetailModel);
			data.put("productOptionListByPriceAndId", productOptionListByPriceAndId);
			data.put("productCommentModels", productCommentModels);
			data.put("listTotalRate", listTotalRate);
			repsonseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "L???y d??? li???u cho trang chi ti???t s???n ph???m th??nh c??ng";
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "L???y d??? li???u cho trang chi ti???t s???n ph???m kh??ng th??nh c??ng ";
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
				responseMsg = "L???y danh s??ch s???n ph???m theo b??? nh??? trong v?? product_Id th??nh c??ng!";
				data.put("productOptionList", productOptionList);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "L???y danh s??ch s???n ph???m theo b??? nh??? trong v?? product_id kh??ng th??nh c??ng!";
			log.info(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public List<ProductItemModel> convertProductEntityToProductItemModel(List<ProductEntity> productList) {
		List<ProductItemModel> productItemList = new ArrayList<ProductItemModel>();
		for (ProductEntity product : productList) {
			 int totalRate = productCommentRepository.getTotalRateByProductId(product.getProductId());
			 float averagePointRate = 0;
			 // Check product have rated?
			 if(totalRate != 0) { 
				 averagePointRate = productCommentRepository.getAveragePointRate(product.getProductId());
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
		return productItemList;
	}

	@Override
	public ResponseDataModel addNewRateAndComment(ProductCommentEntity productCommentEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		try {
			MultipartFile imageFile = productCommentEntity.getImageFile();
			if(imageFile != null & imageFile.getSize() > 0) {
				String imageUrlPath = FileHelper.addNewFile(commentFolderPath, imageFile);
				productCommentEntity.setImageCommentUrl(imageUrlPath);
				productCommentRepository.saveAndFlush(productCommentEntity);
				log.info("T???o m???i b??nh lu??n th??nh c??ng");
			}
			responseMsg = "????nh gi?? v?? b??nh lu???n th??nh c??ng";
			responseCode = Constants.RESULT_CD_SUCCESS;
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "????nh gi?? v?? b??nh lu???n kh??ng th??nh c??ng!";
			log.error(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel getAllCommentProduct(Integer productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<ProductCommentModel> productCommentModels = ObjectToModel.convertToListProductCommentModel(productCommentRepository.getAllProductCommentModel(productId));
			if(productCommentModels != null) {
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "L???y danh s??ch t???t c??? b??nh lu???n th??nh c??ng!";
				data.put("productCommentModels", productCommentModels);
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "L???y danh s??ch t???t c??? b??nh lu???n kh??ng th??nh c??ng do: " + e.getMessage();
			log.error(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

	@Override
	public ResponseDataModel addProductViewed(Integer productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		try {
			@SuppressWarnings("unchecked")
			Map<Integer, ProductItemModel> productsViewed = (HashMap<Integer, ProductItemModel>) session.getAttribute("productsViewed");
			ProductItemModel productItemModel = new ProductItemModel();
			if (productsViewed == null) {
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
			responseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "???? th??m s???n ph???m v??o danh m???c s???n ph???m ???? xem!";
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "Th??m s???n ph???m v??o danh m???c s???n ph???m ???? xem kh??ng th??nh c??ng do: " + e.getMessage();
			log.error(responseMsg); 
		}
		
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel removeProductViewed() {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		try {
			@SuppressWarnings("unchecked")
			Map<Integer, ProductItemModel> productsViewed = (HashMap<Integer, ProductItemModel>) session.getAttribute("productsViewed");
			if(productsViewed != null) {
				session.removeAttribute("productsViewed");
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "X??a danh m???c s???n ph???m ???? xem th??nh c??ng!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "X??a danh m???c s???n ph???m ???? xem kh??ng th??nh c??ng do: " + e.getMessage();
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
	public ResponseDataModel findProductRelatedByProductId(Integer productId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = Strings.EMPTY;
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<ProductEntity> productList = productRepository.findProductRelatedByProductId(productId);
			List<ProductItemModel> productItemModels = convertProductEntityToProductItemModel(productList);
			if(productItemModels != null) {
				data.put("productItemModels", productItemModels);
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "L???y danh s??ch s???n ph???m li??n quan th??nh c??ng!";
				log.info(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "L???y danh s??ch s???n ph???m li??n quan kh??ng th??nh c??ng do: " + e.getMessage();
			log.error(responseMsg);
		}
		return new ResponseDataModel(responseCode, responseMsg, data);
	}

}
