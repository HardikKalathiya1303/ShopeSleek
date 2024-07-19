<?php
include('vendor/autoload.php');
require('connection.inc.php');
require('functions.inc.php');

if(!$_SESSION['ADMIN_LOGIN']){
	if(!isset($_SESSION['USER_ID'])){
		die();
	}
}

$order_id=get_safe_value($con,$_GET['id']);

$coupon_details=mysqli_fetch_assoc(mysqli_query($con,"select coupon_value from `order` where id='$order_id'"));
$coupon_value=$coupon_details['coupon_value'];

$css=file_get_contents('css/bootstrap.min.css');
$css.=file_get_contents('style.css');


		
		if(isset($_SESSION['ADMIN_LOGIN'])){
			$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image from order_detail,product ,`order` where order_detail.order_id='$order_id' and order_detail.product_id=product.id");
			$res_detail=mysqli_query($con,"select `order`.* from `order` where `order`.id='$order_id'");
		}else{
			$uid=$_SESSION['USER_ID'];
			$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image from order_detail,product ,`order` where order_detail.order_id='$order_id' and `order`.user_id='$uid' and order_detail.product_id=product.id");
			$res_detail=mysqli_query($con,"select `order`.* from `order` where `order`.user_id='$uid' and `order`.id='$order_id'");
		}
		
		$total_price=0;
		if(mysqli_num_rows($res)==0){
			die();
		}
		$html='<div class="wishlist-table table-responsive">
   <table>
      <thead>
         <tr>
		 <th class="product-thumbnail">Order Time</th>
            <th class="product-thumbnail">Address</th>
            <th class="product-thumbnail">City</th>
            <th class="product-name">Pincode</th>
            <th class="product-price">Payment_type</th>
            
         </tr>
      </thead>
      <tbody>';
		while($row_detail=mysqli_fetch_assoc($res_detail)){
			$html.='<tr>
            <td class="product-name">'.$row_detail['added_on'].'</td>
            <td class="product-name">'.$row_detail['address'].'</td>
            <td class="product-name">'.$row_detail['city'].'</td>
            <td class="product-name">'.$row_detail['pincode'].'</td>
            <td class="product-name">'.$row_detail['payment_type'].'</td>
           
         </tr>';
		 }
		 $html.='</tbody>
		 </table><br><br>';
		$html.='<div class="wishlist-table table-responsive">
   <table>
      <thead>
         <tr>
            <th class="product-thumbnail">Product Name</th>
            <th class="product-thumbnail">Product Image</th>
            <th class="product-name">Qty</th>
            <th class="product-price">Price</th>
            <th class="product-price">Total Price</th>
         </tr>
      </thead>
      <tbody>';
		while($row=mysqli_fetch_assoc($res)){
		$total_price=$total_price+($row['qty']*$row['price']);
		 $pp=$row['qty']*$row['price'];
         $html.='<tr>
            <td class="product-name">'.$row['name'].'</td>
            <td class="product-name"> <img width="80px" src="'.PRODUCT_IMAGE_SITE_PATH.$row['image'].'"></td>
            <td class="product-name">'.$row['qty'].'</td>
            <td class="product-name">'.$row['price'].'</td>
            <td class="product-name">'.$pp.'</td>
         </tr>';
		 }
		 
		if($coupon_value!=''){								
			$html.='<tr>
				<td colspan="3"></td>
				<td class="product-name">Coupon Value</td>
				<td class="product-name">'.$coupon_value.'</td>
				
			</tr>';
		}
		 
		$total_price=(int)$total_price-(int)$coupon_value;
		 $html.='<tr>
				<td colspan="3"></td>
				<td class="product-name">Total Price</td>
				<td class="product-name">'.$total_price.'</td>
				
			</tr>';
		 
      $html.='</tbody>
   </table>
</div>';
$mpdf=new \Mpdf\Mpdf();
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html,2);
$file=time().'.pdf';
$mpdf->Output($file,'D');
?>
