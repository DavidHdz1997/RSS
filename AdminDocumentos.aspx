<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDocumentos.aspx.cs" Inherits="BackRSS.AdminDocumentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Basic -->
		<meta charset="UTF-8" />

		<title>Documentos RSS</title>
		<meta name="keywords" content="Documentos RSS" />
		<meta name="description" content="Sistema de documentacion RSS - V 1.0" />
		<meta name="author" content="RSS" />

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
					<a href="/AdminDocumentos.aspx" class="logo">
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
                                <asp:Label CssClass ="role" ID="Label2" runat="server" Text="Administrador"></asp:Label>
							</div>
			
							<i class="fa custom-caret"></i>
						</a>
			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
                                    <asp:LinkButton  role="menuitem" tabindex="-1" ID="cerrarSesion" runat="server" OnClick="cerrarSesion_Click"><i class="fa fa-power-off"></i> Cerrar Sesión</asp:LinkButton>
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

            <!-- start: page -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Documentos RSS</h2>
					</header>
					<!-- start: page -->
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div>
						
								<h2 class="panel-title">Documentos</h2>
							</header>
							<div class="panel-body">

                                <div class="form-group">
												<label class="col-md-3 control-label">Subir Documento</label>
												<div class="col-md-6">
													<div class="fileupload fileupload-new" data-provides="fileupload">
														<div class="input-append">
                                                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="fileInfo()" style="display: none;" />
                                                            <asp:TextBox ID="fuDocumentos" runat="server" CssClass="uneditable-input" ReadOnly="True"></asp:TextBox>
                                                            <asp:LinkButton ID="btnSubirDocumento" CssClass="btn btn-primary" runat="server">Seleccionar</asp:LinkButton>
														</div>
                                                        <asp:RequiredFieldValidator ID="rfUpload" runat="server" ErrorMessage="Debe adjuntar algún archivo." ValidationGroup="VG3" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
													</div>
                                                    <span class="help-block">Adjunte los reportes a subir del proveedor seleccionado.</span>
												</div>
                                                <div class="col-md-3">
                                                    <asp:Button ID="btnCargarDocumentos" runat="server" Text="Subir Documentos" CssClass="btn btn-primary" ValidationGroup ="VG3" OnClientClick="if (Page_ClientValidate('VG3') == false) { if (Page_Validators != null) { for (i = 0; i < Page_Validators.length; i++) { Page_Validators[i].className =  'required';  } } } else { this.value='Subiendo...'; this.disabled = true; }" UseSubmitBehavior="false" OnClick="btnCargarDocumentos_Click"/>
                                                </div>
											</div>

								<div class="table-responsive">
                                    <asp:GridView runat="server" ID="gvFiles" AutoGenerateColumns="false" OnRowCancelingEdit="OnRowCancelingEdit" OnRowDeleting="OnRowDeleting"
                                        OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" CssClass="table table-bordered table-striped table-condensed mb-none" 
                                        EmptyDataText = "No hay documentos subidos aun." OnRowDataBound="gvFiles_RowDataBound" PageSize = "10" AllowPaging ="true" OnPageIndexChanging = "OnPaging">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID" visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" Text='<%#Eval("ID") %>' runat="server" />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:Label ID="lblEditId" Text='<%#Eval("ID") %>' runat="server" />
                                                </EditItemTemplate>--%>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nombre de Archivo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFile" Text='<%#Eval("FileName") %>' runat="server" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:FileUpload ID="fuEditFile" runat="server" />
                                                    <asp:RequiredFieldValidator ID="rfvEditFile" ErrorMessage="Subir un documento" ControlToValidate="fuEditFile"
                                                        runat="server" ForeColor="Red" Display="Dynamic" />
                                                    &nbsp;<asp:Label ID="lblEditFile" Text='<%#Eval("FileName") %>' runat="server" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Subido Por">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsubidoPor" Text='<%#Eval("subidoPor") %>' runat="server" />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:Label ID="lblEditId" Text='<%#Eval("ID") %>' runat="server" />
                                                </EditItemTemplate>--%>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Fecha de Creacion">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfechaSubido" Text='<%#Eval("fechaSubido") %>' runat="server" />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:Label ID="lblEditId" Text='<%#Eval("ID") %>' runat="server" />
                                                </EditItemTemplate>--%>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Modificado Por">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmodificadoPor" Text='<%#Eval("modificadoPor") %>' runat="server" />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:Label ID="lblEditId" Text='<%#Eval("ID") %>' runat="server" />
                                                </EditItemTemplate>--%>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ultima Modificacion">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfechaModificado" Text='<%#Eval("fechaModificado") %>' runat="server" />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:Label ID="lblEditId" Text='<%#Eval("ID") %>' runat="server" />
                                                </EditItemTemplate>--%>
                                            </asp:TemplateField>
                                            <asp:CommandField ButtonType="Link" ShowEditButton="true" ItemStyle-Width="70" EditText ="Editar" CancelText="Cancelar" UpdateText="Actualizar" HeaderText ="Editar" />
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" ItemStyle-Width="70" DeleteText ="Eliminar" HeaderText ="Eliminar" />
                                            <asp:TemplateField HeaderText ="Descargar">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDownload" Text = "Descargar" ItemStyle-Width="70" CommandArgument = '<%# Eval("FileName") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        </asp:GridView>
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

        <%-- Obtiene el nombre del file y lo pone en el campo --%>
        <script>
            function fileInfo() {
                document.getElementById('<%=fuDocumentos.ClientID%>').value = document.getElementById('<%=FileUpload1.ClientID%>').files[0].name;
            }
        </script>

	</body>
</html>
