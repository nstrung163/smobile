SELECT P.* FROM PRODUCT AS P WHERE P.PRODUCT_ID = 1;

SELECT P.PRODUCT_ID FROM PRODUCT AS P WHERE P.PRODUCT_ID = 8;

select * from PAYMENT_METHOD where PAYMENT_METHOD_NAME= "Zalo Test";

select
purchaseen0_.PURCHASE_ID as purchase1_8_4_,
purchaseen0_.DATE_OF_ORDER as date_of_2_8_4_,
purchaseen0_.OPTION_SHIPPING_ID as option_s3_8_4_,
purchaseen0_.PAYMENT_METHOD_ID as payment_4_8_4_,
purchaseen0_.PURCHASE_STATUS_ID as purchase5_8_4_,
purchaseen0_.USER_ID as user_id6_8_4_,
optionship1_.OPTION_SHIPPING_ID as option_s1_1_0_,
optionship1_.DESCRIPTION as descript2_1_0_,
optionship1_.OPTION_SHIPPING_FEE as option_s3_1_0_,
optionship1_.OPTION_SHIPPING_NAME as option_s4_1_0_,
paymentmet2_.PAYMENT_METHOD_ID as payment_1_2_1_,
paymentmet2_.PAYMENT_METHOD_NAME as payment_2_2_1_,
purchasest3_.PURCHASE_STATUS_ID as purchase1_10_2_,
purchasest3_.PURCHASE_STATUS_NAME as purchase2_10_2_,
userentity4_.USER_ID as user_id1_12_3_,
userentity4_.AVATA_URL as avata_ur2_12_3_,
userentity4_.BIRTHDAY as birthday3_12_3_,
userentity4_.EMAIL as email4_12_3_,
userentity4_.FULL_NAME as full_nam5_12_3_,
userentity4_.GENDER as gender6_12_3_,
userentity4_.PASSWORD as password7_12_3_,
userentity4_.PHONE_NUMBER as phone_nu8_12_3_,
userentity4_.ROLE_USER as role_use9_12_3_,
userentity4_.USER_NAME as user_na10_12_3_ 
from
PURCHASE purchaseen0_ 
left outer join
OPTION_SHIPPING optionship1_ 
	on purchaseen0_.OPTION_SHIPPING_ID=optionship1_.OPTION_SHIPPING_ID 
left outer join
PAYMENT_METHOD paymentmet2_ 
	on purchaseen0_.PAYMENT_METHOD_ID=paymentmet2_.PAYMENT_METHOD_ID 
left outer join
PURCHASE_STATUS purchasest3_ 
	on purchaseen0_.PURCHASE_STATUS_ID=purchasest3_.PURCHASE_STATUS_ID 
left outer join
USER userentity4_ 
	on purchaseen0_.USER_ID=userentity4_.USER_ID 
where
purchaseen0_.PURCHASE_STATUS_ID=1;

select
purchase.PURCHASE_ID,
purchase.DATE_OF_ORDER,
purchase.OPTION_SHIPPING_ID,
purchase.PAYMENT_METHOD_ID,
purchase.PURCHASE_STATUS_ID,
purchase.USER_ID,
option_shipping.OPTION_SHIPPING_ID,
option_shipping.DESCRIPTION,
option_shipping.OPTION_SHIPPING_FEE,
option_shipping.OPTION_SHIPPING_NAME,
payment_method.PAYMENT_METHOD_ID,
payment_method.PAYMENT_METHOD_NAME,
purchase_status.PURCHASE_STATUS_ID,
purchase_status.PURCHASE_STATUS_NAME,
user.USER_ID,
user.AVATA_URL,
user.BIRTHDAY,
user.EMAIL,
user.FULL_NAME,
user.GENDER,
user.PASSWORD,
user.PHONE_NUMBER,
user.ROLE_USER,
user.USER_NAME 
from
PURCHASE purchase 
left outer join
OPTION_SHIPPING option_shipping 
on purchase.OPTION_SHIPPING_ID=option_shipping.OPTION_SHIPPING_ID 
left outer join
PAYMENT_METHOD payment_method 
on purchase.PAYMENT_METHOD_ID=payment_method.PAYMENT_METHOD_ID 
left outer join
PURCHASE_STATUS purchase_status 
on purchase.PURCHASE_STATUS_ID=purchase_status.PURCHASE_STATUS_ID 
left outer join
USER user 
on purchase.USER_ID=user.USER_ID 
where
purchase.PURCHASE_STATUS_ID=1;

/* Test query product comment*/
SELECT * FROM PRODUCT_COMMENT WHERE PRODUCT_ID = 1;

/* START QUERY PRODUCT DETAIL PAGE*/
/* Product Option Lấy danh sách màu theo bộ nhớ và id của sản phẩm */
SELECT * FROM PRODUCT_OPTION WHERE MEMORY_PRODUCT = 128 AND PRODUCT_ID = 1;
/* Lấy danh bộ nhớ theo product_id */
SELECT DISTINCT MEMORY_PRODUCT FROM PRODUCT_OPTION WHERE PRODUCT_ID = 1;
/* List<String> imagesUrl Lấy danh sách đường dẫn của sản phẩm theo product_id */
SELECT IMAGE_URL FROM PRODUCT_IMAGE WHERE PRODUCT_ID = 1;
/* ProductInfo */
SELECT * FROM PRODUCT_INFO WHERE PRODUCT_ID = 1;
/* Product Option cho sản phẩm*/

SELECT * FROM PRODUCT_OPTION WHERE PRODUCT_ID = 1 LIMIT 1;

/* Lấy trung bình đánh giá cho mỗi đánh giá : Dùng bảng tạm */
/* Lấy tất cả đánh giá về sản phẩm*/
SELECT PM.COMMENT_CONTENT, PM.DATE_OF_COMMENT, U.FULL_NAME,P.PRODUCT_ID, U.USER_ID, U.AVATAR_URL, RP.RATE_NUMBER
FROM PRODUCT AS P JOIN PRODUCT_COMMENT AS PM 
	ON P.PRODUCT_ID = PM.PRODUCT_ID JOIN USER AS U 
    ON PM.USER_ID = U.USER_ID JOIN (SELECT R.* FROM RATE_PRODUCT AS R JOIN PRODUCT AS P ON R.PRODUCT_ID = P.PRODUCT_ID WHERE R.PRODUCT_ID = 1) AS RP
    ON RP.USER_ID = U.USER_ID 
WHERE P.PRODUCT_ID = 1;

SELECT R.* FROM RATE_PRODUCT AS R JOIN PRODUCT AS P ON R.PRODUCT_ID = P.PRODUCT_ID WHERE R.PRODUCT_ID = 1;




