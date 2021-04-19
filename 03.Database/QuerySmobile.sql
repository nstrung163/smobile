SELECT * FROM PRODUCT_INFO WHERE PRODUCT_ID = 3;
/* Test product image */
SELECT p.*, pi.IMAGE_URL FROM product AS P JOIN product_image as pi on p.PRODUCT_ID = pi.PRODUCT_ID WHERE p.PRODUCT_ID = 1;

/* Test product option*/
SELECT P.* FROM PRODUCT AS P JOIN PRODUCT_OPTION AS PO ON P.PRODUCT_ID = PO.PRODUCT_ID WHERE P.PRODUCT_ID = 1;

/* Test user */
SELECT * FROM USER WHERE user_name = "nvba";

select
*
from user
where
USER_NAME="nvaa";

create table account (
       account_id bigint not null auto_increment,
        address varchar(255),
        avatar varchar(255),
        dateCreated datetime not null,
        email varchar(255),
        fullName varchar(30) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        role varchar(255),
        status integer default 1,
        username varchar(255),
        primary key (account_id)
)