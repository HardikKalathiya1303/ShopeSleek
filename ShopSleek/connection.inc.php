<?php
session_start();
$con=mysqli_connect("localhost","root","","shopsleek_database");
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/jasoliya_mart/JasolyaMart/');
define('SITE_PATH','http://127.0.0.1/jasoliya_mart/JasolyaMart/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/product/');

define('PRODUCT_MULTIPLE_IMAGE_SERVER_PATH',SERVER_PATH.'media/product_images/');
define('PRODUCT_MULTIPLE_IMAGE_SITE_PATH',SITE_PATH.'media/product_images/');

define('BANNER_SERVER_PATH',SERVER_PATH.'media/banner/');
define('BANNER_SITE_PATH',SITE_PATH.'media/banner/');
?>