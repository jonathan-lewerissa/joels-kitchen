<?php
    session_start();
    include("include/_conn.php"); // buat ngambil variable $conn
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
                <div class="right menu">
                    <div class="ui simple dropdown item">
                        <i class="user icon"></i>
                        <div class="menu">
                            <a class="item">Update user info</a>
                            <a class="item">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui top aligned center aligned grid">
            <div class="three wide column">
                <div class="ui sticky">
                    <div class="ui vertical fluid attached tabular menu" id="side-menu">
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
                    </div>
                </div>
            </div>
            <div class="thirteen wide column">
                <div class="ui grid" id="context1">
                    <div class="ui attached tab segment active" data-tab="kitchen">
                        <div class="ui divided items">
                            <div class="item">
                                <div class="image">
                                    <img src="images/wireframe/image.png">
                                </div>
                                <div class="content">
                                    <a class="header">Kompor Satu</a>
                                    <div class="meta">
                                        <span>Deskripsi yang dimasak</span>
                                    </div>
                                    <div class="description">
                                        <p>Ini ceritanya kompor, jadi nanti bisa lihat makanan apa aja yang lagi dimasak disini</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ui attached tab segment" data-tab="food-menu">
                        <div class="ui divided items">
                            <?php
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
                                //echo "$sq";
                                $Q = mysqli_query($conn,$sq);
                                //echo mysqli_fetch_assoc($Q);
                                echo "<p>";
                                while($q = mysqli_fetch_assoc($Q)){
                                    echo $q["namabahan"]." (".$q["ukuran_bahan"].") <br>";
                                }
                                echo "</p>";
                                echo "</div>";
                                echo "<form action = 'cooking.php' method='get'>";
                                echo "<input type='hidden' name='id' value=".$val["id_masakan"].">";
                                echo "<button class='ui right floated button' type ='submit'>Cook this!</button>";
                                echo "</form>";
                                echo "</div>";
                                echo "</div>";
                            }
                            ?>

                        </div>
                        <div class="ui divided items">
                            <div class="item">
                                <div class="image">
                                    <img src="images/wireframe/image.png">
                                </div>
                                <div class="content">
                                    <a class="header">Nama makanan</a>
                                    <div class="meta">
                                        <span>Harga jual makanan sekarang</span>
                                    </div>
                                    <div class="description">
                                        <p>Deskripsi bahan-bahannya</p>
                                    </div>
                                    <button class="ui right floated button" action="cooking.php">Cook this!</button>
                                    <!-- buat passing ke parameter cooking.php pke GET aja, mungkin bisa pke modal juga-->
                                </div>
                            </div>
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