<?php
$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
$sql = "call sp_show_masakan()";
$N=mysqli_query($conn,$sql);
//echo "$sql";
while($val = mysqli_fetch_assoc($N)){
    echo "<div class='item'>";
    echo "<div class='image'>";
    echo "<img src='images/wireframe/image.png'>";
    echo "</div>";
    echo "<div class='content'>";
    echo "<a class='header'>".$val["nama_masakan"]."</a>";
    echo "<div class='meta'>";
    echo "<span>".$val["harga_masakan"]."</span>";
    echo "</div>";
    echo "<div class='description'>";
    $sq = "call sp_list_bahan(".$val["id_masakan"].")";
    echo "$sq";
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    $Q = mysqli_query($conn,$sq);
    //echo mysqli_fetch_assoc($Q);
    echo "<p>";
    while($q = mysqli_fetch_assoc($Q)){
        echo $q["namabahan"]." (".$q["ukuran_bahan"].") <br>";
    }
    echo "</p>";
    echo "</div>";
    $sq = "call sp_bisa_masak(".$_SESSION["idplayer"].", ".$val["id_masakan"].")";
    //echo "$sq";
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    $Q = mysqli_query($conn,$sq);
    $q = mysqli_fetch_assoc($Q);
    if(!isset($q["error"])){
        echo "<form action = 'cooking.php' method='get'>";
        echo "<input type='hidden' name='id' value=".$val["id_masakan"].">";
        echo "<button class='ui right floated button' type ='submit'>Cook this!</button>";
        echo "</form>";
    }
    else echo "Bahan kurang / dapur sudah penuh.";
    echo "</div>";
    echo "</div>";
}
?>