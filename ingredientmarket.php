<?php
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    $sql ="call sp_show_market_bahan()";
    //echo $sql;
    $Q = mysqli_query($conn,$sql);
    while($val = mysqli_fetch_assoc($Q)){
        $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
        $sq ="call sp_show_detil_player(".$val["idplayer"].")";
        //echo $sq;
        $qu = mysqli_query($conn,$sq);
        $va = mysqli_fetch_assoc($qu);
        if($va["username"]==$_SESSION["username"]) continue;
        $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
        $sql ="call sp_show_detil_bahan(".$val["idbahan"].")";
        $q = mysqli_query($conn,$sql);
        $v = mysqli_fetch_assoc($q);
        echo    "<div class='item'>";
        echo        "<div class='image'>";
        echo            "<img src='images/wireframe/image.png'>";
        echo        "</div>";
        echo        "<div class='content'>";
        echo            "<a class='header'>".$v["namabahan"]."</a>";
        echo            "<div class='meta'>";
        echo                "<span>".$v["harga_jual"]."</span>";
        echo            "</div>";
        echo            "<div class='description'>";
        $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
        $sq ="call sp_show_detil_player(".$val["idplayer"].")";
        //echo $sq;
        $qu = mysqli_query($conn,$sq);
        $va = mysqli_fetch_assoc($qu);
        //echo            $va["username"];
        echo            "<p>Seller : ".$va["username"]."</p>";
        echo            "</div>";
        echo            "<div class='ui centered grid' style='display: flex; margin-top: 35px'>";
        echo                "<form action='buybahan.php' method='post'>";
        echo "<input type='hidden' name='id_bahan' value=".$val["idbahan"].">";
        echo "<input type='hidden' name='id_penjual' value=".$val["idplayer"].">";
        echo                    "<button type='submit' class='ui positive button'>Buy</button>";
        echo                "</form>";
        echo            "</div>";
        echo        "</div>";
        echo    "</div>";
    }
?>