<%@ Page Title="" Language="C#" MasterPageFile="~/global.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BackRSS.WebForm1" EnableEventValidation="false" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <!-- Home Section -->

<section id="home" class="main">
     <div class="overlay"></div>
	<div class="container">
		<div class="row">

               <div class="wow fadeInUp col-md-6 col-sm-5 col-xs-10 col-xs-offset-1 col-sm-offset-0" data-wow-delay="0.2s">
                    <img src="Front/images/Inicio.png" class="img-responsive" alt="Home" />
               </div>

               <div class="col-md-6 col-sm-7 col-xs-12">
                    <div class="home-thumb">
                         <h1 class="wow fadeInUp" data-wow-delay="0.6s">LA MEJOR SOLUCION PARA SU NEGOCIO</h1>
                         <p class="wow fadeInUp" data-wow-delay="0.8s">Especialistas en la inspeccion y retrabajo de materiales enfocados en el area automotriz, electronica y de plasticos.</p>
                    </div>
               </div>

		</div>
	</div>
</section>


<!-- About Section -->

<section id="about">
     <div class="container">
          <div class="row">

               <div class="col-md-12 col-sm-12">
                    <div class="wow bounceIn section-title">
                         <h1>¿QUIENES SOMOS?</h1>
                         <hr>
                    </div>
               </div>

               <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="0.4s">
                   <h2>SOLUCIONES ADECUADAS A TU NEGOCIO</h2>
                   <p class="wow fadeInUp" data-wow-delay="0.8s">Representative & Sorting Service es una compañia con personal entrenado con mas de 10 años de experiencia preparado para ofrecer el servicio de excelencia que siempre nos ha caracterizado.</p>
                   <p class="wow fadeInUp" data-wow-delay="0.8s">Nos dedicamos a la clasificacion, inspeccion, re-trabajo y representacion en todo el pais.</p>
               </div>

               <div class="wow fadeInUp col-md-3 col-sm-6" data-wow-delay="0.4s">
                    <div class="about-thumb">
                         <img src="Front/images/quienessomos.png" class="img-responsive" alt="Team">
                    </div>
               </div>

                <div class="wow fadeInUp col-md-3 col-sm-6" data-wow-delay="0.4s">
                    <div class="about-thumb">
                         <img src="Front/images/quienessomos2.png" class="img-responsive" alt="Team">
                    </div>
               </div>
          </div>

         <div class="row">
               <div class="wow fadeInUp col-md-3 col-sm-6" data-wow-delay="0.4s" style= "padding-top: 50px;">
                    <div class="about-thumb">
                         <img src="Front/images/quienessomos3.png" class="img-responsive" alt="Team">
                    </div>
               </div>

                <div class="wow fadeInUp col-md-3 col-sm-6" data-wow-delay="0.4s" style= "padding-top: 50px;">
                    <div class="about-thumb">
                         <img src="Front/images/quienessomos4.png" class="img-responsive" alt="Team">
                    </div>
               </div>

              <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="0.4s">
                   <h2 class=text-right>EMPRESA CERTIFICADA</h2>
                   <p class="wow fadeInUp text-right" data-wow-delay="0.8s">La empresa cuenta actualmente con la certificacion ISO 9001:2015, ademas de que cuenta con un certificado de IPC (Manejo y control de ESD “Workshop” basado en la norma  ANSI ESD 20.20).</p>
               </div>

            <%-- <div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.4s">
                   <h2 class=text-center>CERTIFICADO</h2>
                   <div class="about-thumb">
                         <img src="images/Certificado RSS 9k15.png" class="img-responsive" alt="Team">
                  </div>
                   
               </div>--%>
             </div>

         <div class="row">
            <div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.4s" style ="position: relative; display: block;">
                  <h2 class=text-center>CERTIFICADO</h2>
                  <div class="about-thumb">
                         <img src="Front/images/Certificado RSS 9k15.png" class="img-responsive" alt="Team" style="
                            width: 80%;
                            height: 80%;
                            margin-left: auto;
                            margin-right: auto;
                        ">
                  </div>
                <p class="wow fadeInUp text-center" data-wow-delay="0.8s">Numero de certificado de ISO: NEMT/SC/0034/18.</p>
              </div>
        </div>
     </div>
</section>


<!-- Screenshot Section -->

<section id="screenshot">
     <div class="container">
          <div class="row">

               <%--<div class="col-md-12 col-sm-12" style="height: 180px;">
                    
               </div>--%>

              <div class="wow bounceIn section-title animated" style="padding-bottom: 29px;">
                         <h1>SERVICIOS</h1>
                         <hr>
                    </div>

              <div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.4s" style="text-align: center">
                  <h2>✔ INSPECCION Y RETRABAJOS</h2>
                  <p class="wow fadeInUp serviciosi" data-wow-delay="0.8s">Ofrecemos los servicios de inspeccion y retrabajo de materiales electronicos, metales y plasticos.</p>
              </div>

               <!-- Screenshot Owl Carousel -->
               <div id="screenshot-carousel" class="owl-carousel">

                    <div class="item col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.9s">
                         <a href="Front/images/servicio.png" class="image-popup">
                              <img src="Front/images/servicio.png" class="img-responsive" alt="screenshot"/>
                         </a>
                    </div>

                    <div class="item col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.9s">
                         <a href="Front/images/servicio2.png" class="image-popup">
                              <img src="Front/images/servicio2.png" class="img-responsive" alt="screenshot"/>
                         </a>
                    </div>

                    <div class="item col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.9s">
                         <a href="Front/images/servicio3.png" class="image-popup">
                              <img src="Front/images/servicio3.png" class="img-responsive" alt="screenshot"/>
                         </a>
                    </div>

                   <div class="item col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.9s">
                         <a href="Front/images/servicio4.png" class="image-popup">
                              <img src="Front/images/servicio4.png" class="img-responsive" alt="screenshot"/>
                         </a>
                    </div>

                   <div class="item col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.9s">
                         <a href="Front/images/servicio5.png" class="image-popup">
                              <img src="Front/images/servicio5.png" class="img-responsive" alt="screenshot"/>
                         </a>
                    </div>

                   <div class="item col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.9s">
                         <a href="Front/images/servicio6.png" class="image-popup">
                              <img src="Front/images/servicio6.png" class="img-responsive" alt="screenshot"/>
                         </a>
                    </div>

               </div>

              <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="0.4s">
                  <h2>✔ REPORTES DIARIOS</h2>
                  <p class="wow fadeInUp servicios" data-wow-delay="0.8s">Ofrecemos ademas control del trabajo realizado por medio de reportes fisicos y/o electronicos.</p>
                  <div class="about-thumb">
                         <img src="Front/images/reporte.png" class="img-responsive" alt="Team"/>
                  </div>
              </div>

              <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="0.4s">
                  <h2>✔ MONITOREO</h2>
                  <p class="wow fadeInUp servicios" data-wow-delay="0.8s">Ofrecemos apoyo con la ayuda de la tecnologia para agilizar el traslado de la informacion a los departamentos correspondientes.</p>
                  <div class="about-thumb">
                         <img src="Front/images/monitoreo.png" class="img-responsive" alt="Team"/>
                  </div>
              </div>


          </div>
     </div>
</section>


<!-- Pricing Section -->

<section id="pricing">
     <div class="container">
          <div class="row">

                <div class="col-md-12 col-sm-12">
                    <div class="section-title">
                         <h1>BOLSA DE TRABAJO</h1>
                         <hr/>
                    </div>
               </div>

              <div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.4s" style="text-align: center">
                  <p class="wow fadeInUp serviciosi" data-wow-delay="0.8s">¿Buscas empleo? Unete a nosotros.</p>
              </div>

               <div class="wow fadeInUp col-md-4 col-sm-4" data-wow-delay="0.4s">
                    <div class="pricing-plan" >
                         <div class="pricing-month">
                              <h2>INSPECTOR DE CALIDAD</h2>
                         </div>
                         <p class="bt">✓ EN MANTENIMIENTO</p>
                            <div class="pricing-month" >
                                <p class="bts">Complete los siguientes campos y adjunte su CV en formato .doc, .docx o .pdf</p>
                                <asp:TextBox runat="server" ID="txtNombre1" CssClass= "form-control" placeholder = "Nombre completo" CausesValidation="True" ValidationGroup="VG1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfNombre1" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtNombre1"></asp:RequiredFieldValidator>
                                <br/>
                                <asp:TextBox runat="server" ID="txtCelular1" CssClass= "form-control" placeholder = "Numero telefonico para contacto" CausesValidation="True" ValidationGroup="VG1" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfCelular1" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG1" ControlToValidate="txtCelular1"></asp:RequiredFieldValidator>
                                <br/>
                                <asp:TextBox runat="server" ID="txtEmail1" CssClass= "form-control" placeholder = "E-mail para contacto" CausesValidation="True" TextMode="Email" ValidationGroup="VG1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfEmail1" runat="server" ErrorMessage="Debe capturar los campos solicitados" ControlToValidate="txtEmail1" ValidationGroup="VG1"></asp:RequiredFieldValidator>
                                <hr/>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="fup"/>
                                <hr/>
                                <asp:Button ID="btnPost1" runat="server" Text="Postularse" CssClass="btn btn-default section-btn" OnClick="btnPost1_Click" causesvalidation="true" ValidationGroup="VG1" OnClientClick="if(Page_ClientValidate('VG1')){ this.value='Postulando...'; this.disabled = true; }" UseSubmitBehavior="false"/>
                             </div>
                    </div>
               </div>

               <div class="wow fadeInUp col-md-4 col-sm-4" data-wow-delay="0.6s">
                    <div class="pricing-plan">
                         <div class="pricing-month">
                              <h2>TECNICO EN ESD</h2>
                         </div>
                         <p class="bt">✓ EN MANTENIMIENTO</p>
                         <div class="pricing-month">
                             <p class="bts">Complete los siguientes campos y adjunte su CV en formato .doc, .docx o .pdf</p>
                             <asp:TextBox runat="server" ID="txtNombre2" CssClass= "form-control" placeholder = "Nombre completo" CausesValidation="True" ValidationGroup="VG2"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfNombre2" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG2" ControlToValidate="txtNombre2"></asp:RequiredFieldValidator>
                            <br/>
                             <asp:TextBox runat="server" ID="txtCelular2" CssClass= "form-control" placeholder = "Numero telefonico para contacto" CausesValidation="True" ValidationGroup="VG2" TextMode="Number"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfCelular2" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG2" ControlToValidate="txtCelular2"></asp:RequiredFieldValidator>
                             <br/>
                            <asp:TextBox runat="server" ID="txtEmail2" CssClass= "form-control" placeholder = "E-mail para contacto" CausesValidation="True" TextMode="Email" ValidationGroup="VG2"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfEmail2" runat="server" ErrorMessage="Debe capturar los campos solicitados" ControlToValidate="txtEmail2" ValidationGroup="VG2"></asp:RequiredFieldValidator>
                            <hr/>
                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="fup"/>
                            <hr/>
                         </div>
                        <asp:Button ID="btnPost2" runat="server" Text="Postularse" CssClass="btn btn-default section-btn" OnClick="btnPost2_Click" causesvalidation="true" ValidationGroup="VG2" UseSubmitBehavior="false" OnClientClick="if(Page_ClientValidate('VG2')){ this.value='Postulando...'; this.disabled = true; }"/>
                    </div>
               </div>

               <div class="wow fadeInUp col-md-4 col-sm-4" data-wow-delay="0.8s">
                    <div class="pricing-plan">
                         <div class="pricing-month">
                              <h2>SUPERVISOR DE CALIDAD</h2>
                         </div>
                         <p class="bt">✓ EN MANTENIMIENTO</p>
                         <div class="pricing-month">
                             <p class="bts">Complete los siguientes campos y adjunte su CV en formato .doc, .docx o .pdf</p>
                             <asp:TextBox runat="server" ID="txtNombre3" CssClass= "form-control" placeholder = "Nombre completo" CausesValidation="True" ValidationGroup="VG3"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfNombre3" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup ="VG3" ControlToValidate="txtNombre3"></asp:RequiredFieldValidator>
                            <br/>
                             <asp:TextBox runat="server" ID="txtCelular3" CssClass= "form-control" placeholder = "Numero telefonico para contacto" CausesValidation="True" ValidationGroup="VG3" TextMode="Number"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfCelular3" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG3" ControlToValidate="txtCelular3"></asp:RequiredFieldValidator>
                             <br/>
                            <asp:TextBox runat="server" ID="txtEmail3" CssClass= "form-control"  placeholder = "E-mail para contacto" CausesValidation="True" TextMode="Email" ValidationGroup="VG3"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfEmail3" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup ="VG3" ControlToValidate="txtEmail3"></asp:RequiredFieldValidator>
                            <hr/>
                            <asp:FileUpload ID="FileUpload3" runat="server" CssClass="fup"/>
                            <hr/>
                         </div>
                        <asp:Button ID="btnPost3" runat="server" Text="Postularse" CssClass="btn btn-default section-btn" OnClick="btnPost3_Click" OnClientClick="if(Page_ClientValidate('VG3')){ this.value='Postulando...'; this.disabled = true; }" causesvalidation="true" validationgroup="VG3" UseSubmitBehavior="false" />
                    </div>
               </div>

          </div>
     </div>
</section>


<!-- Newsletter Section -->

<section id="newsletter">
     <div class="overlay"></div>
     <div class="container">
          <div class="row">

               <div class="col-md-offset-2 col-md-8 col-sm-12">
                    <div class="wow bounceIn section-title">
                         <h1>BUZON DE SUGERENCIAS</h1>
                         <p class="wow fadeInUp" data-wow-delay="0.5s">¡Sugierenos para mejorar!</p>
                    </div>
                    <div class="wow fadeInUp newsletter-form" data-wow-delay="0.8s">
                              <div class="col-md-8 col-sm-7">
                                 <asp:TextBox runat="server" ID="txtNombreBS" CssClass= "form-control" placeholder = "Nombre completo" CausesValidation="True" ValidationGroup="VG4"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfNombreBS" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup="VG4" ControlToValidate="txtNombreBS"></asp:RequiredFieldValidator>
                                <br/>
                                <asp:TextBox runat="server" ID="txtEmailBS" CssClass= "form-control" placeholder = "E-mail para contacto" CausesValidation="True" TextMode="Email" ValidationGroup="VG4"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfEmailBS" runat="server" ErrorMessage="Debe capturar los campos solicitados" ControlToValidate="txtEmailBS" ValidationGroup="VG4"></asp:RequiredFieldValidator>
                                <br/>
                                <asp:TextBox runat="server" ID="txtComentario" CssClass= "form-control" placeholder = "¿Cúal es la sugerencia?" Height="150px" CausesValidation="True" TextMode="MultiLine" ValidationGroup="VG4"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rfComentario" runat="server" ErrorMessage="Debe capturar los campos solicitados" ControlToValidate="txtComentario" ValidationGroup="VG4"></asp:RequiredFieldValidator>
                           	  </div>
                              <div class="col-md-4 col-sm-5">
                                   <asp:Button ID="btnEnviarSugerencia" runat="server" Text="Enviar" CssClass="section-btn btn btn-success" causesvalidation="true" validationgroup="VG4" OnClick="btnEnviarSugerencia_Click" OnClientClick="if(Page_ClientValidate('VG4')){ this.value='Enviando...'; this.disabled = true; }" UseSubmitBehavior="false"/>
                              </div>
                    </div>
               </div>

          </div>
     </div>
</section>

    <!-- Modal Contact -->

<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
      <div class="modal-content modal-popup">
          <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
               <h2 class="modal-title">Contactanos</h2>
          </div>
                    <asp:TextBox runat="server" ID="txtNombreContacto" CssClass= "form-control" placeholder = "Nombre completo" CausesValidation="True" ValidationGroup="VG5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfNombreContacto" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup ="VG5" ControlToValidate="txtNombreContacto" ForeColor="White"></asp:RequiredFieldValidator>
                 	<asp:TextBox runat="server" ID="txtEmailContacto" CssClass= "form-control" placeholder = "E-mail para contacto" CausesValidation="True" TextMode="Email" ValidationGroup="VG5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfEmailContacto" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup ="VG5" ControlToValidate="txtEmailContacto" ForeColor="White"></asp:RequiredFieldValidator>
                    <asp:TextBox runat="server" ID="txtNumeroContacto" CssClass= "form-control" placeholder = "Numero para contacto" CausesValidation="True" TextMode="Number" ValidationGroup="VG5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfNumeroContacto" runat="server" ErrorMessage="Debe capturar los campos solicitados" ValidationGroup ="VG5" ControlToValidate="txtNumeroContacto" ForeColor="White"></asp:RequiredFieldValidator>
                 	<asp:TextBox runat="server" ID="txtComentarioContacto" CssClass= "form-control" placeholder = "Escribanos su mensaje aqui" Height="150px" CausesValidation="True" TextMode="MultiLine" ValidationGroup="VG5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfComentarioContacto" runat="server" ErrorMessage="Debe capturar los campos solicitados" ControlToValidate="txtComentarioContacto" ValidationGroup="VG5" ForeColor="White"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnContacto" runat="server" Text="Enviar" CssClass= "form-control" causesvalidation="true" validationgroup="VG5" OnClientClick="if(Page_ClientValidate('VG5')){ this.value='Enviando...'; this.disabled = true; }" UseSubmitBehavior="false" OnClick="btnContacto_Click"/>
          </div>
     </div>
</div>
</asp:Content>
