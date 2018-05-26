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
				<form class="ui form">
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
						<div class="ui fluid large submit button">Login</div>
					</div>
				</form>
			</div>
			<div class="ui bottom attached tab segment" data-tab="signup">
				<form class="ui form">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui left icon input">
								<i class="user icon"></i>
								<input type="text" name="username" placeholder="Username">
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
						<div class="ui fluid large submit button">Signup</div>
					</div>
				</form>
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