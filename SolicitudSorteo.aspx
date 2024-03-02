<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitudSorteo.aspx.cs" Inherits="BackRSS.SolicitudSorteo" EnableEventValidation="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Basic -->
		<meta charset="UTF-8" />

		<title>RSS - Solicitudes de Sorteos</title>
		<meta name="keywords" content="RSS" />
		<meta name="description" content="Solicitudes de Sorteos RSS">
		<meta name="author" content="rsssacv.com">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css" />

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
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css"/>

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
									<li class="nav-active">
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
                                    <%--<li >
										<a href="/CotizacionSorteo.aspx">
											<i class="fa fa-laptop" aria-hidden="true"></i>
											<span>Cotizacion de Sorteos</span>
										</a>
									</li>--%>
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
						<h2>Solicitud de Sorteos</h2>
					
						
					</header>

					<!-- start: page -->
						 
					<!-- start: page -->
						<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
										</div>
						
										<h2 class="panel-title">Llene los siguientes datos para solicitar un sorteo</h2>
									</header>
									<div class="panel-body">
						
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Numero de Parte</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtNumParteSolicitud" runat="server" CssClass="form-control" CausesValidation="True" ValidationGroup="VG4"></asp:TextBox>
													<span class="help-block">Ingrese el numero de parte.</span>
												</div>
                                                 <asp:RequiredFieldValidator ID="rfNombreBS" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG4" ControlToValidate="txtNumParteSolicitud"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Descripcion</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtDescSolicitud" runat="server" CssClass="form-control" CausesValidation="True" ValidationGroup="VG4"></asp:TextBox>
													<span class="help-block">Ingrese una breve descripcion del numero de parte.</span>
												</div>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG4" ControlToValidate="txtDescSolicitud"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Cantidad</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtCantSolicitud" runat="server" CssClass="form-control" CausesValidation="True" ValidationGroup="VG4" TextMode="Number"></asp:TextBox>
                                                     
													<span class="help-block">Ingrese la cantidad de piezas o material a sortear.</span>
												</div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG4" ControlToValidate="txtCantSolicitud"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Razon de Sorteo</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtRazonSolicitud" runat="server" CssClass="form-control form-bordered" CausesValidation="True" ValidationGroup="VG4"></asp:TextBox>
                                                    
													<span class="help-block">Ingrese el motivo por el cual se realizara el sorteo.</span>
												</div>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG4" ControlToValidate="txtRazonSolicitud"></asp:RequiredFieldValidator>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label">Defectos</label>
												<div class="col-md-6">
													<div class="fileupload fileupload-new" data-provides="fileupload">
														<div class="input-append">
                                                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="fileInfo()" style="display: none;" />
                                                            <asp:TextBox ID="fuDefectosSolicitud" runat="server" CssClass="uneditable-input" ReadOnly="True"></asp:TextBox>
                                                            <asp:LinkButton ID="btnDefectosSolicitud" CssClass="btn btn-primary" runat="server">Seleccionar</asp:LinkButton>
														</div>
													</div>
                                                    <span class="help-block">Suba una foto del defecto encontrado.</span>
												</div>
											</div>

                                            <div class="form-group">
												<label class="col-md-3 control-label">Fecha de Inicio</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
                                                         <asp:TextBox ID="dtpInicioSorteo" runat="server" CssClass="form-control" CausesValidation="True" ValidationGroup="VG4" ></asp:TextBox>
													</div>
                                                    <span class="help-block">Indiquenos en que fecha se debe de comenzar este sorteo.</span>
												</div>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de fecha no valido" CssClass="required" Display="Dynamic" ControlToValidate="dtpInicioSorteo" ValidationExpression="^([0]?[0-9]|[12][0-9]|[3][01])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4})$" ValidationGroup="VG4"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG4" ControlToValidate="dtpInicioSorteo"></asp:RequiredFieldValidator>
											</div>

                                            <div class="col-md-6 center">
                                                <%--<asp:Button ID="btnSolicitar" runat="server" Text="Solicitar" CssClass="btn btn-primary" OnClick="btnSolicitar_Click" CausesValidation="true" ValidationGroup="VG4" OnClientClick="if(Page_ClientValidate('VG4')){ this.value='Subiendo...'; this.disabled = true; }" UseSubmitBehavior="false" />--%>
                                                <asp:Button ID="btnSolicitar" runat="server" Text="Solicitar" CssClass="btn btn-primary" OnClick="btnSolicitar_Click" CausesValidation="true" ValidationGroup="VG4" OnClientClick="if (Page_ClientValidate('VG4') == false) { if (Page_Validators != null) { for (i = 0; i < Page_Validators.length; i++) { Page_Validators[i].className =  'required';  } } } else { if(confirm('¿Estas seguro de solicitar este sorteo?')){ this.value='Subiendo...'; this.disabled = true; } else { return false; }}" UseSubmitBehavior="false" />
                                                
                                            </div>
                                            <div class="col-md-6 left">
                                                <asp:Button ID="btnLimpiarSolicitud" runat="server" Text="Limpiar" CssClass="btn btn-primary" OnClick="btnLimpiarSolicitud_Click" formnovalidate/>
                                            </div>
						
									</div>
								</section>

                         <section class="panel">
							    <header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>
						
								<h2 class="panel-title">Solicitudes</h2>
							</header>
							<div class="panel-body">

                            <div class="table-responsive">
                                    <asp:GridView runat="server" ID="gdImage" AutoGenerateColumns="false" PageSize = "6" AllowPaging ="true" OnPageIndexChanging = "OnPaging" CssClass="table table-bordered table-striped table-condensed mb-none" EmptyDataText = "No hay solicitudes de este proveedor aun">
                                    <Columns>
                                        <asp:BoundField DataField="idSolicitud" HeaderText="ID" />
                                        <asp:BoundField DataField="nombreProveedor" HeaderText="Proveedor" />
                                        <asp:BoundField DataField="numeroParte" HeaderText="Numero de Parte" />
                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                                        <asp:BoundField DataField="cantidadPiezas" HeaderText="Cantidad de Piezas" />
                                        <asp:BoundField DataField="razonSorteo" HeaderText="Razon de Sorteo" />
                                        <asp:ImageField DataImageUrlField="imagenDefecto" HeaderText="Defecto" ControlStyle-Width="90px"></asp:ImageField>
                                        <asp:BoundField DataField="fechaInicio" HeaderText="Inicio de Sorteo" />
                                        <asp:BoundField DataField="fechaSolicitud" HeaderText="Fecha de Solicitud" />
                                    </Columns>
                                </asp:GridView>
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
        <script src="assets/vendor/jquery-validation/jquery.validate.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

        <!-- Examples -->
		<script src="assets/javascripts/forms/examples.validation.js"></script>

        <%-- Obtiene el nombre del file y lo pone en el campo --%>
        <script>
            function fileInfo() {
                document.getElementById('<%=fuDefectosSolicitud.ClientID%>').value = document.getElementById('<%=FileUpload1.ClientID%>').files[0].name;
            }
        </script>

	</body>
</html>