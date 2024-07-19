<?php 
require('top.php');

$resBanner=mysqli_query($con,"select * from banner where status='1' order by order_no asc");

?>
<div class="body__overlay"></div>
        <?php if(mysqli_num_rows($resBanner)>0){?>
        <div class="slider__container slider--one all_bg">
            <div class="slide__container slider__activation__wrap owl-carousel">
                <?php while($rowBanner=mysqli_fetch_assoc($resBanner)){?>
                <div class="single__slide animation__style01 slider__fixed--height">
                    <div class="container">
                        <div class="row align-items__center">
                            <div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
                                <div class="slide">
                                    <div class="slider__inner">
                                        <h2><?php echo $rowBanner['heading1']?></h2>
                                        <h1><?php echo $rowBanner['heading2']?></h1>
										
										<?php
										if($rowBanner['btn_txt'] !='' && $rowBanner['btn_link']!=''){
											?>
											<div class="cr__btn">
												<a href="<?php echo $rowBanner['btn_link']?>"><?php echo $rowBanner['btn_txt']?></a>
											</div>
											<?php
										}
										?>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
                                <div class="slide__thumb">
                                    <img src="<?php echo BANNER_SITE_PATH.$rowBanner['image']?>" >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<?php } ?>
            </div>
        </div>
		<?php } ?>
        <section class="htc__category__area  all_bg">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center title_new">
                            <h2 class="title__line"><span >New Arrivals</span></h2>
                        </div>
                    </div>
                </div>
                <div class="htc__product__container">
                    <div class="row">
                        <div class="product__list clearfix mt--20">
							<?php
							$get_product=get_product($con,6);
							foreach($get_product as $list){
							?>
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
        </section>
        <section class="ftr__product__area ptb--20 all_bg">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center title_best">
                            <h2 class="title__line"><span>Best Seller</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product__list clearfix mt--20">
							<?php
							$get_product=get_product($con,6,'','','','','yes');
							foreach($get_product as $list){
							?>
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
        </section>
		<input type="hidden" id="qty" value="1"/>
<?php require('footer.php')?>        