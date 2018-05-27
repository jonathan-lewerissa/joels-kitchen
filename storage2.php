<?php
	$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	$sql = "call sp_show_storage_bahan(".$_SESSION["idplayer"].")";
	$N=mysqli_query($conn,$sql);

	while($val=mysqli_fetch_assoc($N)){
		if($val["jumlah"]==0) continue;
		$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
		$sql = "call sp_show_detil_bahan(".$val["idbahan"].")";
		$n=mysqli_query($conn,$sql);
		$v=mysqli_fetch_assoc($n);
		//echo $sql;
		echo"<div class='item'>";
	    echo    "<div class='image'>";
	    echo        "<img src='images/wireframe/image.png'>";
	    echo     "</div>";
	    echo     "<div class='content'>";
	    echo        "<a class='header'>".$v["namabahan"]."</a>";
	    echo        "<div class='meta'>";
	    echo            "<span>".$v["harga_jual"]."</span>";
	    echo        "</div>";
	    echo        "<div class='description'>";
	    $sq = "call sp_show_stok_bahan(".$_SESSION["idplayer"].", ".$val["idbahan"].")";
	    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	    $Q = mysqli_query($conn,$sq);
	    $q = mysqli_fetch_assoc($Q);
	    echo            "<p>Stok : ".$q["jumlah"]."</p>";
	    echo        "</div>";
	    echo        "<form action='sellbahan.php' method='get'>";
	    echo "<input type='hidden' name='id_bahan' value=".$val["idbahan"].">";
	    echo            "<button type='submit' class='ui button'>";
	    echo                "Sell";
	    echo            "</button>";
	    echo        "</form>";
	    echo    "</div>";
	    echo"</div>";
	}
?>