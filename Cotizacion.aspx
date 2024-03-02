<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cotizacion.aspx.cs" Inherits="BackRSS.Cotizacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Cotizacion - RSS</title>
		<!-- Web Fonts  -->
		<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />

		<!-- Invoice Print Style -->
		<link rel="stylesheet" href="assets/stylesheets/invoice-print.css" />
</head>
	<body>
        <form id="form1" runat="server">
		<div class="invoice">
			<header class="clearfix">
				<div class="row">
					<div class="col-sm-6 mt-md">
						<h2 class="h2 mt-none mb-sm text-dark text-bold">COTIZACION</h2>
                        <asp:Label ID="lblNoCot" CssClass="h4 m-none text-dark text-bold" runat="server" Text=""></asp:Label>
					</div>
					<div class="col-sm-6 text-right mt-md mb-md">
						<address class="ib mr-xlg">
							Representative & Sorting Service S.A. de C.V.
							<br/>
							Tosca N° 6221, Paseo de las Mitras
							<br/>
							Monterrey, Nuevo León, México
							<br/>
							customerservice@rsssacv.com
						</address>
						<div class="ib">
							<img src="assets/images/LogoCabecera.png" alt="RSS" style="width: 150px;"/>
						</div>
					</div>
				</div>
			</header>
			<div class="bill-info">
				<div class="row">
					<div class="col-md-6">
						<div class="bill-to">
							<p class="h5 mb-xs text-dark text-semibold">To:</p>
							<address>
                                <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
								<br/>
								Phone: <asp:Label ID="lblTelefono" runat="server" Text=""></asp:Label>
								<br/>
                                <asp:Label ID="lblCorreo" runat="server" Text=""></asp:Label>
							</address>
						</div>
					</div>
					<div class="col-md-6">
						<div class="bill-data text-right">
							<p class="mb-none">
								<span class="text-dark">Fecha de Cotizacion:</span>
                                <asp:Label ID="lblFechaCot" CssClass="value" runat="server" Text=""></asp:Label>
							</p>
						</div>
					</div>
				</div>
			</div>
		
			<div class="table-responsive">
				<table class="table invoice-items">
					<thead>
						<tr class="h4 text-dark">
							<th id="cell-item"   class="text-semibold">Numero de Parte</th>
							<th id="cell-desc"   class="text-semibold">Descripcion</th>
							<th id="cell-price"  class="text-center text-semibold">Precio</th>
							<th id="cell-qty"    class="text-center text-semibold">Cantidad</th>
							<th id="cell-total"  class="text-center text-semibold">Total</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><asp:Label ID="lblNumPart" runat="server" Text=""></asp:Label></td>
							<td><asp:Label ID="lblDesc"  runat="server" Text=""></asp:Label></td>
							<td class="text-center">$10 DLS</td>
							<td class="text-center"><asp:Label ID="lblCant"  runat="server" Text=""></asp:Label></td>
                            <td class="text-center"><asp:Label ID="lblTotal"  runat="server" Text=""></asp:Label></td>
						</tr>
					</tbody>
				</table>
			</div>
		
			<div class="invoice-summary">
				<div class="row">
					<div class="col-sm-4 col-sm-offset-8">
						<table class="table h5 text-dark">
							<tbody>
								<tr class="b-top-none">
									<td colspan="2">Subtotal</td>
									<td class="text-left"><asp:Label ID="lblSubTotal"  runat="server" Text=""></asp:Label></td>
								</tr>
								<tr class="h4">
									<td colspan="2">Total Final</td>
									<td class="text-left"><asp:Label ID="lblTotalFinal"  runat="server" Text=""></asp:Label></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
        </form>
        <script>
			window.print();
		</script>
	</body>
</html>

