DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ NOCACHE;

DROP SEQUENCE ADDR_SEQ;
CREATE SEQUENCE ADDR_SEQ NOCACHE;

DROP SEQUENCE PROD_SEQ;
CREATE SEQUENCE PROD_SEQ NOCACHE;

DROP SEQUENCE PROD_FILE_SEQ;
CREATE SEQUENCE PROD_FILE_SEQ NOCACHE;

DROP SEQUENCE ORDER_SEQ;
CREATE SEQUENCE ORDER_SEQ NOCACHE;

DROP SEQUENCE COUPON_SEQ;
CREATE SEQUENCE COUPON_SEQ NOCACHE;

DROP SEQUENCE ORDER_DETAIL_SEQ;
CREATE SEQUENCE ORDER_DETAIL_SEQ NOCACHE;

DROP SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE REVIEW_SEQ NOCACHE;

DROP SEQUENCE REVIEW_FILE_SEQ;
CREATE SEQUENCE REVIEW_FILE_SEQ NOCACHE;

DROP SEQUENCE POINT_DETAIL_SEQ;
CREATE SEQUENCE POINT_DETAIL_SEQ NOCACHE;

DROP SEQUENCE CART_SEQ;
CREATE SEQUENCE CART_SEQ NOCACHE;

DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ NOCACHE;

DROP SEQUENCE QNA_FILE_SEQ;
CREATE SEQUENCE QNA_FILE_SEQ NOCACHE;

DROP SEQUENCE CS_SEQ;
CREATE SEQUENCE CS_SEQ NOCACHE;

DROP SEQUENCE CS_FILE_SEQ;
CREATE SEQUENCE CS_FILE_SEQ NOCACHE;

DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;

DROP SEQUENCE NOTICE_FILE_SEQ;
CREATE SEQUENCE NOTICE_FILE_SEQ NOCACHE;

DROP SEQUENCE CATEGORY_SEQ;
CREATE SEQUENCE CATEGORY_SEQ NOCACHE;


DROP TABLE NOTICE_FILES_TBL;
DROP TABLE NOTICE_TBL;

DROP TABLE CUSTOMER_SERVICE_FILES_TBL;
DROP TABLE CUSTOMER_SERVICE_TBL;

DROP TABLE QNA_FILES_TBL;
DROP TABLE PRODUCT_QNA_TBL;
DROP TABLE PRODUCT_SELLER_TBL;

DROP TABLE CART_TBL;
DROP TABLE POINT_DETAIL_TBL;

DROP TABLE REVIEW_LIKE_TBL;
DROP TABLE REVIEW_FILES_TBL;
DROP TABLE REVIEW_TBL;

DROP TABLE ORDER_DETAIL_TBL;
DROP TABLE ORDER_TBL;
DROP TABLE USER_COUPON_TBL;
DROP TABLE COUPON_TBL;

DROP TABLE PRODUCT_FILES_TBL;
DROP TABLE PRODUCT_TBL;
DROP TABLE PRODUCT_CATEGORY_TBL;

DROP TABLE SELLER_FILES_TBL;
DROP TABLE ADDRESS_TBL;

DROP TABLE USER_TBL;
DROP TABLE REST_USER_TBL;
DROP TABLE LEAVE_USER_TBL;
DROP TABLE USER_ACCESS_TBL;

CREATE TABLE USER_TBL (
    USER_NO              NUMBER             NOT NULL,
    USER_TYPE            NUMBER             NOT NULL,
    USER_ID              VARCHAR2(20 BYTE)  NOT NULL,
    USER_PW              VARCHAR2(64 BYTE)  NOT NULL,
    USER_NAME            VARCHAR2(40 BYTE)  NOT NULL,
    CONTACT              VARCHAR2(11 BYTE)  NOT NULL,
    EMAIL                VARCHAR2(100 BYTE) NOT NULL,
    GENDER               VARCHAR2(6 BYTE),
    BIRTHYEAR            VARCHAR2(4 BYTE),
    BIRTHDATE            VARCHAR2(4 BYTE),
    AGREECODE            NUMBER             NOT NULL,
    JOINED_AT            DATE               NOT NULL,
    PW_MODIFIED_AT       DATE               NOT NULL,
    AUTOLOGIN_ID         VARCHAR2(32 BYTE),
    AUTOLOGIN_EXPIRED_AT DATE,
    ON_BLACKLIST         NUMBER,
    SELLER_NAME          VARCHAR2(20 BYTE),
    SELLER_CERTIF        VARCHAR2(10 BYTE),
    SELLER_OPEN_DATE     VARCHAR2(8 BYTE)
);

CREATE TABLE REST_USER_TBL (
    USER_NO              NUMBER             NOT NULL,
    USER_TYPE            NUMBER             NOT NULL,
    USER_ID              VARCHAR2(20 BYTE)  NOT NULL,
    USER_PW              VARCHAR2(64 BYTE)  NOT NULL,
    USER_NAME            VARCHAR2(40 BYTE)  NOT NULL,
    CONTACT              VARCHAR2(11 BYTE)  NOT NULL,
    EMAIL                VARCHAR2(100 BYTE) NOT NULL,
    GENDER               VARCHAR2(2 BYTE),
    BIRTHYEAR            VARCHAR2(4 BYTE),
    BIRTHDATE            VARCHAR2(4 BYTE),
    AGREECODE            NUMBER NOT NULL,
    JOINED_AT            DATE NOT NULL,
    PW_MODIFIED_AT       DATE NOT NULL,
    ON_BLACKLIST         NUMBER,
    REST_AT              DATE               NOT NULL
);


CREATE TABLE LEAVE_USER_TBL (
    USER_ID   VARCHAR2(20 BYTE)  NOT NULL,
    EMAIL     VARCHAR2(100 BYTE) NOT NULL,
    JOINED_AT DATE NOT NULL,
    LEAVED_AT DATE NOT NULL,
    REASON    NUMBER,
    MESSAGE   VARCHAR2(300 BYTE)
);

CREATE TABLE USER_ACCESS_TBL (
    USER_ID       VARCHAR2(20 BYTE) NOT NULL,
    LAST_LOGIN_AT DATE              NOT NULL
);

CREATE TABLE ADDRESS_TBL(
    ADDR_NO        NUMBER             NOT NULL,
    USER_NO        NUMBER             NOT NULL,
    ADDR_DEFAULT   NUMBER             NOT NULL,
    ADDR_NAME      VARCHAR2(20 BYTE)  NOT NULL,
    ADDR_CONTACT   VARCHAR2(11 BYTE)  NOT NULL,
    ADDR_NICKNAME  VARCHAR2(20 BYTE),
    POSTCODE       VARCHAR2(5 BYTE)   NOT NULL,
    ROAD_ADDRESS   VARCHAR2(100 BYTE) NOT NULL,
    JIBUN_ADDRESS  VARCHAR2(100 BYTE) NOT NULL,
    DETAIL_ADDRESS VARCHAR2(100 BYTE) NOT NULL,
    EXTRA_ADDRESS  VARCHAR2(100 BYTE)
);

CREATE TABLE SELLER_FILES_TBL (
    USER_NO                 NUMBER             NOT NULL,
    SELLER_FILE_PATH        VARCHAR2(300 BYTE) NOT NULL,
    SELLER_FILE_SYSTEM_NAME VARCHAR2(50 BYTE)  NOT NULL
);

CREATE TABLE PRODUCT_CATEGORY_TBL (
	CATEGORY_NO	    NUMBER	            NOT NULL,
	CATEGORY_NAME	VARCHAR2(30 BYTE)	NOT NULL
);

CREATE TABLE PRODUCT_TBL (
	PROD_NO	        NUMBER	            NOT NULL,
	CATEGORY_NO	    NUMBER,
	PROD_NAME	    VARCHAR2(100 BYTE)	NOT NULL,
	PROD_PRICE	    NUMBER	            NOT NULL,
	PROD_STOCK	    NUMBER,
    PROD_CONTENT    VARCHAR2(300 BYTE),
	PROD_REG_DATE	DATE	            NOT NULL,
	PROD_MOD_DATE	DATE,
    PROD_DELETED    NUMBER
);

CREATE TABLE PRODUCT_FILES_TBL (
	PROD_FILE_NO	        NUMBER	            NOT NULL,
	PROD_NO	                NUMBER	            NOT NULL,
	PROD_FILE_PATH	        VARCHAR2(300 BYTE)	NOT NULL,
	PROD_FILE_ORIGIN_NAME	VARCHAR2(300 BYTE)	NOT NULL,
	PROD_FILE_SYSTEM_NAME	VARCHAR2(50 BYTE)	NOT NULL
);

CREATE TABLE ORDER_TBL (
	ORDER_NO	        VARCHAR2(20 BYTE)       NOT NULL,
	USER_NO         	NUMBER,
	ORDER_DATE        	DATE		            NOT NULL,
	ORDER_TOTAL_PRICE	NUMBER(10)              NOT NULL,
	PAY_METHOD      	VARCHAR2(30 BYTE)		NOT NULL,
	ORDER_STATUS	    VARCHAR2(20 BYTE)		NOT NULL,
	SHIPPED_DATE	    DATE,
	MEMBERSHIP_POINT	NUMBER,
	POINT_RATE       	NUMBER(4)		        NOT NULL,
	IS_MEMBER	        NUMBER		            NOT NULL,
	ORDER_NAME	        VARCHAR2(40 BYTE)		NOT NULL,
	CONTACT          	VARCHAR2(11 BYTE)		NOT NULL,
	POSTCODE	        VARCHAR2(5 BYTE)		NOT NULL,
	ROAD_ADDRESS    	VARCHAR2(100 BYTE)		NOT NULL,
	JIBUN_ADDRESS	    VARCHAR2(100 BYTE)		NOT NULL,
	DETAIL_ADDRESS	    VARCHAR2(100 BYTE)		NOT NULL,
    EXTRA_ADDRESS       VARCHAR2(100 BYTE),
	ORDER_REQUEST	    VARCHAR2(255 BYTE),
    ORDER_CANCELED      NUMBER
);

CREATE TABLE COUPON_TBL (
	COUPON_NO	        NUMBER		            NOT NULL,
	COUPON_NAME      	VARCHAR2(30 BYTE)		NOT NULL,
	COUPON_CONTENT   	VARCHAR2(100 BYTE),
	COUPON_DC_RATE	    NUMBER	             	NOT NULL,
	COUPON_CREATED_DATE	DATE		            NOT NULL,
	COUPON_EXPIRED_DATE	DATE	            	NOT NULL,
	COUPON_STATE	    VARCHAR2(20 BYTE)		NOT NULL
);

CREATE TABLE USER_COUPON_TBL (
    COUPON_NO NUMBER NOT NULL,
    USER_NO   NUMBER NOT NULL
);

CREATE TABLE ORDER_DETAIL_TBL (
	ORDER_DETAIL_NO	NUMBER		     NOT NULL,
	ORDER_NO	    VARCHAR2(20BYTE) NOT NULL,
	PROD_NO      	NUMBER		     NOT NULL,
	COUPON_NO	    NUMBER	       	 NOT NULL,
	PROD_AMOUNT  	NUMBER		     NOT NULL
);

CREATE TABLE REVIEW_TBL (
    REVIEW_NO                NUMBER              NOT NULL,
    ORDER_DETAIL_NO          NUMBER              NOT NULL,
    BEST_REVIEW              NUMBER,
    PROD_SCORE               NUMBER              NOT NULL,
    SELLER_SCORE             NUMBER              NOT NULL,
    HAS_IMG                  NUMBER              NOT NULL,
    REVIEW_WRITER            VARCHAR2(20 BYTE)   NOT NULL,
    REVIEW_CONTENT           VARCHAR2(200 BYTE)  NOT NULL,
    REVIEW_REG_DATE          DATE                NOT NULL,
    REVIEW_EXPIRED_AT        DATE                NOT NULL,
    REVIEW_COMMENT_DEPTH     NUMBER(2)           NOT NULL,
    REVIEW_COMMENT_GROUP_NO  NUMBER              NOT NULL
);

CREATE TABLE REVIEW_FILES_TBL (
    REVIEW_FILE_NO           NUMBER              NOT NULL,
    REVIEW_NO                NUMBER              NOT NULL,
    REVIEW_FILE_PATH         VARCHAR2(300 BYTE)  NOT NULL,
    REVIEW_FILE_ORIGIN_NAME  VARCHAR2(300 BYTE)  NOT NULL,
    REVIEW_FILE_SYSTEM_NAME  VARCHAR2(50 BYTE)   NOT NULL
);

CREATE TABLE REVIEW_LIKE_TBL (
    REVIEW_NO    NUMBER   NOT NULL,
    USER_NO      NUMBER   NOT NULL
);

CREATE TABLE POINT_DETAIL_TBL (
	POINT_DETAIL_NO	    NUMBER	          NOT NULL,
	USER_NO	            NUMBER		      NOT NULL,
	ORDER_NO	        VARCHAR2(20 BYTE),
	REVIEW_NO        	NUMBER,
	POINT_DETAIL     	VARCHAR2(30 BYTE) NOT NULL,
	POINT_AMOUNT	    NUMBER	          NOT NULL,
	POINT_DATE       	DATE	          NOT NULL,
	POINT_EXPIRED_DATE	DATE	          NOT NULL
);

CREATE TABLE CART_TBL (
	CART_NO        	NUMBER		NOT NULL,
	USER_NO	        NUMBER		NOT NULL,
	PROD_NO	        NUMBER		NOT NULL,
	AMOUNT	        NUMBER		NOT NULL,
	CART_ADD_DATE	DATE		NOT NULL
);

CREATE TABLE PRODUCT_SELLER_TBL (
    PROD_NO         NUMBER NOT NULL,
    USER_NO         NUMBER NOT NULL,
    DELIVERY_PRICE  NUMBER,
    DISCOUNT_RATE   NUMBER
);

CREATE TABLE PRODUCT_QNA_TBL (
    QNA_NO       NUMBER             NOT NULL,
    PROD_NO      NUMBER             NOT NULL,
    USER_NO      NUMBER,
    QNA_CATEGORY NUMBER             NOT NULL,
--    QNA_WRITER   VARCHAR2(20 BYTE)  NOT NULL,
--    QNA_INFO     VARCHAR2(20 BYTE),
    QNA_REG_DATE DATE               NOT NULL,
    QNA_TITLE    VARCHAR2(300 BYTE) NOT NULL,
    QNA_CONTENT  CLOB               NOT NULL,
    HAS_QNA_FILE NUMBER,
--    IS_SECRET    NUMBER             NOT NULL,
--    SECRET_PW    VARCHAR2(20 BYTE),
    IS_ANSWER    NUMBER             NOT NULL
);

CREATE TABLE QNA_FILES_TBL (
    QNA_FILE_NO          NUMBER             NOT NULL,
    QNA_NO               NUMBER             NOT NULL,
    USER_NO              NUMBER             NOT NULL, 
    QNA_FILE_PATH        VARCHAR2(300 BYTE) NOT NULL,
    QNA_FILE_ORIGIN_NAME VARCHAR2(300 BYTE) NOT NULL,
    QNA_FILE_SYSTEM_NAME VARCHAR2(50 BYTE)  NOT NULL
);


CREATE TABLE CUSTOMER_SERVICE_TBL (
    CS_NO         NUMBER              NOT NULL,
    CS_WRITER     NUMBER              NOT NULL,
    CS_TITLE      VARCHAR2(50 BYTE)   NOT NULL,
    CS_CONTENT    VARCHAR2(100 BYTE)  NOT NULL,
    CS_REG_DATE   DATE                NOT NULL,
    CS_MOD_DATE   DATE,
    CS_STATUS     NUMBER              NOT NULL,
    CS_CATEGORY   NUMBER              NOT NULL,
    DEPTH         NUMBER              NOT NULL,
    GROUP_NO      NUMBER              NOT NULL,
    GROUP_ORDER   NUMBER              NOT NULL,
    IS_SECRET     NUMBER              NOT NULL,
    SECRET_PW     VARCHAR2(20 BYTE),
    IS_ANSWER     NUMBER              NOT NULL
);

CREATE TABLE CUSTOMER_SERVICE_FILES_TBL (
    CS_FILE_NO            NUMBER               NOT NULL,
    CS_NO                 NUMBER               NOT NULL,
    CS_FILE_PATH          VARCHAR2(300 BYTE)   NOT NULL,
    CS_FILE_ORIGIN_NAME   VARCHAR2(300 BYTE)   NOT NULL,
    CS_FILE_SYSTEM_NAME   VARCHAR2(50 BYTE)    NOT NULL
);

CREATE TABLE NOTICE_TBL (
    NOTICE_NO        NUMBER              NOT NULL,
    NOTICE_TITLE     VARCHAR2(100 BYTE)  NOT NULL,
    NOTICE_REG_AT    VARCHAR2(30 BYTE)   NOT NULL,
    NOTICE_MODI_AT   VARCHAR2(30 BYTE),
    NOTICE_CONTENT   CLOB                NOT NULL,
    NOTICE_VIEWS     NUMBER              NOT NULL,
    DEPTH            NUMBER              NOT NULL,
    GROUP_NO         NUMBER              NOT NULL,
    GROUP_ORDER      NUMBER              NOT NULL,
    IS_SECRET        NUMBER              NOT NULL,
    SECRET_PW        VARCHAR2(20 BYTE),
    IS_ANSWER        NUMBER              NOT NULL
);

CREATE TABLE NOTICE_FILES_TBL (
    NOTICE_FILE_NO            NUMBER               NOT NULL,
    NOTICE_NO                 NUMBER               NOT NULL,
    NOTICE_FILE_PATH          VARCHAR2(300 BYTE)   NOT NULL,
    NOTICE_FILE_ORIGIN_NAME   VARCHAR2(300 BYTE)   NOT NULL,
    NOTICE_FILE_SYSTEM_NAME   VARCHAR2(50 BYTE)    NOT NULL
);

ALTER TABLE USER_TBL
    ADD CONSTRAINT PK_USER
        PRIMARY KEY(USER_NO);

ALTER TABLE REST_USER_TBL
    ADD CONSTRAINT PK_REST_USER
        PRIMARY KEY(USER_NO);

ALTER TABLE LEAVE_USER_TBL
    ADD CONSTRAINT PK_LEAVE_USER
        PRIMARY KEY(USER_ID);

ALTER TABLE USER_ACCESS_TBL
    ADD CONSTRAINT PK_USER_ACCESS
        PRIMARY KEY(USER_ID);
        
ALTER TABLE ADDRESS_TBL 
    ADD CONSTRAINT PK_ADDRESS_TBL
        PRIMARY KEY(ADDR_NO);

ALTER TABLE PRODUCT_CATEGORY_TBL 
    ADD CONSTRAINT PK_PRODCATEGORY 
        PRIMARY KEY (CATEGORY_NO);

ALTER TABLE PRODUCT_TBL 
    ADD CONSTRAINT PK_PRODUCT
        PRIMARY KEY (PROD_NO);

ALTER TABLE PRODUCT_FILES_TBL 
    ADD CONSTRAINT PK_PRODFILE 
        PRIMARY KEY (PROD_FILE_NO);
            
ALTER TABLE COUPON_TBL
    ADD CONSTRAINT PK_COUPON
        PRIMARY KEY (COUPON_NO);
        
ALTER TABLE ORDER_TBL
    ADD CONSTRAINT PK_ORDER
        PRIMARY KEY(ORDER_NO);

ALTER TABLE ORDER_DETAIL_TBL 
    ADD CONSTRAINT PK_ORDER_DETAIL
        PRIMARY KEY (ORDER_DETAIL_NO);

ALTER TABLE REVIEW_TBL 
    ADD CONSTRAINT PK_REVIEW 
        PRIMARY KEY(REVIEW_NO);

ALTER TABLE REVIEW_FILES_TBL 
    ADD CONSTRAINT PK_REVIEW_FILES
        PRIMARY KEY(REVIEW_FILE_NO);
        
ALTER TABLE POINT_DETAIL_TBL
    ADD CONSTRAINT PK_POINT_DETAIL
            PRIMARY KEY (POINT_DETAIL_NO);

ALTER TABLE CART_TBL
    ADD CONSTRAINT PK_CART
            PRIMARY KEY (CART_NO);

ALTER TABLE PRODUCT_QNA_TBL 
    ADD CONSTRAINT PK_QNA_NO
        PRIMARY KEY(QNA_NO);    

ALTER TABLE QNA_FILES_TBL 
    ADD CONSTRAINT PK_QNA_FILE_NO
        PRIMARY KEY(QNA_FILE_NO);

ALTER TABLE CUSTOMER_SERVICE_TBL 
    ADD CONSTRAINT PK_CUSTOMER_SERVICE_TBL 
        PRIMARY KEY(CS_NO);

ALTER TABLE CUSTOMER_SERVICE_FILES_TBL 
    ADD CONSTRAINT PK_CUSTOMER_SERVICE_FILES_TBL 
        PRIMARY KEY(CS_FILE_NO);

ALTER TABLE NOTICE_TBL 
    ADD CONSTRAINT PK_NOTICE_TBL 
        PRIMARY KEY(NOTICE_NO);

ALTER TABLE NOTICE_FILES_TBL 
    ADD CONSTRAINT PK_NOTICE_FILES_TBL 
        PRIMARY KEY(NOTICE_FILE_NO);


ALTER TABLE SELLER_FILES_TBL
    ADD CONSTRAINT FK_SELLERFILE_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;
            
ALTER TABLE PRODUCT_QNA_TBL
    ADD CONSTRAINT FK_PROD_QNA_PRODUCT
        FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)
            ON DELETE CASCADE;

ALTER TABLE PRODUCT_QNA_TBL
    ADD CONSTRAINT FK_PROD_QNA_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO);

ALTER TABLE PRODUCT_SELLER_TBL
    ADD CONSTRAINT FK_PRODUCT_USER_PRODUCT
        FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)
            ON DELETE CASCADE;

ALTER TABLE PRODUCT_SELLER_TBL
    ADD CONSTRAINT FK_PRODUCT_USER_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;

ALTER TABLE QNA_FILES_TBL
    ADD CONSTRAINT FK_QNA_FILES_PROD_QNA
        FOREIGN KEY(QNA_NO) REFERENCES PRODUCT_QNA_TBL(QNA_NO)
            ON DELETE CASCADE;

ALTER TABLE QNA_FILES_TBL
    ADD CONSTRAINT FK_QNA_FILES_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;

ALTER TABLE ADDRESS_TBL
    ADD CONSTRAINT FK_ADDRESS_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;

ALTER TABLE CUSTOMER_SERVICE_TBL 
    ADD CONSTRAINT FK_CS_USER
        FOREIGN KEY(CS_WRITER) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;

ALTER TABLE CUSTOMER_SERVICE_FILES_TBL 
    ADD CONSTRAINT FK_CS_FILES_CS
        FOREIGN KEY(CS_NO) REFERENCES CUSTOMER_SERVICE_TBL(CS_NO)
            ON DELETE CASCADE;

ALTER TABLE NOTICE_FILES_TBL 
    ADD CONSTRAINT FK_NOTICE_FILES_TBL_NOTICE_TBL
        FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE_TBL(NOTICE_NO)
            ON DELETE CASCADE;

ALTER TABLE PRODUCT_TBL 
    ADD CONSTRAINT FK_PRODUCT_PRODCATEGORY
        FOREIGN KEY (CATEGORY_NO) REFERENCES PRODUCT_CATEGORY_TBL (CATEGORY_NO)
            ON DELETE SET NULL;

ALTER TABLE PRODUCT_FILES_TBL 
    ADD CONSTRAINT FK_PRODFILE_PRODUCT 
        FOREIGN KEY (PROD_NO) REFERENCES PRODUCT_TBL (PROD_NO)
                ON DELETE CASCADE;

ALTER TABLE ORDER_TBL
    ADD CONSTRAINT FK_ORDER_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO);

ALTER TABLE USER_COUPON_TBL
    ADD CONSTRAINT FK_USER_COUPON_COUPON
        FOREIGN KEY (COUPON_NO) REFERENCES COUPON_TBL(COUPON_NO);

ALTER TABLE USER_COUPON_TBL
    ADD CONSTRAINT FK_USER_COUPON_USER
        FOREIGN KEY (USER_NO) REFERENCES USER_TBL(USER_NO);

ALTER TABLE ORDER_DETAIL_TBL
    ADD CONSTRAINT FK_ORDER_DETAIL_ORDER
        FOREIGN KEY(ORDER_NO) REFERENCES ORDER_TBL(ORDER_NO)
            ON DELETE CASCADE;

ALTER TABLE ORDER_DETAIL_TBL
    ADD CONSTRAINT FK_ORDER_DETAIL_PRODUCT
        FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO);

ALTER TABLE ORDER_DETAIL_TBL
    ADD CONSTRAINT FK_ORDER_DETAIL_COUPON
        FOREIGN KEY(COUPON_NO) REFERENCES COUPON_TBL(COUPON_NO);

ALTER TABLE POINT_DETAIL_TBL
    ADD CONSTRAINT FK_POINT_DETAIL_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;

ALTER TABLE POINT_DETAIL_TBL
    ADD CONSTRAINT FK_POINT_DETAIL_ORDER
        FOREIGN KEY(ORDER_NO) REFERENCES ORDER_TBL(ORDER_NO)
            ON DELETE CASCADE;

ALTER TABLE POINT_DETAIL_TBL
    ADD CONSTRAINT FK_POINT_DETAIL_REVIEW
        FOREIGN KEY(REVIEW_NO) REFERENCES REVIEW_TBL(REVIEW_NO)
            ON DELETE CASCADE;
            
ALTER TABLE CART_TBL
    ADD CONSTRAINT FK_CART_USER
        FOREIGN KEY(USER_NO) REFERENCES USER_TBL(USER_NO)
            ON DELETE CASCADE;

ALTER TABLE CART_TBL
    ADD CONSTRAINT FK_CART_PRODUCT
        FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)
            ON DELETE CASCADE;

ALTER TABLE REVIEW_TBL
    ADD CONSTRAINT FK_REVIEW_ORDER_DETAIL
        FOREIGN KEY (ORDER_DETAIL_NO) REFERENCES ORDER_DETAIL_TBL(ORDER_DETAIL_NO)
            ON DELETE CASCADE;

ALTER TABLE REVIEW_FILES_TBL 
    ADD CONSTRAINT FK_RIVEW_FILES_RIVEW 
        FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW_TBL(REVIEW_NO) 
            ON DELETE CASCADE;

ALTER TABLE REVIEW_LIKE_TBL 
    ADD CONSTRAINT FK_REVIEW_LIKE_REVIEW 
        FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW_TBL(REVIEW_NO) 
            ON DELETE CASCADE;

ALTER TABLE REVIEW_LIKE_TBL 
    ADD CONSTRAINT FK_REVIEW_LIKE_USER
        FOREIGN KEY (USER_NO) REFERENCES USER_TBL(USER_NO);