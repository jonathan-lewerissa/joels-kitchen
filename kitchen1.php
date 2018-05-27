<?php
$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
$sql = "call sp_show_dapur(".$_SESSION["idplayer"].")";
//echo $sql;
$N=mysqli_query($conn,$sql);
while($val = mysqli_fetch_assoc($N)){
    echo"<div class='item'>";
    echo"<div class='image'>";
    echo"<img src='images/wireframe/image.png'>";
    echo"</div>";
    echo"<div class='content'>";
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    $sq="call sp_show_nama_masakan(".$val["idmasakan"].")";
    $que = mysqli_query($conn,$sq);
    $hsl = mysqli_fetch_assoc($que);
    echo"<a class='header'>".$hsl["nama_masakan"]."</a>";
    echo "<div class='meta'>";
    $sq = "call sp_diff_second(".$val["idmasakan"].", ".$_SESSION["idplayer"].", ".$val["nomor_kompor"].")";
    //echo $sq;
    $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
    $n=mysqli_query($conn,$sq);
    $v=mysqli_fetch_assoc($n);
    if($v["diff"]==0) echo "<span>Sudah matang!</span>";
    else echo "<span>Tunggu ".$v["diff"]." lagi.</span>";
    echo"</div>";
    echo"<div class='description'>";
    echo"<p>Ini ceritanya kompor, jadi nanti bisa lihat makanan apa aja yang lagi dimasak disini</p>";
    echo"</div>";
    if($v["diff"]==0){
        echo"<form action='addstorage.php' method='get'>";
        echo"<input type='hidden' name='kompor' value='".$val["nomor_kompor"]."'>";
        echo "<button type='submit' class='ui positive button'>Tambah ke storage</button>"; 
    }
    echo"</form>";
    echo"</div>";
    echo"</div>";
}
?>