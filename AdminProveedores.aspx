<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProveedores.aspx.cs" Inherits="BackRSS.AdminProveedores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Basic -->
		<meta charset="UTF-8">

		<title>Administracion RSS - Proveedores</title>
        <meta name="keywords" content="RSS" />
        <meta name="description" content="Proveedores RSS">
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
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

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
							<div class="profile-info">
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
									<li class="nav-active">
										<a href="/AdminProveedores.aspx">
											<i class="fa fa-truck" aria-hidden="true"></i>
											<span>Proveedores</span>
										</a>
									</li>
                                    
                                    <li>
										<a href="/AdminReportes.aspx">
											<i class="fa fa-file-text-o" aria-hidden="true"></i>
											<span>Reportes</span>
										</a>
									</li>
									<li>
										<a href="/AdminSolicitudesSorteo.aspx">
											<i class="fa fa-cogs" aria-hidden="true"></i>
											<span>Solicitud de Sorteos</span>
										</a>
									</li>
                                    <li>
										<a href="/AdminDefectos.aspx">
											<i class="fa fa-picture-o" aria-hidden="true"></i>
											<span>Defectos</span>
										</a>
									</li>
                                    <li>
										<a href="/AdminPagos.aspx">
											<i class="fa fa-money" aria-hidden="true"></i>
											<span>Pagos</span>
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
						<h2>Proveedores</h2>
					</header>
					<!-- start: page -->
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
										</div>
						
										<h2 class="panel-title">Administra los proveedores</h2>
									</header>
									<div class="panel-body">

                                            <div class="form-group">
												<label class="col-md-3 control-label">Proveedores</label>
												<div class="col-md-6">
                                                    <asp:DropDownList ID="cmbProveedores" data-plugin-selectTwo CssClass="form-control populate" runat="server">
                                                    </asp:DropDownList>
                                                    <span class="help-block">Seleccione un proveedor para visualizar los datos.</span>
												</div>
                                                <div class="col-md-3">
                                                    <asp:Button ID="btnBuscarProveedor" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarProveedor_Click" />
                                                </div>
											</div>
						
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Nombre del Proveedor</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtNombreProveedor" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Ingrese el nombre del proveedor en mayúsculas.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfNombreProv" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtNombreProveedor"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Nombre de la Cuenta</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtNombreCuenta" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Capture el nombre de la cuenta del proveedor. Con esta cuenta el proveedor ingresara a la pagina.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfNombreCu" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtNombreCuenta"></asp:RequiredFieldValidator>
											</div>

                                        <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Contraseña de la Cuenta</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Capture la contraseña de la cuenta del proveedor.</span>
												</div>
                                            <asp:RequiredFieldValidator ID="rfPwd" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="rfPwdM" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Nombre del Contacto</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtContactoProveedor" runat="server" CssClass="form-control" ></asp:TextBox>
													<span class="help-block">Capture el contacto principal de este proveedor.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfContacto" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtContactoProveedor"></asp:RequiredFieldValidator>
											    <asp:RequiredFieldValidator ID="rfContactoM" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtContactoProveedor"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Direccion</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Capture calle, numero y colonia en ese orden.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfDireccion" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtDireccion"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfDireccionM" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtDireccion"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Ciudad</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Capture la ciudad.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfCiudad" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtCiudad"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfCiudadM" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtCiudad"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Estado</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Capture el estado.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfEstado" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtEstado"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfEstadoM" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtEstado"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Pais</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtPais" runat="server" CssClass="form-control"></asp:TextBox>
													<span class="help-block">Capture el pais.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfPais" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtPais"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfPais2" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtPais"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Telefono del Contacto</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtTelefonoProveedor" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
													<span class="help-block">Capture el numero de este proveedor.</span>
												</div>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Correo del Contacto</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtCorreoProveedor" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
													<span class="help-block">Capture el correo de este proveedor.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="rfCorreo" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtCorreoProveedor"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfCorreoM" runat="server" ErrorMessage="No puede dejar este campo vacio" ValidationGroup="VG2" ControlToValidate="txtCorreoProveedor"></asp:RequiredFieldValidator>
											</div>

                                        <div class="col-md-12">
                                            <div class="col-md-4 ">
                                                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnNuevo_Click" formnovalidate/>
                                            </div>

                                            <div class="col-md-4">
                                                <asp:Button ID="btnModificarProveedor" runat="server" Text="Modificar" CssClass="btn btn-primary" ValidationGroup ="VG2" OnClick="btnModificarProveedor_Click" OnClientClick="if (Page_ClientValidate('VG2') == false) { if (Page_Validators != null) { for (i = 0; i < Page_Validators.length; i++) { Page_Validators[i].className =  'required';  } } } else { if(confirm('¿Estas seguro de modificar este proveedor?')){ this.value='Modificando...'; this.disabled = true; } else { return false; }}" UseSubmitBehavior="false"/>
                                            </div>

                                            <div class="col-md-4">
                                                <asp:Button ID="btnGuardarProveedor" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarProveedor_Click" ValidationGroup ="VG1" OnClientClick=" if (Page_ClientValidate('VG1') == false) { if (Page_Validators != null) { for (i = 0; i < Page_Validators.length; i++) { Page_Validators[i].className =  'required';  } } } else { if(confirm('¿Estas seguro de agregar este proveedor?')){ this.value='Subiendo...'; this.disabled = true; } else { return false; }}" UseSubmitBehavior="false"/>
                                            </div>
                                        </div>


									</div>
								</section>
                    </section>
                </div>
					<!-- end: page -->
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

        <!-- Examples -->
		<script src="assets/javascripts/forms/examples.validation.js"></script>


	</body>
</html>