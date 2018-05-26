<?php
	session_start();
    $error = "ERROR";
    //$conn = mysqli_connect('10.151.63.63', 'user-pweb', 'user-pweb1718', "PWEB182_A_16092") or die($error);
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    if(mysqli_connect_errno()){
    	echo $error;
    }
    $sql="call sp_login_player('".$_POST["username"]."','".$_POST["password"]."')";
    echo $sql;
    $N=mysqli_query($conn,$sql);
    $val = mysqli_fetch_assoc($N);
    if(isset($val["error"])){
        echo "hehe";
        $_SESSION["canlogin"]=false;
        header("Location:index.php");
        exit();
    }
    else{
    	$_SESSION["login"]=true;
    	$_SESSION["username"]=$val["username"];
    	$_SESSION["fullname"]=$val["fullname"];
    	$_SESSION["email"]=$val["EMAIL"];
    	$_SESSION["password"]=$val["PASSWORD"];
    	$_SESSION["money"]=$val["money"];
        $_SESSION["kompor_size"]=$val["kompor_size"];
    	header("Location:index.php",true,301);
    	exit();
    }
?>