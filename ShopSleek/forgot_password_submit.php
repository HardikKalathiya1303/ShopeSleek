<?php
require('connection.inc.php');
require('functions.inc.php');

$mobile=get_safe_value($con,$_POST['mobile']);
$password=md5(get_safe_value($con,$_POST['password']));
mysqli_query($con,"update users set password='$password' where mobile='$mobile'");
echo "pass_update";
?>