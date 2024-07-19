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

<section class="htc__contact__area all_bg ptb_login" id="img_pd_u">
        
        <div class="container py-5 h-100">
          <div class="row login__center justify-content-md-center h-100">
          <div class="col-lg-3 col-md-12  d-flex justify-content-center d-md-inline-flex">. </div>
            <div class="col col-lg-6 mb-4 mb-lg-0 login_box">
              <div class="card mb-3" style="border-radius: .5rem;">
                <div class="row g-0">
                  <div class="col-md-4 gradient-custom text-center text-white">
                  <span class="side_login"><h2>User Profile</h2></span>
                  <div class="side_info">Update Your Name And Password.</div>
                  <div style="width:100px;">
                  </div>
      
                    <img class="side_img" src="images/bg/login_flip.png">
                   
                  </div>
                  <div class="col-md-8">
                    <div class="card-body p-4">
                    <h2 class="title__line-login ">Profile</h2>
                      <hr class="mt-0 mb-4">
                      <div class="row pt-1">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
                        <form id="login-form" method="post">
                        <div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="name" id="name" placeholder="Your Name*" style="width:100%" value="<?php echo $_SESSION['USER_NAME']?>">
										</div>
										<span class="field_error" id="name_error"></span>
									</div>
									
									<div class="contact-btn">
										<button type="button" class="btn_blue" onclick="update_profile()" id="btn_submit">Update Name</button>
			    					</div>
</form>
                       
                        <form method="post" id="frmPassword">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
                        <div class="single-contact-form">
										
										<div class="contact-box name">
											<input type="password" placeholder="Current Password*" name="current_password" id="current_password" style="width:100%">
										</div>
										<span class="field_error" id="current_password_error"></span>
									</div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
									<div class="single-contact-form">

                                   
										<div class="contact-box name">
											<input type="password" placeholder="New Password*" name="new_password" id="new_password" style="width:100%">
										</div>
										<span class="field_error" id="new_password_error"></span>
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
                                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 mb-3">
									<div class="contact-btn">
										<button type="button" class="btn_blue" onclick="update_password()" id="btn_update_password">Update Password</button>
										
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
      <script>
		function update_profile(){
			jQuery('.field_error').html('');
			var name=jQuery('#name').val();
			if(name==''){
				jQuery('#name_error').html('Please enter your name');
			}else{
				jQuery('#btn_submit').html('Please wait...');
				jQuery('#btn_submit').attr('disabled',true);
				jQuery.ajax({
					url:'update_profile.php',
					type:'post',
					data:'name='+name,
					success:function(result){
						jQuery('#name_error').html(result);
						jQuery('#btn_submit').html('Update');
						jQuery('#btn_submit').attr('disabled',false);
					}
				})
			}
		}
		
		function update_password(){
			jQuery('.field_error').html('');
			var current_password=jQuery('#current_password').val();
			var new_password=jQuery('#new_password').val();
			var confirm_new_password=jQuery('#confirm_new_password').val();
			var is_error='';
			if(current_password==''){
				jQuery('#current_password_error').html('Please enter password');
				is_error='yes';
			}if(new_password==''){
				jQuery('#new_password_error').html('Please enter password');
				is_error='yes';
			}if(confirm_new_password==''){
				jQuery('#confirm_new_password_error').html('Please enter password');
				is_error='yes';
			}
			
			if(new_password!='' && confirm_new_password!='' && new_password!=confirm_new_password){
				jQuery('#confirm_new_password_error').html('Please enter same password');
				is_error='yes';
			}
			
			if(is_error==''){
				jQuery('#btn_update_password').html('Please wait...');
				jQuery('#btn_update_password').attr('disabled',true);
				jQuery.ajax({
					url:'update_password.php',
					type:'post',
					data:'current_password='+current_password+'&new_password='+new_password,
					success:function(result){
						jQuery('#current_password_error').html(result);
						jQuery('#btn_update_password').html('Update');
						jQuery('#btn_update_password').attr('disabled',false);
						jQuery('#frmPassword')[0].reset();
					}
				})
			}
			
		}
		</script>
<?php require('footer.php')?>
