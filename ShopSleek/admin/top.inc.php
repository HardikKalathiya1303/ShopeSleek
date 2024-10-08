<?php
require('connection.inc.php');
require('functions.inc.php');
if(isset($_SESSION['ADMIN_LOGIN']) && $_SESSION['ADMIN_LOGIN']!=''){

}else{
	header('location:login.php');
	die();
}
?>
<!doctype html>
<html class="no-js" lang="">
   <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Dashboard Page</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="assets/css/normalize.css">
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/font-awesome.min.css">
      <link rel="stylesheet" href="assets/css/themify-icons.css">
      <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
      <link rel="stylesheet" href="assets/css/flag-icon.min.css">
      <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
   </head>
   <body style="background-color: #fff;" id="body_img" ><!--<img src="images/admin_bg.png">-->
      <aside id="left-panel" class="left-panel">
         <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
               <ul class="nav navbar-nav">
                  <li class="menu-title"><i class="fa fa-home padd_icon"></i>Menu</li>
                  <?php if($_SESSION['ADMIN_ROLE']!=1){?>
                  <li class="menu-item-has-children dropdown">
                  <a href="index.php" ><i class="fa fa-tachometer padd_icon"></i> Dashboard</a>
               </li>
               <?php }?>
				  <li class="menu-item-has-children dropdown">
                     <a href="product.php" ><i class="fa fa-inbox padd_icon"></i> Product Master</a>
                  </li>
				  <li class="menu-item-has-children dropdown">

                     <?php 
					 if($_SESSION['ADMIN_ROLE']==1){
						echo '<a href="order_master_vendor.php"><i class="fa fa-shopping-cart padd_icon"></i>Order Master</a>';
					 }else{
						echo '<a href="order_master.php" ><i class="fa fa-shopping-cart padd_icon"></i>Order Master</a>';
					 }
					 ?>
					 
					 
                  </li>
				  <?php if($_SESSION['ADMIN_ROLE']!=1){?>
				  <li class="menu-item-has-children dropdown">
                     <a href="banner.php" ><i class="fa fa-picture-o padd_icon"></i> Banner Master</a>
                  </li>
				   <li class="menu-item-has-children dropdown">
                     <a href="vendor_management.php" ><i class="fa fa-user padd_icon"></i> Vendor Management</a>
                  </li>
				  <li class="menu-item-has-children dropdown">
                     <a href="categories.php" ><i class="fa fa-list-ul padd_icon"></i> Categories Master</a>
                  </li>
				  <li class="menu-item-has-children dropdown">
                     <a href="sub_categories.php" ><i class="fa fa-list padd_icon"></i> Sub Categories Master</a>
                  </li>
                  
				  <li class="menu-item-has-children dropdown">
                     <a href="users.php" ><i class="fa fa-users  padd_icon"></i> User Master</a>
                  </li>
				  <li class="menu-item-has-children dropdown">
                     <a href="coupon_master.php" ><i class="fa fa-gift padd_icon"></i> Coupon Master</a>
                  </li>
				  <?php } ?>
               </ul>
            </div>
         </nav>
      </aside>
      <div id="right-panel" class="right-panel">
         <header id="header" class="header">
            <div class="top-left">
               <div class="navbar-header">
                  <a class="navbar-brand" href="index.php"><img src="images/Shopsleek.png" alt="Logo"height="40"></a>
                  <a class="navbar-brand hidden" href="index.php"><img src="images/Shopsleek.png" alt="Logo"></a>
                  <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
               </div>
            </div>
            <div class="top-right">
               <div class="header-menu">
                  <div class="user-area dropdown float-right">
                     <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Welcome <?php echo $_SESSION['ADMIN_USERNAME']?></a>
                     <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="logout.php"><i class="fa fa-power-off"></i>Logout</a>
                     </div>
                  </div>
               </div>
            </div>
         </header>