using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BackRSS
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
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

                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Back/Reportes/" + Session["nombreUsuario"].ToString() + "/"));

                    List<ListItem> files = new List<ListItem>();
                    foreach (string filePath in filePaths)
                    {
                        files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                    }
                    GridView1.DataSource = files;
                    GridView1.DataBind();
                }
            }
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
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