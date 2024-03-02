using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BackRSS
{
    public partial class Defectos : System.Web.UI.Page
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
                //else
                //{
                //    if (Session["nombreUsuario"] != null)
                //    {
                //        Label1.Text = Session["nombreUsuario"].ToString();
                //    }

                //    if (Session["rol"] != null)
                //    {
                //        Label2.Text = Session["rol"].ToString();
                //    }

                //}

            }
        }
    }
}