<?php
	session_start();
    $error = "ERROR";
    //$conn = mysqli_connect('10.151.63.63', 'user-pweb', 'user-pweb1718', "PWEB182_A_16092") or die($error);
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    if(mysqli_connect_errno()){
    	echo $error;
    }
    $sql ="call sp_cek_bisa_memasak(".$_SESSION["idplayer"].", ".$_GET["id"].")";
    echo $sql;
    $Q = mysqli_query($conn,$sql);
    while($val = mysqli_fetch_assoc($Q)){
        $s = "call sp_update_detil_chef_bahan(".$val["ukuran_bahan"].", ".$val["p_id_player"].", ".$val["idbahan"].")";
        $con = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
        $query = mysqli_query($con,$s);
        echo $s;
    }
    header("Location:dashboard.php");
   
?>