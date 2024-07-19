<?php 
require('top.php');
if(isset($_SESSION['USER_LOGIN']) && $_SESSION['USER_LOGIN']=='yes'){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
?>

    <section class="htc__contact__area all_bg ptb_login">
        
  <div class="container py-5 h-100">
    <div class="row login__center justify-content-md-center h-100">
    <div class="col-lg-3 col-md-12  d-flex justify-content-center d-md-inline-flex">. </div>
      <div class="col col-lg-6 mb-4 mb-lg-0 login_box">
        <div class="card mb-3" style="border-radius: .5rem;">
          <div class="row g-0">
            <div class="col-md-4 gradient-custom text-center text-white">
            <span class="side_login"><h2>Login</h2></span>
            <div class="side_info">Get access to your Orders, Wishlist and Recommendations</div>
            <div style="width:100px;">
            </div>

              <img class="side_img" src="images/bg/login_flip.png">
             
            </div>
            <div class="col-md-8">
              <div class="card-body p-4">
              <h2 class="title__line-login ">Login</h2>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                  <div class="col-md-12 col-lg-12 col-sm-6 col-xs-12 mb-3">
                  <form id="login-form" method="post">
                  <div class="contact-box name">
											<input class="input_icon" type="text" name="login_email" id="login_email" placeholder="&#xf0e0;      Your Email*" style="width:100%">
										</div>
                    <span class="field_error" id="login_email_error"></span>
                  </div>
                  <div class="col-md-12 col-lg-12 col-sm-6 col-xs-12 mb-3">
                  <div class="contact-box name">
											<input class="input_icon" type="password" name="login_password" id="login_password" placeholder="&#xf023;      Your Password*" style="width:100%">
										</div>
										<span class="field_error" id="login_password_error"></span>
                  </div>
                </div>
                <div class="contact-btn">
										<button type="button" class="btn_blue" onclick="user_login()">Login</button>
                    
										<div>
             
                <div class="d-flex justify-content-start padd_pass">
                <div class="row">
                  <div class="col-md-6 col-lg-5 col-sm-6 col-xs-12 mb-3">
										<span ><a href="forgot_password.php"style="color:blue;font-size:12px;" class="forgot_password">Forgot Password?</a></span> 
                    </div>
                    <div class="col-md-6 col-lg-7 col-sm-6 col-xs-12 mb-3">               
                    <span style="color:black">Create an Account:<a href="register.php" style="color:blue;font-size:12px;">Sign Up</a></span>
</div>

</div>
</form>
<div class="form-output login_msg">
									<p class="form-messege field_error"></p>
								</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
        <?php require('footer.php')?>        