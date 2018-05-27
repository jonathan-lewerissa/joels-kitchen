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
                <a class="item active" data-tab="kitchen">
                    Kitchen
                </a>
                <a class="item" data-tab="food-menu">
                    Food menu
                </a>
                <a class="item" data-tab="storage">
                    Storage
                </a>
                <a class="item" data-tab="food-market">
                    Food market
                </a>
                <a class="item" data-tab="ingredient-market">
                    Ingredients market
                </a>
                <div class="right menu">
                    <div class="ui simple dropdown item">
                        <i class="user icon"></i>
                        <?=$_SESSION['username']?>
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
                <div class="ui attached tab segment active" data-tab="kitchen">
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
            </div>  
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.menu .item').tab();
            $('.ui .sticky').sticky({
                context: '#context1'
            });
        });
    </script>
</body>
</html>
