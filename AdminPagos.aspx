<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPagos.aspx.cs" Inherits="BackRSS.AdminPagos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Basic -->
		<meta charset="UTF-8">

		<title>Administracion RSS - Pagos y Facturas</title>
		<meta name="keywords" content="RSS" />
		<meta name="description" content="Pagos y Facturas RSS">
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
									<li >
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
                                    <li class="nav-active">
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
						<h2>Pagos</h2>
					</header>
                 <!-- start: page -->
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>
						
								<h2 class="panel-title">Administra los pagos pendientes</h2>
							</header>
							<div class="panel-body">
                              <div class="form-group">
												<label class="col-md-3 control-label">Proveedores</label>
												<div class="col-md-6">
                                                    <asp:DropDownList ID="cmbProveedores" data-plugin-selectTwo CssClass="form-control populate" runat="server">
                                                    </asp:DropDownList>
                                                    <span class="help-block">Seleccione un proveedor para visualizar sus pagos.</span>
												</div>
                                                <div class="col-md-3">
                                                    <asp:Button ID="btnBuscarProveedor" runat="server" Text="Cargar Pagos" CssClass="btn btn-primary" OnClick="btnBuscarProveedor_Click" />
                                                </div>
											</div>

                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCancelingEdit="OnRowCancelingEdit" OnRowDeleting="OnRowDeleting" OnRowEditing="OnRowEditing" 
                                OnRowUpdating="OnRowUpdating" CssClass="table table-bordered table-striped table-condensed mb-none" EmptyDataText="No hay pagos aun." OnRowDataBound="OnRowDataBound"   
                                PageSize = "6" AllowPaging ="true" OnPageIndexChanging = "OnPaging" DataKeyNames="idFactura">
                                <Columns>
<%--                                <asp:TemplateField HeaderText="ID" visible="False">
	                                <ItemTemplate>
		                                <asp:Label ID="lblId" Text='<%#Eval("idFactura") %>' runat="server" />
	                                </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Proveedor" ItemStyle-Width="150">
	                                <ItemTemplate>
		                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("nombreProveedor") %>'></asp:Label>
	                                </ItemTemplate>
	                                <EditItemTemplate>
		                                <asp:TextBox ID="txtNombreProveedor" runat="server" CssClass="form-control" Text='<%# Eval("nombreProveedor") %>' Width="140" ReadOnly="true"></asp:TextBox>
	                                </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Numero de Factura" ItemStyle-Width="150">
	                                <ItemTemplate>
		                                <asp:Label ID="lblNumFac" runat="server" Text='<%# Eval("numeroFactura") %>'></asp:Label>
	                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estatus" ItemStyle-Width="150">
	                                <ItemTemplate>
		                                <asp:Label ID="lblEstatus" runat="server" Text='<%# Eval("estatusPago") %>'></asp:Label>
	                                </ItemTemplate>
	                                <EditItemTemplate>
		                                <asp:DropDownList ID="txtEstatusFactura" data-plugin-selectTwo CssClass="form-control populate" runat="server">
							                <asp:ListItem>Pagado</asp:ListItem>
							                <asp:ListItem>Sin Respuesta</asp:ListItem>
							                <asp:ListItem>En Espera</asp:ListItem>
						                </asp:DropDownList>
	                                </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Limite de Pago" ItemStyle-Width="150">
	                                <ItemTemplate>
		                                <asp:Label ID="lblFechaPago" runat="server" Text='<%# Eval("fechaLimitePago") %>'></asp:Label>
	                                </ItemTemplate>
	                                <EditItemTemplate >
		                                <asp:TextBox ID="txtFechaPago" runat="server" data-plugin-datepicker CssClass="form-control" Text='<%# Eval("fechaLimitePago") %>'></asp:TextBox>
			                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de fecha no valido" CssClass="required" Display="Dynamic" ControlToValidate="txtFechaPago" ValidationExpression="^([0]?[0-9]|[12][0-9]|[3][01])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4})$"></asp:RegularExpressionValidator>
	                                </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Factura" visible="False">
	                                <ItemTemplate>
		                                <asp:Label ID="lblFactura" Text='<%#Eval("nombreFactura") %>' runat="server" />
	                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Link" ShowEditButton="true" ItemStyle-Width="109" EditText ="Editar" CancelText="Cancelar" UpdateText="Actualizar" HeaderText ="Editar" />
                                <asp:CommandField ButtonType="Link" ShowDeleteButton="true" ItemStyle-Width="109" DeleteText ="Eliminar" HeaderText ="Eliminar"/>
                                <asp:TemplateField HeaderText ="Descargar">
	                                <ItemTemplate>
		                                <asp:LinkButton ID="lnkDownload" Text = "Descargar" ItemStyle-Width="70" CommandArgument = '<%# Eval("nombreFactura") %>' runat="server" OnClick = "DownloadFile" ></asp:LinkButton>
	                                </ItemTemplate>
                                </asp:TemplateField>
                                </Columns>
                                </asp:GridView>
                        </div>

                            
							</div>
						</section>

                     <section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
										</div>
						
										<h2 class="panel-title">Agrega una nueva factura</h2>
									</header>
									<div class="panel-body">

                                            <div class="form-group">
												<label class="col-md-3 control-label">Proveedores</label>
												<div class="col-md-6">
                                                    <asp:DropDownList ID="cmbProveedoresAdd" data-plugin-selectTwo CssClass="form-control populate" runat="server">
                                                    </asp:DropDownList>
                                                    <span class="help-block">Seleccione un proveedor para agregarle una factura.</span>
												</div>
											</div>
						
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputHelpText">Numero de Factura</label>
												<div class="col-md-6">
                                                    <asp:TextBox ID="txtNumFactura" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
													<span class="help-block">Ingrese aqui el numero de factura.</span>
												</div>
                                                 <asp:RequiredFieldValidator ID="rfNumFac" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtNumFactura"></asp:RequiredFieldValidator>
											</div>

                                        <div class="form-group">
												<label class="col-md-3 control-label">Estatus</label>
												<div class="col-md-6">
                                                    <asp:DropDownList ID="cmbStatus" data-plugin-selectTwo CssClass="form-control populate" runat="server">
                                                        <asp:ListItem>Pagado</asp:ListItem>
                                                        <asp:ListItem>Sin Respuesta</asp:ListItem>
                                                        <asp:ListItem>En Espera</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span class="help-block">Seleccione el estatus de la factura.</span>
												</div>
											</div>

                                        <div class="form-group">
												<label class="col-md-3 control-label">Fecha de Pago</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
                                                         <asp:TextBox ID="dtpFechaPago" runat="server" data-plugin-datepicker CssClass="form-control"></asp:TextBox>
													</div>
                                                    <span class="help-block">Seleccione la fecha maxima para el pago de esta factura.</span>
												</div>
                                             <asp:RequiredFieldValidator ID="rfFecha" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="dtpFechaPago"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de fecha no valido" CssClass="required" Display="Dynamic" ControlToValidate="dtpFechaPago" ValidationExpression="^([0]?[0-9]|[12][0-9]|[3][01])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4})$" ValidationGroup="VG1"></asp:RegularExpressionValidator>
											</div>

                                        <div class="form-group">
											<label class="col-md-3 control-label">Subir Facturas</label>
											<div class="col-md-6">
												<div class="fileupload fileupload-new" data-provides="fileupload">
													<div class="input-append">
                                                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="fileInfo()" style="display: none;" AllowMultiple="true" />
                                                        <asp:TextBox ID="fuFacturas" runat="server" CssClass="uneditable-input" ReadOnly="True"></asp:TextBox>
                                                        <asp:LinkButton ID="btnSubirFactura" CssClass="btn btn-primary" runat="server">Seleccionar</asp:LinkButton>
													</div>
                                                    <asp:RequiredFieldValidator ID="rfUpload" runat="server" ErrorMessage="Debe adjuntar su factura." ValidationGroup="VG1" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
												</div>
                                                <span class="help-block">Adjunte las facturas a subir del proveedor seleccionado. Debe de ser un archivo ZIP de la siguiente forma: PROVEEDOR_NUMEROFACTURA.zip</span>
											</div>
										</div>
                                            <div class="col-md-6 center">
                                                <asp:Button ID="btnAgregarFactura" runat="server" Text="Agregar Factura" CssClass="btn btn-primary" OnClick="btnAgregarFactura_Click" ValidationGroup ="VG1" OnClientClick="if (Page_ClientValidate('VG1') == false) { if (Page_Validators != null) { for (i = 0; i < Page_Validators.length; i++) { Page_Validators[i].className =  'required';  } } } else { if(confirm('¿Estas seguro de agregar esta factura?')){ this.value='Subiendo...'; this.disabled = true; } else { return false; }}" UseSubmitBehavior="false"/>
                                            </div>
                                            <div class="col-md-6 left">
                                                <asp:Button ID="btnLimpiarFactura" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="btnLimpiarFactura_Click" />
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

    <%-- Obtiene el nombre del file y lo pone en el campo --%>
        <script>
            function fileInfo() {
                document.getElementById('<%=fuFacturas.ClientID%>').value = document.getElementById('<%=FileUpload1.ClientID%>').files[0].name;
            }
        </script>

</body>
</html>
