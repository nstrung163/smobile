SELECT * FROM PRODUCT_INFO WHERE PRODUCT_ID = 3;
/* Test product image */
SELECT p.*, pi.IMAGE_URL FROM product AS P JOIN product_image as pi on p.PRODUCT_ID = pi.PRODUCT_ID WHERE p.PRODUCT_ID = 1;

/* Test product option*/
SELECT P.* FROM PRODUCT AS P JOIN PRODUCT_OPTION AS PO ON P.PRODUCT_ID = PO.PRODUCT_ID WHERE P.PRODUCT_ID = 1;

/* Test user */
SELECT * FROM USER WHERE user_name = "nvba";
/* Lấy sản phẩm cùng lượt đánh giá */
SELECT distinct P.*, PI.IMAGE_URL, R.RATE_NUMBER 
FROM PRODUCT AS P INNER JOIN PRODUCT_IMAGE AS PI ON P.PRODUCT_ID = PI.PRODUCT_ID 
				  INNER JOIN RATE_PRODUCT AS R ON P.PRODUCT_ID = R.PRODUCT_ID;
                  
/* Tính tổng lượt đánh giá của sản phẩm theo product id */
SELECT COUNT(*) FROM RATE_PRODUCT WHERE PRODUCT_ID = 10;
SELECT * FROM RATE_PRODUCT WHERE PRODUCT_ID = 1;

/* Tính trung bình cộng lượt đánh giá của sản phẩm theo product id */
SELECT CASE AVG(RATE_NUMBER) WHEN nullif(AVG(RATE_NUMBER)) THEN 0 ELSE 1 END RATE_AVERAGE FROM RATE_PRODUCT WHERE PRODUCT_ID = 15;

SELECT  AVG(RATE_NUMBER) FROM RATE_PRODUCT WHERE PRODUCT_ID = 15;
/* Lấy danh sách ảnh của sản phẩm theo product id*/
SELECT IMAGE_URL FROM PRODUCT_IMAGE WHERE PRODUCT_ID = 17 LIMIT 1;

/* Lấy danh sách điện thoại nổi bật */
SELECT * FROM PRODUCT LIMIT 5;

/* START QUERY PRODUCT DETAIL PAGE*/
/* Lấy danh sách màu theo bộ nhớ và id của sản phẩm */
SELECT * FROM PRODUCT_OPTION WHERE MEMORY_PRODUCT = 128 AND PRODUCT_ID = 1;
/* Lấy danh bộ nhớ theo product_id */
SELECT DISTINCT MEMORY_PRODUCT FROM PRODUCT_OPTION WHERE PRODUCT_ID = 1;
/* List<String> imagesUrl Lấy danh sách đường dẫn của sản phẩm theo product_id */
SELECT IMAGE_URL FROM PRODUCT_IMAGE WHERE PRODUCT_ID = 1;
/* ProductInfo */
SELECT * FROM PRODUCT_INFO WHERE PRODUCT_ID = 1;
/* ProductOption */
SELECT * FROM PRODUCT_OPTION WHERE PRODUCT_ID = 1 LIMIT 1;
/* ProductComment */
SELECT * FROM PRODUCT_COMMENT WHERE PRODUCT_ID = 1;
/* Truy vấn để lấy ra giá hiện tại của sản phẩm */
SELECT MIN(SALE_PRICE) FROM PRODUCT_OPTION WHERE PRODUCT_ID = 1;
/* Query lấy bộ nhớ và giá của sản phẩm*/
SELECT DISTINCT MEMORY_PRODUCT, SALE_PRICE, PRODUCT_ID  FROM PRODUCT_OPTION WHERE PRODUCT_ID = 1;

SELECT   P.MEMORY_PRODUCT, P.SALE_PRICE, P.PRODUCT_ID  FROM PRODUCT_OPTION AS P  WHERE P.PRODUCT_ID = 1;
SELECT P.product_id, P.memory_product, P.sale_price  FROM PRODUCT_OPTION AS P;

/* QUERY USER TABLE*/
/* Kiểm tra thông tin đăng nhập */
SELECT * FROM USER WHERE USER_NAME = 'nva' AND PASSWORD = '123';