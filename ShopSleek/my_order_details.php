<?php 
require('top.php');
if(!isset($_SESSION['USER_LOGIN'])){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}

$order_id=get_safe_value($con,$_GET['id']);

$coupon_details=mysqli_fetch_assoc(mysqli_query($con,"select coupon_value from `order` where id='$order_id'"));
$coupon_value=$coupon_details['coupon_value'];
if($coupon_value==''){
	$coupon_value=0;	
}
?>

<div class="container" id="pre_card">
    <div class="card">
        <header class="card-header"> My Orders  </header>
		<div class="card-body row">
                   
                   
                   <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12"> <strong><i class=""></i></a></div>
               </div>
       
        <?php
					$uid=$_SESSION['USER_ID'];
					$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image from order_detail,product ,`order` where order_detail.order_id='$order_id' and `order`.user_id='$uid' and order_detail.product_id=product.id");
					$total_price=0;
				 
					while($row=mysqli_fetch_assoc($res)){
					$total_price=$total_price+($row['qty']*$row['price']);
				   
											?>
       
           
            <div class="card-body">
            <div class="card">
                <div class="card-body row">
				    <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12 text-center"> <img width="80px"src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"></div>
                    <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12"> <?php echo $row['name']?></div>
                    <div class="col-md-2 col-lg-2 col-sm-3 col-xs-4"><strong>Qty:</strong> <br> <?php echo $row['qty']?></div>
                    <div class="col-md-2 col-lg-2 col-sm-3 col-xs-4"><strong>Price:</strong> <br> <i class="fa fa-inr"></i><?php echo $row['price']?></div>
                    <div class="col-md-2 col-lg-2 col-sm-3 col-xs-4"><strong>Total:</strong> <br> <i class="fa fa-inr"></i><?php echo $row['qty']*$row['price']?></div>
                </div>
               
            </div>
         

            <?php }
			if($coupon_value!=''){
				?>
				<div class="card">
			   <div class="card-body row">
                   
                   <div class="col-md-8 col-lg-8 col-sm-6 col-xs-12 text-center "> <strong>Coupon :</strong></div>
                   <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12 text-center"> <strong><i class="fa fa-inr"></i><?php echo $coupon_value?></a></div>
               </div>
               </div>
			   <?php } ?>
			   <div class="card">
			   <div class="card-body row">
                   
                   <div class="col-md-8 col-lg-8 col-sm-6 col-xs-12 text-center"> <strong>Total Payment</strong></div>
                   <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12 text-center"> <strong><i class="fa fa-inr"></i><?php echo $total_price-$coupon_value;?>
               </div>
               </div>
        </div>
		<a href="my_order.php" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to orders</a>
    </div>
</div>
				
<?php require('footer.php')?>        