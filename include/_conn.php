<?php
/*$database_host = 'localhost';
$database_name = 'vkvxweok_mbd_05111640000092';
$database_user = 'vkvxweok_mbd2018';
$database_pass = 'informatika2018';*/
$database_host = 'localhost';
$database_name = 'vkvxweok_mbd_05111640000092';
$database_user = 'root';
$database_pass = '';

$conn = mysqli_connect($database_host, $database_user, $database_pass, $database_name);
if (mysqli_connect_errno($conn)) {
    echo "Failed to connect to MySQL: ".mysqli_connect_error();
}

?>