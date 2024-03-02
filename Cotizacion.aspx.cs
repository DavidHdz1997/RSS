using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BackRSS
{
    public partial class Cotizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                lblCant.Text = Session["cantidad"].ToString();
                lblCorreo.Text = Session["correo"].ToString();
                lblDesc.Text = Session["descripcion"].ToString();
                lblFechaCot.Text = DateTime.Now.ToShortDateString();
                Random rnd = new Random();
                int NoCot = rnd.Next(1, 100);
                lblNoCot.Text = "#"+ Convert.ToString(NoCot);
                lblNombre.Text = Session["nombreUsuario"].ToString();
                lblNumPart.Text = Session["numParte"].ToString();
                lblSubTotal.Text = Session["total"].ToString();
                lblTelefono.Text = Session["telefono"].ToString();
                lblTotal.Text = Session["total"].ToString();
                lblTotalFinal.Text = Session["total"].ToString();
            }
        }
    }
}