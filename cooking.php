<?php
	session_start();
    $error = "ERROR";
    //$conn = mysqli_connect('10.151.63.63', 'user-pweb', 'user-pweb1718', "PWEB182_A_16092") or die($error);
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    if(mysqli_connect_errno()){
    	echo $error;
    }
   
?>