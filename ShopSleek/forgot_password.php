<?php 
require('top.php');
if(isset($_SESSION['USER_LOGIN']) && $_SESSION['USER_LOGIN']=='yes'){
	?>
	<script>
	window.location.href='my_order.php';
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
            <span class="side_login"><h2>Forgot Password</h2></span>
            <div class="side_info">Reset Password</div>
            <div style="width:100px;">
            </div>

              <img class="side_img" src="images/bg/login_flip.png">
             
            </div>
            <div class="col-md-8">
              <div class="card-body p-4">
              <h2 class="title__line-login ">Forgot Password</h2>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                  <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
                  <form id="login-form" method="post">
                  <div class="contact-box name">
				  <input type="text" name="mobile" id="mobile" placeholder="Your Mobile*"  maxlength="12" style="width:100%;padding-right: 2px;margin-right:2px;">
											
											<button type="button" class="fv-btn mobile_sent_otp otp_s_btn" onclick="mobile_sent_otp_f()">Send OTP</button>
											
											<input type="text" id="mobile_otp" placeholder="OTP" maxlength="4" style="width:18%;padding:2px 2px;margin:0 6px;" class="mobile_verify_otp">
											
											
											<button type="button" class="fv-btn mobile_verify_otp otp_s_btn" onclick="mobile_verify_otp()">Verify OTP</button>
											
											<span id="mobile_otp_result"></span>
											
											
										</div>
										<span class="field_error" id="mobile_error_f"></span>
										</div>
										<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
									<div class="single-contact-form">

                                   
										<div class="contact-box name">
											<input type="password" placeholder="New Password*" name="new_password" id="password" style="width:100%">
										</div>
										<span class="field_error" id="password_error"></span>
										<span class="field_error" id="forgot_error_f"></span>
									</div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
									<div class="single-contact-form">
										
										<div class="contact-box name">
											<input type="password" placeholder="Confirm New Password*" name="confirm_new_password" id="confirm_new_password" style="width:100%">
										</div>
										<span class="field_error" id="confirm_new_password_error"></span>
									</div>
                                    </div>
										
                <div class="contact-btn">
				<button type="button" class="btn_blue" onclick="forgot_password()" disabled id="btn_forgot">Submit</button>
</div>
<span class="field_error" id="forgot_error_f"></span>
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
  <input type="hidden" id="is_mobile_verified"/>
</section>
		<script>
		
		function mobile_sent_otp_f(){
			jQuery('#mobile_error_f').html('');
			var mobile=jQuery('#mobile').val();
			if(mobile==''){
				jQuery('#mobile_error_f').html('Please enter mobile number');
			}else{
				jQuery('.mobile_sent_otp').html('Please wait..');
				jQuery('.mobile_sent_otp').attr('disabled',true);
				jQuery('.mobile_sent_otp');
				jQuery.ajax({
					url:'send_otp.php',
					type:'post',
					data:'mobile='+mobile+'&type=mobile_f',
					success:function(result){
						if(result=='done'){
							jQuery('#mobile').attr('disabled',true);
							jQuery('.mobile_verify_otp').show();
							jQuery('.mobile_sent_otp').hide();
						}else if(result=='mobile_present'){
							jQuery('.mobile_sent_otp').html('Send OTP');
							jQuery('.mobile_sent_otp').attr('disabled',false);
							jQuery('#mobile_error_f').html('Mobile number already exists');
						}else{
							jQuery('.mobile_sent_otp').html('Send OTP');
							jQuery('.mobile_sent_otp').attr('disabled',false);
							jQuery('#mobile_error_f').html('enter registred mobile number');
						}
					}
				});
			}
		}
        
		
		function mobile_verify_otp(){
			jQuery('#mobile_error_f').html('');
			var mobile_otp=jQuery('#mobile_otp').val();
			if(mobile_otp==''){
				jQuery('#mobile_error_f').html('Please enter OTP');
			}else{
				jQuery.ajax({
					url:'check_otp.php',
					type:'post',
					data:'otp='+mobile_otp+'&type=mobile',
					success:function(result){
						if(result=='done'){
							jQuery('.mobile_verify_otp').hide();
							jQuery('#mobile_otp_result').html('Mobile number verified');
							jQuery('#is_mobile_verified').val('1');
							jQuery('#btn_forgot').attr('disabled',false);
						}else{
							jQuery('#mobile_error_f').html('Please enter valid OTP');
						}
					}
					
				});
			}
		}
		document.getElementById("mobile").onkeypress = function(e){
                        var charCode=(e.which) ? e.which:e.keyCode;
                        if(charCode > 31 && (charCode < 48 || charCode > 57)){
                          return false;
                        }
                        return true;
                      };
    
		</script>
<?php require('footer.php')?>        