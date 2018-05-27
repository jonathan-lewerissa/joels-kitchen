<?php
/**
 * Created by PhpStorm.
 * User: Jonathan
 * Date: 27/05/2018
 * Time: 19:35
 */

$conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
$sql = "call sp_player_rank()";
$res = mysqli_query($conn,$sql);
while($val = mysqli_fetch_assoc($res)) {
    echo '<tr>';
    echo '<td class="single line">'.$val['username'].'</td>';
    echo '<td class="single line">'.$val['money'].' coins</td>';
    echo '</tr>';
}

?>