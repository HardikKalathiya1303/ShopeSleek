<?php 
require('top.php');
?>
<style>
    .modal-confirm .icon-box{
background:#e02d2d;
    }
    .modal-confirm .btn{
        background:#e02d2d;
    }
    .modal-confirm .btn:hover, .modal-confirm .btn:focus {
    background: #e02d2d;
    outline: none;
}
    .modal-confirm .icon-box i {
    font-size: 58px;
    position: relative;
    top: 2px;
    right: 0px;
    font-family: fontawesome;
    }
    </style>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div id="myModal" >
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons fa fa-times"></i>
				</div>				
				<h4 class="modal-title"></h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">payment Fail.</p>
			</div>
			<div class="modal-footer">
				<a href='index.php' class="btn btn-success btn-block" data-dismiss="modal">OK</a>
			</div>
		</div>
	</div>
</div> 
        						
<?php require('footer.php')?>        