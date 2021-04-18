SELECT * FROM PRODUCT_INFO WHERE PRODUCT_ID = 3;
/* Test product image */
SELECT p.*, pi.IMAGE_URL FROM product AS P JOIN product_image as pi on p.PRODUCT_ID = pi.PRODUCT_ID WHERE p.PRODUCT_ID = 1;

/* Test product option*/
SELECT P.* FROM PRODUCT AS P JOIN PRODUCT_OPTION AS PO ON P.PRODUCT_ID = PO.PRODUCT_ID WHERE P.PRODUCT_ID = 1;

/* Test product */

