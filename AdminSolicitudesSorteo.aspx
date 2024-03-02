<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSolicitudesSorteo.aspx.cs" Inherits="BackRSS.AdminSolicitudesSorteo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Basic -->
		<meta charset="UTF-8">

		<title>Administracion RSS - Solicitudes de Sorteos</title>
		<meta name="keywords" content="RSS" />
		<meta name="description" content="Solicitudes de Sorteos RSS">
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
        <form id="Form2" runat="server">
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
									<li>
										<a href="/AdminProveedores.aspx">
											<i class="fa fa-truck" aria-hidden="true"></i>
											<span>Proveedores</span>
										</a>
									</li>
                                    
                                    <li >
										<a href="/AdminReportes.aspx">
											<i class="fa fa-file-text-o" aria-hidden="true"></i>
											<span>Reportes</span>
										</a>
									</li>
									<li class="nav-active">
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
						<h2>Solicitud de Sorteos</h2>
					</header>
                 <!-- start: page -->
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>
						
								<h2 class="panel-title">Solicitudes</h2>
							</header>
							<div class="panel-body">
                                <div class="form-group">
												<label class="col-md-3 control-label">Fecha</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
                                                         <asp:TextBox ID="dtpFechaSolicitud" runat="server" data-plugin-datepicker CssClass="form-control"></asp:TextBox>
													</div>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de fecha no valido" CssClass="required" Display="Dynamic" ControlToValidate="dtpFechaSolicitud" ValidationExpression="^([0]?[0-9]|[12][0-9]|[3][01])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4})$"></asp:RegularExpressionValidator>
                                                    <span class="help-block">Selecciona una fecha para consultar las solicitudes de sorteos.</span>
												</div>
                                                    <div class="col-md-3">
                                                        <asp:Button ID="btnBuscarSolicitud" runat="server" Text="Buscar Solicitud" CssClass="btn btn-primary" OnClick="btnBuscarSolicitud_Click" />
                                                    </div>
											</div>

                            <div class="table-responsive">
                                    <asp:GridView runat="server" ID="gdImage" AutoGenerateColumns="false" PageSize = "15" AllowPaging ="true" OnPageIndexChanging = "OnPaging" CssClass="table table-bordered table-striped table-condensed mb-none" EmptyDataText = "No hay solicitudes de este proveedor aun">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblId" Text='<%#Eval("idSolicitud") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="# Cotizacion">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtNumCotizacion" runat="server" CssClass="form-control" Width="84" TextMode="Number"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Proveedor">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProveedor" Text='<%#Eval("nombreProveedor") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Numero de Parte">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNumParte" Text='<%#Eval("numeroParte") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descripcion">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDescripcion" Text='<%#Eval("descripcion") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad de Piezas">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCantPzs" Text='<%#Eval("cantidadPiezas") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Razon de Sorteo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRazonSort" Text='<%#Eval("razonSorteo") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:ImageField DataImageUrlField="imagenDefecto" HeaderText="Defecto" ControlStyle-Width="90px"></asp:ImageField>
                                        <asp:TemplateField HeaderText="Fecha de Solicitud">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFechaSol" Text='<%#Eval("fechaSolicitud") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Moneda">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="cmbMoneda" data-plugin-selectTwo CssClass="form-control populate" Width="84" runat="server" >
                                                    <asp:ListItem>MXN</asp:ListItem>
							                        <asp:ListItem>USD</asp:ListItem>
							                        <asp:ListItem>EUR</asp:ListItem>
						                        </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Costo por Hora (Dolares)">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtCPH" runat="server" Width="84" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tiempo por Pieza (Segundos)">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtTPP" runat="server" Width="84" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText ="Cotizar">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkCotizar" Text = "Cotizar" ItemStyle-Width="70" CommandArgument = '<%# Eval("idSolicitud") %>' runat="server" OnClick = "CotizarSorteo"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
								</div>
							</div>
						</section>
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
