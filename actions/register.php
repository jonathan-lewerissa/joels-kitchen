<?php
	session_start();
    $error = "ERROR";
    include_once("../include/_conn.php");
//    $conn = mysqli_connect('10.151.63.63', 'user-pweb', 'user-pweb1718', "PWEB182_A_16092") or die($error);
//    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
//    if(mysqli_connect_errno()){
//    	echo $error;
//    }
    $sql="call sp_register_player('".$_POST["username"]."','".$_POST["fullname"]."','".$_POST["email"]."','".$_POST["password"]."')";
    echo $sql;
    $N=mysqli_query($conn,$sql);
    $val = mysqli_fetch_assoc($N);
    if(isset($val["error"])){
        echo "hehe";
        $_SESSION["errorregister"]=true;
    }
    else{
    	$_SESSION["errorregister"]=false;
    }
    header("Location: ../index.php",true,301);
    exit();
?>