<?php
	$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	$sql = "call sp_show_storage_food(".$_SESSION["idplayer"].")";
	$N=mysqli_query($conn,$sql);

	while($val=mysqli_fetch_assoc($N)){
		if($val["jumlah"]==0)continue;
		$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
		$sql = "call sp_show_nama_masakan(".$val["idmasakan"].")";
		$n=mysqli_query($conn,$sql);
		$v=mysqli_fetch_assoc($n);
		//echo $sql;
		echo"<div class='item'>";
	    echo    "<div class='image'>";
	    echo        "<img src='images/wireframe/image.png'>";
	    echo     "</div>";
	    echo     "<div class='content'>";
	    echo        "<a class='header'>".$v["nama_masakan"]."</a>";
	    echo        "<div class='meta'>";
	    echo            "<span>".$v["harga_masakan"]."</span>";
	    echo        "</div>";
	    echo        "<div class='description'>";
	    echo            "<p>Lama pembuatan : ".$v["lama_pembuatan"]." detik.</p>";
	    $sq = "call sp_show_stok_masakan(".$_SESSION["idplayer"].", ".$v["id_masakan"].")";
	    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	    $Q = mysqli_query($conn,$sq);
	    $q = mysqli_fetch_assoc($Q);
	    echo            "<p>Stok : ".$q["jumlah"]."</p>";
	    $sq = "call sp_list_bahan(".$v["id_masakan"].")";
	    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
	    $Q = mysqli_query($conn,$sq);
	    echo "<p>Bahan :<br>";
	    while($q = mysqli_fetch_assoc($Q)){
	        echo $q["namabahan"]." (".$q["ukuran_bahan"].") <br>";
	    }
	    echo "</p>";
	    echo        "</div>";
	    echo        "<form action='sellfood.php' method='get'>";
	    echo "<input type='hidden' name='id_masakan' value=".$val["idmasakan"].">";
	    echo            "<button type='submit' class='ui button'>";
	    echo                "Sell";
	    echo            "</button>";
	    echo        "</form>";
	    echo    "</div>";
	    echo"</div>";
	}
?>