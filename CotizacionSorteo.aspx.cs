using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BackRSS
{
    public partial class CotizacionSorteo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["nombreCuenta"] == null)
                {
                    Response.Redirect("Error404.html");
                }
                else if (Session["rol"].ToString() == "Administrador")
                {
                    Response.Redirect("Error404.html");
                }
                else
                {
                    if (Session["nombreUsuario"] != null)
                    {
                        Label1.Text = Session["nombreUsuario"].ToString();
                    }

                    if (Session["rol"] != null)
                    {
                        Label2.Text = Session["rol"].ToString();
                    }
                    
                }

            }
        }

        protected void btnCotizar_Click(object sender, EventArgs e)
        {
            Session["cantidad"] = txtCantCotizacion.Text;
            Session["numParte"] = txtNumParteCotizacion.Text;
            Session["descripcion"] = txtDescCotizacion.Text;
            Session["total"] = double.Parse(txtCantCotizacion.Text) * 10;
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Prueba", "window.open('../Cotizacion.aspx', '_blank');", true);
        }

        protected void cerrarSesion_Click(Object sender, EventArgs e)
        {
            Session["nombreCuenta"] = null;
            Session["rol"] = null;
            Session["nombreUsuario"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}