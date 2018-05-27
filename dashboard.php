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
            padding-top: 50px;
        }
        .sticky {
            padding-top: 20px;
        }

    </style>
</head>
<body>
    <div class="ui container">
        <h1 class="ui center aligned dividing huge header">Dashboard</h1>
        <div class="ui top aligned center aligned grid">
            <div class="four wide column">
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
                        <a class="item" data-tab="food">
                            Food market
                        </a>
                        <a class="item" data-tab="ingredient">
                            Ingredients market
                        </a>
                    </div>
                </div>
            </div>
            <div class="twelve wide column" id="context1">
                <div class="ui grid" >
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
<!--                                    buat passing ke parameter cooking.php pke GET aja, mungkin bisa pke modal juga-->
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
                    <div class="ui attached tab segment" data-tab="food">
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
                    <div class="ui attached tab segment" data-tab="ingredient">
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