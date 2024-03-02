using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Globalization;

namespace BackRSS
{
    public partial class AdminReportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubirReporte.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false");
            
            if (!IsPostBack)
            {
                if (Session["nombreCuenta"] == null)
                {
                    Response.Redirect("Error404.html");
                }
                else if (Session["rol"].ToString() == "Usuario")
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
                    llenarCombo();

                }
            }


        }

        protected void llenarGrid() {
            string nombreProveedor = cmbProveedores.SelectedValue.ToString();
            string folderPath = Server.MapPath("~/Back/Reportes/" + nombreProveedor + "/");
            if (!Directory.Exists(folderPath)) {
                dgvAdmReportes.DataSource = null;
                dgvAdmReportes.DataBind();
            }
            else {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Back/Reportes/" + nombreProveedor + "/"));
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
                dgvAdmReportes.DataSource = files;
                dgvAdmReportes.DataBind();
            }
            
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
            llenarGrid();
        }

        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            llenarGrid();
        }

        private void llenarCombo()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select DISTINCT nombreProveedor from PROVEEDORES", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            cmbProveedores.DataSource = ds;
            cmbProveedores.DataTextField = "nombreProveedor";
            cmbProveedores.DataValueField = "nombreProveedor";
            cmbProveedores.DataBind();

        }

        protected void btnBuscarProveedor_Click(object sender, EventArgs e)
        {
            llenarGrid();
        }

        protected void btnCargarReporte_Click(object sender, EventArgs e)
        {
            UploadFile();
        }

        public void UploadFile()
        {
            string nombreProveedor = cmbProveedores.SelectedValue.ToString();
            string folderPath = Server.MapPath("~/Back/Reportes/" + nombreProveedor + "/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }
            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
            FileUpload1.Dispose();
            FileUpload1.FileContent.Close();
            llenarGrid();
            
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