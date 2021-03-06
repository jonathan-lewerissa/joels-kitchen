<?php
    session_start();
    include("include/_conn.php"); // buat ngambil variable $conn
    if(!isset($_SESSION["login"])){
        header("Location: index.php");
    }
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">

    <style type="text/css">
        body {
            background-color: #DADADA;
        }
        body > .grid {
            height: 100%;
        }
        .image {
            margin-top: -100px;
        }
        .column {
            max-width: 450px;
        }
        .container > .grid {
            padding-top: 6em !important;
        }
        .sticky {
            padding-top: 20px;
        }

    </style>
</head>
<body>
    <div class="ui container">
        <div class="ui large top fixed menu">
            <div class="ui container">
                <a class="item active" data-tab="tutorial">
                    Tutorial
                </a>
                <a class="item" data-tab="kitchen" id="kitchen-tab">
                    Kitchen
                </a>
                <a class="item" data-tab="food-menu" id="food-menu-tab">
                    Food menu
                </a>
                <a class="item" data-tab="storage" id="storage-tab">
                    Storage
                </a>
                <a class="item" data-tab="food-market" id="food-market-tab">
                    Food market
                </a>
                <a class="item" data-tab="ingredient-market" id="ingredient-market-tab">
                    Ingredients market
                </a>
                <a class="item" data-tab="scoreboard" id="scoreboard-tab">
                    Scoreboard
                </a>

                <div class="right menu">
                    <div class="ui simple dropdown item">
                        <i class="user icon"></i>
                        <?=$_SESSION['username']?>
<!--                        --><?php
//                            $conn = mysqli_connect('localhost', 'root', '', "vkvxweok_mbd_05111640000092") or die($error);
//                            $sq ="call sp_show_detil_player(".$_SESSION["idplayer"].")";
//                            //echo $sq;
//                            $qu = mysqli_query($conn,$sq);
//                            $va = mysqli_fetch_assoc($qu);
//                            $_SESSION['money']=$va["money"];
//                        ?>
                        <?= ', '.$_SESSION['money'].' coins'?>
                        <div class="menu">
                            <a class="item" id="changepass">Update password</a>
                            <div class="ui modal">
                                <div class="header">
                                    Change password
                                </div>
                                <div class="ui bottom attached center aligned segment">
                                    <form action="actions/changepassword.php" method="post">
                                        <div class="ui input">
                                            <input placeholder="Old password" type="password" name="oldpassword">
                                        </div>
                                        <div class="ui input">
                                            <input placeholder="New password" type="password" name="newpassword">
                                        </div>
                                        <button class="ui positive button" type="submit"> Change password</button>
                                    </form>
                                </div>
                            </div>
                            <a class="item" href="actions/logout.php">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui top aligned center aligned grid">
            <div class="sixteen wide column">
                <div class="ui attached tab segment active" data-tab="tutorial">
                    <h3 class="ui header">
                        Dalam permainan ini, anda dapat memasak dan menjual makanan-makanan.
                        <br><br>
                        Tujuan permainan ini adalah untuk mendapatkan pemasukan sebesar-besarnya.
                    </h3>
                    <br>
                    <ul class="ui list">
                        <li>Untuk memasak makanan, pergilah menuju tab <strong>"Food menu"</strong>, kemudian lihat progress-nya di <strong>"Kitchen"</strong></li>
                        <li>Untuk membeli bahan makanan, pergilah menuju tab <strong>"Ingredients market"</strong></li>
                        <li>Untuk menjual makanan, pergilah menuju tab <strong>"Food market"</strong></li>
                        <li>Harga setiap barang dalam game ini akan berubah-ubah <strong>setiap hari</strong></li>
                    </ul>
                    <h4 class="ui header">
                        "May the best player win!"
                    </h4>
                </div>
                <div class="ui attached tab segment" data-tab="kitchen">
                    <div class="ui divided items">
                        <?php
                        include 'kitchen1.php';
                        ?>
                    </div>
                </div>
                <div class="ui attached tab segment" data-tab="food-menu">
                    <div class="ui divided items">
                        <?php
                            include 'foodmenu1.php';
                        ?>
                    </div>
                </div>
                <div class="ui attached tab segment" data-tab="storage">
                    <div class="ui horizontal divider">
                        Foods
                    </div>
                    <div class="ui divided items">
                        <?php include 'storage1.php'; ?>
                    </div>
                    <div class="ui horizontal divider">
                        Ingredients
                    </div>
                    <div class="ui divided items">
                        <?php include 'storage2.php'; ?>
                    </div>
                </div>
                <div class="ui attached tab segment" data-tab="food-market">
                    <div class="ui divided items">
                        <div class="item">
                            <div class="image">
                                <img src="images/wireframe/image.png">
                            </div>
                            <div class="content">
                                <a class="header">Satu</a>
                                <div class="meta">
                                    <span>Ini meta / harga</span>
                                </div>
                                <div class="description">
                                    <p>Ini deskripsi</p>
                                </div>
                                <div class="ui centered grid" style="display: flex; margin-top: 35px">
                                    <form action="">
                                        <button class="ui positive button">Buy</button>
                                    </form>
                                    <form action="">
                                        <button class="ui button">Sell</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui attached tab segment" data-tab="ingredient-market">
                    <div class="ui divided items">
                        <?php
                        include 'ingredientmarket.php'; 
                        ?>
                    </div>
                </div>
                <div class="ui attached tab segment" data-tab="scoreboard">
                    <table class="ui celled padded table">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Wealth</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                include 'user_rank.php';
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>  
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>
    <script>
        $('.menu .item').tab();
        $('.ui .modal').modal('attach events','#changepass','show');
    </script>
</body>
</html>
