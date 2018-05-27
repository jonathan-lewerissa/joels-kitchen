<?php
/**
 * Created by PhpStorm.
 * User: Jonathan
 * Date: 27/05/2018
 * Time: 22:59
 */

$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
$sql = "call sp_edit_password(".$_SESSION['username'].",".$_POST['newpassword'].",".$_POST['oldpassword'].")";
$res = mysqli_query($conn,$sql);
header("Location: ../dashboard.php");

?>