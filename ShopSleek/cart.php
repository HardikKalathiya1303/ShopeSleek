<?php 
require('top.php');
$total_cart_price=0;
$coupon_Val_default=0;
$cart_item_count=0;
?>
<main class="page">
	 	<section class="shopping-cart dark">
	 		<div class="container">
		        <div class="block-heading">
		          <h2>Cart</h2>
		         
		        </div>
		        <div class="content">
	 				<div class="row">
	 					<div class="col-md-12 col-lg-8">
	 						<div class="items">
                             <?php
										if(isset($_SESSION['cart'])){
											foreach($_SESSION['cart'] as $key=>$val){
											$productArr=get_product($con,'','',$key);
											$pname=$productArr[0]['name'];
											$mrp=$productArr[0]['mrp'];
											$price=$productArr[0]['price'];
											$image=$productArr[0]['image'];
											$qty=$val['qty'];
											$cart_item_count=$cart_item_count+1;
											?>
				 				<div class="product border_bottom">
				 					<div class="row">
					 					<div class="col-md-3 text-center">
                                         <img class="img-fluid mx-auto d-block image pro_cart_img" src="<?php echo PRODUCT_IMAGE_SITE_PATH.$image?>">

					 					</div>
					 					<div class="col-md-9">
					 						<div class="info">
						 						<div class="row">
							 						<div class="col-md-6 product-name_cart">
							 							<div class="product-name">
														 <div class="product-name"><a href="product.php?id=<?php echo $key?>"><?php echo substr($pname,0,100);?>...</a>
													<ul  class="pro__prize">
														<li class="old__prize"><i class="fa fa-inr"></i><?php echo $mrp?></li>
														<li><i class="fa fa-inr"></i><?php echo $price?></li>
													</ul>
											</div>
								 							
									 					</div>
							 						</div>
							 						<div class="col-md-3 quantity">
							 							<label for="quantity">Quantity:</label>
											        	<input class="form-control quantity-input" type="number" id="<?php echo $key?>qty" value="<?php echo $qty?>" />
														<a href="javascript:void(0)" onclick="manage_cart('<?php echo $key?>','update')"><span class="qty_up_link">update</span></a>
							 						</div>
							 						<div class="col-md-2 price">
							 							<span><i class="fa fa-inr"></i><?php echo $qty*$price;?></span>
							 						</div>
													 <div class="col-md-1 price">
							 							<span><a href="javascript:void(0)" onclick="manage_cart('<?php echo $key?>','remove')"><i class="fa fa-trash-o"></i></a></span>
							 						</div>
							 					</div>
							 				</div>
					 					</div>
					 				</div>
				 				</div>
                                 <?php  $total_cart_price=$total_cart_price+$qty*$price; } } ?>
				 			</div>
			 			</div>
			 			<div class="col-md-12 col-lg-4 ">

						 
						<div class="summary">
						<h3>COUPON APPLY</h3>
						<div class="ordre-details__total bilinfo">
                           <input type="textbox" id="coupon_str" class="coupon_style mr5"/>
						    <input type="button" name="submit" class="btn btn-primary btn-lg btn-block cart_btn" value="Apply Coupon" onclick="set_coupon()"/>								
                        </div>
							<div id="coupon_result"></div>
							</div>
			 				<div class="summary">
			 					<h3>PRICE DETAILS</h3>
			 					<div class="summary-item"><span class="text">Price</span><span class="text">(<?php echo $cart_item_count;?> items)</span><span class="price"><i class="fa fa-inr"></i><?php echo $total_cart_price;?></span></div>
			 					<div class="summary-item"><span class="text">Discount</span><span class="price"  id="coupon_price"><i class="fa fa-inr"></i><?php echo $coupon_Val_default?></span></div>
			 					<div class="summary-item"><span class="text">Total Amount</span><span class="price" id="order_total_price"><i class="fa fa-inr"></i><?php echo $total_cart_price?></span></div>
								 <a class="btn btn-primary btn-lg btn-block cart_btn" href="checkout.php">PLACE ORDER</a>
				 			</div>
			 			</div>
		 			</div> 
		 		</div>
	 		</div>
		</section>
	</main> 
	<script>
			function set_coupon(){
				var coupon_str=jQuery('#coupon_str').val();
				if(coupon_str!=''){
					jQuery('#coupon_result').html('');
					jQuery.ajax({
						url:'set_coupon.php',
						type:'post',
						data:'coupon_str='+coupon_str,
						success:function(result){
							var data=jQuery.parseJSON(result);
							if(data.is_error=='yes'){
								jQuery('#coupon_box').hide();
								jQuery('#coupon_result').html(data.dd);
								jQuery('#order_total_price').html(data.result);
								jQuery('#coupon_price').html("0");
							}
							if(data.is_error=='no'){
								jQuery('#coupon_box').show();
								jQuery('#coupon_price').html(data.dd);
								jQuery('#order_total_price').html(data.result);
							}
						}
					});
				}
			}
		</script>		
<?php require('footer.php')?>