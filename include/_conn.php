<?php
$database_host = 'localhost';
$database_name = 'vkvxweok_mbd_05111640000092';
$database_user = 'vkvxweok_mbd2018';
$database_pass = 'informatika2018';

$mysqli = mysqli_connect($database_host, $database_user, $database_pass, $database_name);
if (mysqli_connect_errno($mysqli)) {
    echo "Failed to connect to MySQL: ".mysqli_connect_error();
}

?>