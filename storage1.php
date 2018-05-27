<?php
session_start();
$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
$sql = "call sp_show_masakan()";
$N=mysqli_query($conn,$sql);
?>