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
        .container > h1{
            font-size: 3em;
            text-align: center;
            font-weight: normal;
        }
    </style>
</head>
<body>
    <div class="ui container">
        <h1>Dashboard</h1>
        <div class="ui top aligned center aligned grid">
            <div class="four wide column">
                <div class="ui vertical fluid attached tabular menu">
                    <a class="item active" data-tab="kitchen">
                        Kitchen
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
            <div class="twelve wide column">
                <div class="ui grid">
                    <div class="ui attached tab segment active" data-tab="kitchen">
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
                    <div class="ui attached tab segment" data-tab="storage">
                        Storage
                    </div>
                    <div class="ui attached tab segment" data-tab="food">
                        Foods
                    </div>
                    <div class="ui attached tab segment" data-tab="ingredient">
                        Ingredients
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
        });
    </script>
</body>
</html>