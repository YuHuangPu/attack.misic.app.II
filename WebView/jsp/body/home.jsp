<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
</head>
<style type="text/css">
html, body {
	font-family: Consolas, Microsoft JhengHei;
}

.loginDiv {
	background-image: url(img/userImg/favicon.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.loginDiv .opacity {
	opacity: 0.1;
	transition: opacity 1s;
	-webkit-transition: opacity 1s;
	-moz-transition: opacity 1s;
	-o-transition: opacity 1s;
}

.loginDiv .opacity:hover {
	opacity: 1;
}
</style>
<body class="app flex-row align-items-center">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card-group">
					<div class="card p-4 loginDiv">
						<div class="card-body opacity">
							<form action="login.action" method="post">
								<div class="row">
									<h2 class="col align-self-start">Login</h2>
									<div class="col text-white float-right align-self-end">
									<p class="float-right">${version}</p>
									</div>
								</div>

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="icon-user"></i>
										</span>
									</div>
									<input class="form-control" type="text" placeholder="Username" name="account" autofocus>
								</div>
								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="icon-lock"></i>
										</span>
									</div>
									<input class="form-control" type="password" name="password" placeholder="Password">
								</div>
								<div class="row">
									<div class="col-12">
										<button class="btn-block btn btn-pill btn-dark px-4 btn-login" type=submit>Login</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
