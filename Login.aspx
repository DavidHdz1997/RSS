<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BackRSS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!-- Basic -->
		<meta charset="UTF-8"/>

		<title>Iniciar Sesion</title>
        <meta name="keywords" content="RSS" />
        <meta name="description" content="Sistema de administracion RSS - V 1.0" />
        <meta name="author" content="rsssacv.com" />

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css"/>

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css"/>

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
</head>
<body>
    <!-- start: page -->
		<section class="body-sign">
			<div class="center-sign">
				<a class="logo pull-left">
					<img src="assets/images/LogoLogin.png" height="54"  />
				</a>

				<div class="panel panel-sign">
					<div class="panel-title-sign mt-xl text-right">
						<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i> Iniciar Sesion</h2>
					</div>
					<div class="panel-body">
						<form id="Form1" runat="server">
							<div class="form-group mb-lg">
								<label>Usuario</label>
								<div class="input-group input-group-icon">
                                    <asp:TextBox ID="usuarioLogin" runat="server" CssClass="form-control input-lg"></asp:TextBox>
									<%--<input name="username" type="text" class="form-control input-lg" />--%>
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-user"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="form-group mb-lg">
								<div class="clearfix">
									<label class="pull-left">Contraseña</label>
								</div>
								<div class="input-group input-group-icon">
									<asp:TextBox ID="txtPassword" runat="server" CssClass="form-control input-lg" TextMode="Password"></asp:TextBox>
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-lock"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 text-center">
                                    <asp:Button ID="logIn" CssClass="mb-xs mt-xs mr-xs btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="logIn_Click" />
								</div>
							</div>
						</form>
					</div>
				</div>

				<p class="text-center text-muted mt-md mb-md">&copy; Copyright 2019. Representative & Sorting Service S.A. de C.V.</p>
			</div>
		</section>
		<!-- end: page -->

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

	</body>
</html>
