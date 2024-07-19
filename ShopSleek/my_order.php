<?php 
require('top.php');
if(!isset($_SESSION['USER_LOGIN'])){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}

?>

<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');body{background-color: #eeeeee;font-family: 'Open Sans',serif}#pre_card .card h6{border-bottom: #dddddd solid; padding:5px 0px; }.card-body .row{padding-top:5px;} #pre_card .card{position: relative;display: -webkit-box; padding:10px;display: -ms-flexbox;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;-ms-flex-direction: column;flex-direction: column;min-width: 0;word-wrap: break-word;background-color: #fff;background-clip: border-box;border: 2px solid rgba(0, 0, 0, 0.2);border-radius: 3px;margin: 5px 2px;}#pre_card .card-header:first-child{border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0}#pre_card .card-header{padding: 0.75rem 1.25rem;margin-bottom: 0;background-color: #fff;color:#2874f0;font-size:22px;text-align:center;border-bottom: 1px solid rgba(0, 0, 0, 0.1)}.itemside .aside{position: relative;-ms-flex-negative: 0;flex-shrink: 0}.img-sm{width: 80px;height: 80px;padding: 7px}ul.row, ul.row-sm{list-style: none;padding: 0;padding-top:20px}.itemside .info{padding-left: 15px;padding-right: 7px}.itemside .title{display: block;margin-bottom: 5px;color: #212529}p{margin-top: 0;margin-bottom: 1rem}.btn-warning{color: #ffffff;background-color: #ee5435;border-color: #ee5435;border-radius: 1px}.btn-warning:hover{color: #ffffff;background-color: #ff2b00;border-color: #ff2b00;border-radius: 1px}
</style>

<div class="container" id="pre_card">
    <div class="card">
        <header class="card-header"> My Orders / Tracking </header>
       
        <?php
											$uid=$_SESSION['USER_ID'];
											$res=mysqli_query($con,"select `order`.*,order_status.name as order_status_str from `order`,order_status where `order`.user_id='$uid' and order_status.id=`order`.order_status order by `order`.id desc");
											while($row=mysqli_fetch_assoc($res)){
											?>
       
           
            <div class="card-body">
            <div class="card">
            <h6>Order ID:<?php echo $row['id']?></h6>
                <div class="card-body row">
                    <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6"> <strong>Order Time:</strong> <br><?php echo $row['added_on']?> </div>
                    <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6"> <strong>Address:</strong> <br><?php echo $row['address']?><br/><?php echo $row['city']?><br/><?php echo $row['pincode']?></div>
                    <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6"> <strong>Payment:</strong> <br>Type: <?php echo $row['payment_type']?> <br>Status: <?php echo $row['payment_status']?></div>
                    <div class="col-md-3 col-lg-3 col-sm-3 col-xs-6"> <strong>Order Status:</strong> <br> <?php echo ucfirst($row['order_status_str'])?></div>
                </div>
                <div class="card-body row">
                   
                   <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12 "> <strong><i class="fa fa-file-text-o down_invo_ico" ></i>Download Invoice:</strong><a href="order_pdf.php?id=<?php echo $row['id']?>"><span class="down_order">Download</span></a></div>
                   <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12"> <strong>Order Detail:</strong><a href="my_order_details.php?id=<?php echo $row['id']?>"><span class="down_order">Click Here</span></a></div>
               </div>
            </div>
         

            <?php }?>
            <a href="#" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to orders</a>
        </div>
    </div>
</div>

<?php require('footer.php')?>        