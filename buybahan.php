<?php
	session_start();
	$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	$sql = "call sp_beli_bahan(".$_POST["id_bahan"].", ".$_POST["id_penjual"].", ".$_SESSION["idplayer"].")";
	echo $sql;
	$N=mysqli_query($conn,$sql);
	//header("Location:dashboard.php");
?>