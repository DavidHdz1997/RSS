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
    public partial class SolicitudSorteo : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDefectosSolicitud.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false");
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

                    dtpInicioSorteo.Text = DateTime.Now.ToShortDateString();
                    llenarGrid();
                }
                
            }
            
        }

        protected void btnSolicitar_Click(object sender, EventArgs e)
        {

            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string[] validFileTypes = {"png", "bmp", "jpg", "jpeg", "pptx"};
            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            bool isValidFile = false;

            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
                else
                {
                    isValidFile = false;
                }
            }

            if (isValidFile)
            {
                try
                {
                    FileUpload1.SaveAs(Server.MapPath("~/assets/images/" + Session["nombreUsuario"].ToString() + "_" + filename));
                    string image = "assets/images/" + Session["nombreUsuario"].ToString() + "_" + filename;
                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                    con.Open();

                    cmd = new SqlCommand("insert into testSolicitud (numeroParte, nombreProveedor, descripcion, cantidadPiezas, razonSorteo, imagenDefecto, fechaInicio) values (@numParte, @nomProveedor, @desc, @cant, @razon, @imagen, convert(date, @fecha, 105))", con);

                    cmd.Parameters.AddWithValue("@numParte", txtNumParteSolicitud.Text.Trim());
                    cmd.Parameters.AddWithValue("@nomProveedor", Session["nombreUsuario"].ToString());
                    cmd.Parameters.AddWithValue("@desc", txtDescSolicitud.Text.Trim());
                    cmd.Parameters.AddWithValue("@cant", txtCantSolicitud.Text.Trim());
                    cmd.Parameters.AddWithValue("@razon", txtRazonSolicitud.Text.Trim());
                    cmd.Parameters.AddWithValue("@imagen", image);
                    cmd.Parameters.AddWithValue("@fecha", SqlDbType.SmallDateTime);
                    cmd.Parameters["@fecha"].Value = DateTime.Parse(dtpInicioSorteo.Text).ToString("dd-MM-yyyy").Trim();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
                finally
                {
                    con.Close();
                    CleartextBoxes(this);
                    dtpInicioSorteo.Text = DateTime.Now.ToShortDateString();
                    txtNumParteSolicitud.Focus();
                }
                string script = @"alert('Se ha registrado correctamente la solicitud.');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                FileUpload1.Dispose();
                FileUpload1.FileContent.Close();
            }
            else
            {
                string script = @"alert('Archivo invalido. Subir archivo con extension .png, .bmp, .jpg, .jpeg o .pptx');
                            window.location.hostname;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
        }

        protected void btnLimpiarSolicitud_Click(object sender, EventArgs e)
        {
            CleartextBoxes(this);
            dtpInicioSorteo.Text = DateTime.Now.ToShortDateString();
            txtNumParteSolicitud.Focus();
        }

        public void CleartextBoxes(Control parent)
        {

            foreach (Control x in parent.Controls)
            {
                if ((x.GetType() == typeof(TextBox)))
                {

                    ((TextBox)(x)).Text = "";
                }

                if (x.HasControls())
                {
                    CleartextBoxes(x);
                }
            }
        }

        public void llenarGrid() {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            con.Open();
            string query = "SELECT [idSolicitud],[nombreProveedor],[numeroParte],[descripcion],[cantidadPiezas],[razonSorteo],[imagenDefecto],convert(nvarchar(20),[fechaInicio], 105) as fechaInicio,convert(nvarchar(20),[fechaSolicitud], 105) as fechaSolicitud FROM[rsstest].[dbo].[testSolicitud] WHERE [nombreProveedor] = @nombreProveedor ORDER BY 9 DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nombreProveedor", Session["nombreUsuario"].ToString());
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);

            gdImage.DataSource = dt;

            gdImage.DataBind();
            con.Close();
        }

        protected void cerrarSesion_Click(Object sender, EventArgs e)
        {
            Session["nombreCuenta"] = null;
            Session["rol"] = null;
            Session["nombreUsuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gdImage.PageIndex = e.NewPageIndex;
            this.llenarGrid();
        }
    }
}