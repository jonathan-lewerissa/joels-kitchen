<?php
    session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome!</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css">

    <style type="text/css">
        body {
            background-color: #DADADA;
        }
        body > .grid {
            /*padding-top: 40px !important;*/
            height: 100%;
        }
        .image {
            margin-top: -100px;
        }
        .column {
            max-width: 450px;
        }
    </style>
</head>
<body>
    <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui image header">
                <div class="content">
                    Joel's Kitchen!
                </div>
            </h2>
            <div class="ui top attached two item pointing menu">
                <a class="active item" data-tab="login">Login</a>
                <a class="item" data-tab="signup">Signup</a>
            </div>
            <div class="ui bottom attached tab segment active" data-tab="login">
                <form action="actions/login.php" method="post" class="ui form" enctype="multipart/form-data">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" placeholder="Username">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" placeholder="Password">
                            </div>
                        </div>
                        <button type="submit" class="ui fluid large submit button">Login</button>
                    </div>
                </form>
                <?php
                    if(isset($_SESSION["canlogin"])&&$_SESSION["canlogin"]===false){
                        echo "Username/Password salah";
                        unset($_SESSION["canlogin"]);
                    }
                ?>
            </div>
            <div class="ui bottom attached tab segment" data-tab="signup">
                <form action="actions/register.php" method="post" class="ui form">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" placeholder="Username">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="fullname" placeholder="Full Name">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="envelope icon"></i>
                                <input type="email" name="email" placeholder="E-mail">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" placeholder="Password">
                            </div>
                        </div>
                        <button class="ui fluid large submit button">Signup</button>
                    </div>
                </form>
                <?php
                    if(isset($_SESSION["errorregister"])){
                        if($_SESSION["errorregister"]===true) echo "Username/Email already used.";
                        unset($_SESSION["errorregister"]);
                    }
                ?>
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