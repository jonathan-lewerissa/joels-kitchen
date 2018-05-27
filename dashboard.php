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
                        <?= ', '.$_SESSION['money'].' coins'?>
                        <div class="menu">
                            <a class="item">Update user info</a>
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
                                <form action="entahkemana.php">
                                    <button class="ui button">
                                        Sell
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="ui horizontal divider">
                        Ingredients
                    </div>
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
                                <form action="entahkemana.php">
                                    <button class="ui button">
                                        Sell
                                    </button>
                                </form>
                            </div>
                        </div>
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
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui attached tab segment" data-tab="ingredient-market">
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
                            </div>
                        </div>
                        <div class="item">
                            <div class="image">
                                <img src="images/wireframe/image.png">
                            </div>
                            <div class="content">
                                <a class="header">Dua</a>
                                <div class="meta">
                                    <span>Ini meta / harga</span>
                                </div>
                                <div class="description">
                                    <p>Ini deskripsi</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="image">
                                <img src="images/wireframe/image.png">
                            </div>
                            <div class="content">
                                <a class="header">Tiga</a>
                                <div class="meta">
                                    <span>Ini meta / harga</span>
                                </div>
                                <div class="description">
                                    <p>Ini deskripsi</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="image">
                                <img src="images/wireframe/image.png">
                            </div>
                            <div class="content">
                                <a class="header">Empat</a>
                                <div class="meta">
                                    <span>Ini meta / harga</span>
                                </div>
                                <div class="description">
                                    <p>Ini deskripsi</p>
                                </div>
                            </div>
                        </div>
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
    </script>
</body>
</html>
