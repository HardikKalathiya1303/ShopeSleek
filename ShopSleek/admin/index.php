<?php
require('top.inc.php');
isAdmin();
$user_d=mysqli_query($con,"select id from users");
$user_count=mysqli_num_rows($user_d);
$order_d=mysqli_query($con,"select id from `order` ");
$order_count=mysqli_num_rows($order_d);
$product_d=mysqli_query($con,"select id from product ");
$product_count=mysqli_num_rows($product_d);
$vendor_d=mysqli_query($con,"select id from admin_users where role=1 ");
$vendor_count=mysqli_num_rows($vendor_d);
?>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Dashboard</h4>
				</div>
			</div>
		  </div>
	   </div>
	</div>
</div>
<style>
.radius-10 {
    border-radius: 10px !important;
}

.border-info {
    border-left: 5px solid  #0dcaf0 !important;
}
.border-danger {
    border-left: 5px solid  #fd3550 !important;
}
.border-success {
    border-left: 5px solid  #15ca20 !important;
}
.border-warning {
    border-left: 5px solid  #ffc107 !important;
}


.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0px solid rgba(0, 0, 0, 0);
    border-radius: .25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
}
.bg-gradient-scooter {
    background: #17ead9;
    background: -webkit-linear-gradient( 
45deg
 , #17ead9, #6078ea)!important;
    background: linear-gradient( 
45deg
 , #17ead9, #6078ea)!important;
}
.widgets-icons-2 {
    width: 56px;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #ededed;
    font-size: 27px;
    border-radius: 10px;
}
.rounded-circle {
    border-radius: 50%!important;
}
.text-white {
    color: #fff!important;
}
.ms-auto {
    margin-left: auto!important;
}
.bg-gradient-bloody {
    background: #f54ea2;
    background: -webkit-linear-gradient( 
45deg
 , #f54ea2, #ff7676)!important;
    background: linear-gradient( 
45deg
 , #f54ea2, #ff7676)!important;
}

.bg-gradient-ohhappiness {
    background: #00b09b;
    background: -webkit-linear-gradient( 
45deg
 , #00b09b, #96c93d)!important;
    background: linear-gradient( 
45deg
 , #00b09b, #96c93d)!important;
}

.bg-gradient-blooker {
    background: #ffdf40;
    background: -webkit-linear-gradient( 
45deg
 , #ffdf40, #ff8359)!important;
    background: linear-gradient( 
45deg
 , #ffdf40, #ff8359)!important;
}
	</style>
<div class="container">
<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
       <div class="col">
		 <div class="card radius-10 border-start border-0 border-3 border-info">
			<div class="card-body">
				<div class="d-flex align-items-center">
					<div>
						<p class="mb-0 text-secondary">Total Orders</p>
						<h4 class="my-1 text-info"><?php echo $order_count; ?></h4>
						
					</div>
					<div class="widgets-icons-2 rounded-circle bg-gradient-scooter text-white ms-auto"><i class="fa fa-shopping-cart"></i>
					</div>
				</div>
			</div>
		 </div>
	   </div>
	   <div class="col">
		<div class="card radius-10 border-start border-0 border-3 border-danger">
		   <div class="card-body">
			   <div class="d-flex align-items-center">
				   <div>
					   <p class="mb-0 text-secondary">Total Product</p>
					   <h4 class="my-1 text-danger"><?php echo $product_count; ?></h4>
					
				   </div>
				   <div class="widgets-icons-2 rounded-circle bg-gradient-bloody text-white ms-auto"><i class="fa fa-inbox"></i>
				   </div>
			   </div>
		   </div>
		</div>
	  </div>
	  <div class="col">
		<div class="card radius-10 border-start border-0 border-3 border-success">
		   <div class="card-body">
			   <div class="d-flex align-items-center">
				   <div>
					   <p class="mb-0 text-secondary">Total Vendor</p>
					   <h4 class="my-1 text-success"><?php echo $vendor_count; ?></h4>
					 
				   </div>
				   <div class="widgets-icons-2 rounded-circle bg-gradient-ohhappiness text-white ms-auto"><i class="fa fa-user"></i>
				   </div>
			   </div>
		   </div>
		</div>
	  </div>
	  <div class="col">
		<div class="card radius-10 border-start border-0 border-3 border-warning">
		   <div class="card-body">
			   <div class="d-flex align-items-center">
				   <div>
					   <p class="mb-0 text-secondary">Total Customers</p>
					   <h4 class="my-1 text-warning"><?php echo $user_count; ?></h4>
				
				   </div>
				   <div class="widgets-icons-2 rounded-circle bg-gradient-blooker text-white ms-auto"><i class="fa fa-users"></i>
				   </div>
			   </div>
		   </div>
		</div>
	  </div> 
	</div>
</div>
