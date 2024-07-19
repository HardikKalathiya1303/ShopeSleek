<?php 
ob_start();
require('top.php');
if(isset($_GET['id'])){
	$product_id=mysqli_real_escape_string($con,$_GET['id']);
	if($product_id>0){
		$get_product=get_product($con,'','',$product_id);
	}else{
		?>
		<script>
		window.location.href='index.php';
		</script>
		<?php
	}
	
	$resMultipleImages=mysqli_query($con,"select product_images from product_images where product_id='$product_id'");
	$multipleImages=[];
	if(mysqli_num_rows($resMultipleImages)>0){
		while($rowMultipleImages=mysqli_fetch_assoc($resMultipleImages)){
			$multipleImages[]=$rowMultipleImages['product_images'];
		}
	}
}else{
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
?>
        <section class="htc__product__details all_bg ptb--50">
            <div class="htc__product__details__top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12 text-center">
                            <div class="htc__product__details__tab__content">
                                <div class="product__big__images">
                                    <div class="portfolio-full-image tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" style="border: #c2c2c2 solid 2px;padding: 16px;" id="img-tab-1">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$get_product['0']['image']?>">
                                        </div>									
										<?php if(isset($multipleImages[0])){?>
										<div id="multiple_images">
											<?php
											foreach($multipleImages as $list){
											echo "<img style='border: #c2c2c2 solid 1px;padding: 5px;' src='".PRODUCT_MULTIPLE_IMAGE_SITE_PATH.$list."' onclick=showMultipleImage('".PRODUCT_MULTIPLE_IMAGE_SITE_PATH.$list."')>";
											}
											?>
											
										</div>
										<?php } ?>
                                    </div>
                                </div>
                            </div>
							
                        </div>
						
                        <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                            <div class="ht__product__dtl">
                                <h2><?php echo $get_product['0']['name']?></h2>
                                <ul  class="pro__prize">
								<li style="font-size: 25px;"><i class="fa fa-inr"></i><?php echo $get_product['0']['price']?></li>
                                    <li class="old__prize"style="padding-left: 10px;font-size: 15px;"><i class="fa fa-inr"></i><?php echo $get_product['0']['mrp']?></li>
									  <li style="color: #00c237; font-size: 15px;padding-left:2px;"><?php echo round(($get_product['0']['mrp']-$get_product['0']['price'])/$get_product['0']['mrp']*100, 0);?>% Off</li>
                                </ul>
                                <p class="pro__info"><?php echo $get_product['0']['short_desc']?></p>
                                <div class="ht__pro__desc">
                                    <div class="sin__desc">
										<?php
										$productSoldQtyByProductId=productSoldQtyByProductId($con,$get_product['0']['id']);
										
										$pending_qty=$get_product['0']['qty']-$productSoldQtyByProductId;
										
										$cart_show='yes';
										if($get_product['0']['qty']>$productSoldQtyByProductId){
											$stock='In Stock';			
										}else{
											$stock='Not in Stock';
											$cart_show='';
										}
										?>
                                        <p><span>Availability:</span> <?php echo $stock?></p>
                                    </div>
									<div class="sin__desc"style="padding-top: 10px;">
										<?php
										if($cart_show!=''){
										?>
                                        <p><span>Qty:</span> 
										<select id="qty" class="qty_sele">
											<?php
											for($i=1;$i<=$pending_qty;$i++){
												echo "<option>$i</option>";
											}
											?>
										</select>
										</p>
										<?php } ?>
                                    </div>
                                    <div class="sin__desc align--left">
                                        <p><span>Categories:</span></p>
                                        <ul class="pro__cat__list">
                                            <li><a href="#"><?php echo $get_product['0']['categories']?></a></li>
                                        </ul>
                                    </div>
									<div id="social_share_box">
									<a href="https://facebook.com/share.php?u=<?php echo $meta_url?>"><img src='images/icons/facebook.png'/></a>
									<a href="https://twitter.com/share?text=<?php echo $get_product['0']['name']?>&url=<?php echo $meta_url?>"><img src='images/icons/twitter.png'/></a>
									<a href="https://api.whatsapp.com/send?text=<?php echo $get_product['0']['name']?> <?php echo $meta_url?>"><img src='images/icons/whatsapp.png'/></a>
								</div>
                                    
                                    </div>
									
                                </div>
								<?php
								if($cart_show!=''){
								?>
								 <div class="row">
								 <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 smt-40 xmt-40 text-center">
								<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
								</div>
								<div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 smt-40 xmt-40 text-center">
								<a class="fr__btn buy_now" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add','yes')">Buy Now</a>
								</div>
								</div>
								<?php } ?>
								
								
		
                            </div>
							
                        </div>
				<div class="row">
                   	<div class="col-xs-12 desc_product">
						<span>description</span>
					</div>
				</div>
				<div class="row">
                    <div class="col-xs-12">
                        <div class="ht__pro__details__content">
                            <div role="tabpanel" id="description" class="pro__single__content tab-pane fade in active">
                                <div class="pro__tab__content__inner">
                                   <p> <?php echo $get_product['0']['description']?></p>
                                </div>
                            </div>                  
                        </div>
                    </div>
                </div>
                    </div>
                </div>
            </div>
		<?php
		if(isset($_COOKIE['recently_viewed'])){
			$arrRecentView=unserialize($_COOKIE['recently_viewed']);
			$countRecentView=count($arrRecentView);
			$countStartRecentView=$countRecentView-4;
			if($countStartRecentView>4){
				$arrRecentView=array_slice($arrRecentView,$countStartRecentView,4);
			}
			$recentViewId=implode(",",$arrRecentView);
			$res=mysqli_query($con,"select * from product where id IN ($recentViewId) and status=1");
			
		?>
		<section class="htc__produc__decription all_bg">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h3 style="font-size: 20px;font-weight: bold;">Recently Viewed</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="ht__pro__details__content">
                            <div class="row">
								<?php while($list=mysqli_fetch_assoc($res)){?>
								<div class="col-md-3 col-lg-2 col-sm-4 col-xs-6 padd_pro">
									<div class="category">
												<div class="ht__cat__thumb">
													<a href="product.php?id=<?php echo $list['id']?>">
														<img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$list['image']?>" alt="product images">
													</a>
												</div>
												<div class="wish_plus_position">
										<ul >
											<li><a href="javascript:void(0)" onclick="wishlist_manage('<?php echo $list['id']?>','add')"> <span class="fa fa-heart wish_plus"> </span></a></li>
											
										</ul>
									</div>
												<div class="fr__product__inner">
													<h4><a href="product.php?id=<?php echo $list['id']?>"><?php echo substr($list['name'],0,70);?>...</a></h4>
													<ul class="fr__pro__prize">
														<li class="old__prize"><i class="fa fa-inr"></i><?php echo $list['mrp']?></li>
														<li><i class="fa fa-inr"></i><?php echo $list['price']?></li>
														<li style="color: #00c237;"><?php echo round(($list['mrp']-$list['price'])/$list['mrp']*100, 0);?>% Off</li>
													</ul>
												</div>
												<div class="btn_div_cart">
                                    <ul >
                                        <li>	<button class="cart_prrduct_btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $list['id']?>','add')"> <span class="fa fa-cart-plus "> </span><span class="btn_cart_text"> Add To Cart</span></button>
                                            
                                        </li>
                                     </ul>
            
                                     </div>
											</div>
										
								</div>
								<?php } ?>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		<?php 
			$arrRec=unserialize($_COOKIE['recently_viewed']);
			if(($key=array_search($product_id,$arrRec))!==false){
				unset($arrRec[$key]);
			}
			$arrRec[]=$product_id;
		}else{
			$arrRec[]=$product_id;
		}
		setcookie('recently_viewed',serialize($arrRec),time()+60*60*24*365);
		?>
		
			<script>
			function showMultipleImage(im){
				jQuery('#img-tab-1').html("<img src='"+im+"'/>");
			}
			</script>			
<?php 
require('footer.php');
ob_flush();
?>        