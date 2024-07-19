<?php
require('connection.inc.php');
require('functions.inc.php');
$msg='';
if(isset($_POST['submit'])){
	$username=get_safe_value($con,$_POST['username']);
	$password=get_safe_value($con,$_POST['password']);
	$sql="select * from admin_users where username='$username' and password='$password'";
	$res=mysqli_query($con,$sql);
	$count=mysqli_num_rows($res);
	if($count>0){
		$row=mysqli_fetch_assoc($res);
		if($row['status']=='0'){
			$msg="Account deactivated";	
		}else{
			$_SESSION['ADMIN_LOGIN']='yes';
			$_SESSION['ADMIN_ID']=$row['id'];
			$_SESSION['ADMIN_USERNAME']=$username;
			$_SESSION['ADMIN_ROLE']=$row['role'];
			header('location:index.php');
			die();
		}
	}else{
		$msg="Please enter correct login details";	
	}
	
}
?>
<!doctype html>
<html class="no-js" lang="">
   <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Login Page</title>
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
   <body >
      <section class="htc__contact__area all_bg ptb_login">
        
        <div class="container py-5 h-100">
          <div class="row login__center justify-content-md-center h-100">
         
            <div class="col col-lg-6 mb-4 mb-lg-0 login_box admin_card">
              <div class="card mb-3" style="border-radius: .5rem;">
                <div class="row g-0">
                  <div class="col-md-4 gradient-custom text-center text-white">
                  <span class="side_login"><h2>Admin/<br>Vendor</h2></span>
                  <div class="side_info">Get access Dashboard </div>
                  <div style="width:100px;">
                  </div>
      
                    <img class="side_img" src="images/login_flip.png">
                   
                  </div>
                  <div class="col-md-8">
                    <div class="card-body p-4">
                    <h2 class="title__line-login ">Login</h2>
                      <hr class="mt-0 mb-4">
                      <div class="row pt-1">
                        <div class="col-md-12 col-lg-12 col-sm-6 col-xs-12 mb-3">
                        <form id="login-form" method="post" autocomplete="off">
                        <div class="contact-box name">
                       
                        <input type="text" name="username" class="form-control" placeholder="Username" required>
                     </div>
                          <span class="field_error" id="login_email_error"></span>
                        </div>
                        <div class="col-md-12 col-lg-12 col-sm-6 col-xs-12 mb-3">
                        <div class="contact-box name">
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                     </div>
                                    <span class="field_error" id="login_password_error"></span>
                        </div>
                      </div>
                      <div class="contact-btn">
                      <button type="submit" name="submit" class="btn_blue">Sign in</button>
                          
                                    <div>       
      </form>
      <div class="field_error"><?php echo $msg?></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <script src="assets/js/vendor/jquery-2.1.4.min.js" type="text/javascript"></script>
      <script src="assets/js/popper.min.js" type="text/javascript"></script>
      <script src="assets/js/plugins.js" type="text/javascript"></script>
      <script src="assets/js/main.js" type="text/javascript"></script>
   </body>
</html>