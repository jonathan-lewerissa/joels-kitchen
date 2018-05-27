<?php
	session_start();
	$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	$sql = "call sp_update_dapur_dan_masakan(".$_SESSION["idplayer"].", ".$_GET["kompor"].")";
	echo $sql;
	$N=mysqli_query($conn,$sql);
	header("Location:dashboard.php");
?>