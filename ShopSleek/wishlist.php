<?php 
require('top.php');
if(!isset($_SESSION['USER_LOGIN'])){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
$uid=$_SESSION['USER_ID'];

$res=mysqli_query($con,"select product.name,product.image,product.price,product.mrp,product.id as pid,wishlist.id from product,wishlist where wishlist.product_id=product.id and wishlist.user_id='$uid'");
?>

<main class="page">
	 	<section class="shopping-cart dark">
	 		<div class="container">
		        <div class="block-heading">
		          <h2>Wishlist</h2>
		         
		        </div>
		        <div class="content">
	 				<div class="row">
	 					<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
	 						<div class="items">
                             <?php
										while($row=mysqli_fetch_assoc($res)){
										?>
				 				<div class="product border_bottom">
				 					<div class="row">
					 					<div class="col-md-4 col-lg-4 col-sm-6 col-xs-4 text-center">
                                         <a href="#"><img  class="img-fluid mx-auto d-block image pro_cart_img" src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"  /></a>
					 					</div>
					 					<div class="col-md-8 col-lg-8 col-sm-6 col-xs-8">
					 						<div class="info">
						 						<div class="row">
							 						<div class="col-md-8 col-lg-8 col-sm-6 col-xs-7 product-name_cart">
							 							<div class="product-name">
														 <div class="product-name"><a href="#"><?php echo $row['name']?></a>
													    <ul  class="pro__prize">
													    	<li class="old__prize"><i class="fa fa-inr"></i><?php echo $row['mrp']?></li>
														    <li><i class="fa fa-inr"></i><?php echo $row['price']?></li>
													    </ul>
                                                         </div>
									 					</div>
							 					    	</div>							 						
													    <div class="col-md-2 col-lg-2 col-sm-6 col-xs-5 text-center price">
							 							<span><a href="wishlist.php?wishlist_id=<?php echo $row['id']?>"><i class="fa fa-trash-o"></i></a></span>
							 						</div>
													 <div class="col-md-2 col-lg-2 col-sm-6 col-xs-5 text-center price">
													 <span><a href="javascript:void(0)" onclick="manage_cart('<?php echo $row['pid']?>','add')"><i class="fa fa-cart-plus"></i></a></span>
													</div>
							 					</div>
							 				</div>
					 					</div>
					 				</div>
				 				</div>
                                 <?php  }  ?>
				 			</div>
			 			</div>
			 			
			 			</div>
		 			</div> 
		 		</div>
	 		</div>
		</section>
	</main> 
	<input type="hidden" id="qty" value="1"/>	
<?php require('footer.php')?>