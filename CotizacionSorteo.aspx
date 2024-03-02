<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CotizacionSorteo.aspx.cs" Inherits="BackRSS.CotizacionSorteo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Basic -->
		<meta charset="UTF-8">

		<title>RSS - Cotizaciones</title>
		<meta name="keywords" content="RSS" />
		<meta name="description" content="Cotizaciones RSS">
		<meta name="author" content="rsssacv.com">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
        <link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
		<link rel="stylesheet" href="assets/vendor/morris/morris.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css" />

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
</head>
<%--<head>
</head>--%>
	<body>
		<section class="body">
            <form id="Form1" runat="server">
			<!-- start: header -->
			<header class="header">
				<div class="logo-container">
					<a href="/Reportes.aspx" class="logo">
						<img src="assets/images/LogoCabecera.png" height="35" alt="RSS Administration" />
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div>
			
				<!-- start: search & user box -->
				<div class="header-right">
		
			
					<span class="separator"></span>
			
					<div id="userbox" class="userbox">
						<a href="#" data-toggle="dropdown">
							<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@JSOFT.com">
                                <asp:Label CssClass ="name" ID="Label1" runat="server" Text="fdsfds"></asp:Label>
                                <asp:Label CssClass ="role" ID="Label2" runat="server" Text="sfdfds"></asp:Label>
							</div>
			
							<i class="fa custom-caret"></i>
						</a>
			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
                                    <asp:LinkButton  onClick="cerrarSesion_Click" role="menuitem" tabindex="-1" ID="cerrarSesion" runat="server"><i class="fa fa-power-off"></i> Cerrar Sesión</asp:LinkButton>
                                    <%--<asp:HyperLink role="menuitem" tabindex="-1" ID="HyperLink1" runat="server"><i class="fa fa-power-off"></i> Cerrar Sesión</asp:HyperLink>--%>
									<%--<a role="menuitem" tabindex="-1" href="pages-signin.html"><i class="fa fa-power-off"></i> Desconectarse</a>--%>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- end: search & user box -->
			</header>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<aside id="sidebar-left" class="sidebar-left">
				
					<div class="sidebar-header">
						<div class="sidebar-title">
							Navegación
						</div>
						<div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
							<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
						</div>
					</div>
				
					<div class="nano">
						<div class="nano-content">
							<nav id="menu" class="nav-main" role="navigation">
								<ul class="nav nav-main">
									<li>
										<a href="/Reportes.aspx">
											<i class="fa fa-file-text-o" aria-hidden="true"></i>
											<span>Reportes</span>
										</a>
									</li>
									<li>
										<a href="/SolicitudSorteo.aspx">
											<i class="fa fa-cogs" aria-hidden="true"></i>
											<span>Solicitud de Sorteos</span>
										</a>
									</li>
                                    <li>
										<a href="/Defectos.aspx">
											<i class="fa fa-picture-o" aria-hidden="true"></i>
											<span>Defectos</span>
										</a>
									</li>
                                    <li>
										<a href="/PagosPendientes.aspx">
											<i class="fa fa-money" aria-hidden="true"></i>
											<span>Pagos Pendientes</span>
										</a>
									</li>
                                    <li class="nav-active">
										<a href="/CotizacionSorteo.aspx">
											<i class="fa fa-laptop" aria-hidden="true"></i>
											<span>Cotizacion de Sorteos</span>
										</a>
									</li>
                                    </ul>
                                </nav>
									
							<hr class="separator" />
				
							
						</div>
				
					</div>
				
				</aside>
				<!-- end: sidebar -->

            <!-- start: page -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Cotizacion de Sorteos</h2>
					</header>
                    
					<!-- start: page -->
						<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
										</div>
						
										<h2 class="panel-title">¡Cotiza tu sorteo con nosotros!</h2>
									</header>
									<div class="panel-body">
						
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Numero de Parte</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtNumParteCotizacion" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Ingrese el numero de parte a cotizar.</span>
												</div>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Descripcion</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtDescCotizacion" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Ingrese una breve descripcion del numero de parte a cotizar.</span>
												</div>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Cantidad</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtCantCotizacion" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Ingrese la cantidad de piezas o material a cotizar.</span>
												</div>
                                                <%--boton class="mb-xs mt-xs mr-xs btn btn-primary"--%>
											</div>
                                            <div class="col-md-6 center">
                                                <asp:Button ID="btnCotizar" runat="server" Text="Cotizar" CssClass="btn btn-primary" OnClick="btnCotizar_Click" />
                                                
                                            </div>
                                            <div class="col-md-6 left">
                                                <asp:Button ID="btnLimpiarCotizacion" runat="server" Text="Limpiar" CssClass="btn btn-primary" />
                                            </div>
						
									</div>
								</section>
						
							</div>
						</div>
						
					<!-- end: page -->
                 
				</section>
                </div>
                </form>
		</section>

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
		<script src="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

	</body>
</html>