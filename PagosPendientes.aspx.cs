using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace BackRSS
{
    public partial class PagosPendientes : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataTable dt;
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

                    this.BindGrid();
                }
                
            }


        }

        private void BindGrid()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            con.Open();
            string query = "SELECT [idFactura],[nombreProveedor],[numeroFactura],[estatusPago], convert(nvarchar(20),[fechaLimitePago], 105) as fechaLimitePago,[fechaCreacion],[nombreFactura] FROM pagosPendientes WHERE [nombreProveedor] = @nombreProveedor ORDER BY 4 desc, 3 desc";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nombreProveedor", Session["nombreUsuario"].ToString());
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();
            con.Close();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label tot = (Label)e.Row.FindControl("lblEstatus");
                String estatus = tot.Text;

                if (estatus == "Pagado")
                {
                    e.Row.Cells[2].BackColor = Color.FromName("#c6efce");
                }
                if (estatus == "En Espera")
                {
                    e.Row.Cells[2].BackColor = Color.FromName("#ffeb9c");

                }
                if (estatus == "Sin Respuesta")
                {
                    e.Row.Cells[2].BackColor = Color.FromName("#ffc7ce");

                }
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void cerrarSesion_Click(Object sender, EventArgs e)
        {
            Session["nombreCuenta"] = null;
            Session["rol"] = null;
            Session["nombreUsuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            System.Net.WebClient req = new System.Net.WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            

            //response.AddHeader("Content-Disposition", "attachment;filename=\"" + Server.MapPath("~/Files/" + filePath) + "\"");
            response.AddHeader("Content-Disposition", "attachment;filename=" + filePath);
            //byte[] data = req.DownloadData(Server.MapPath("~/Files/" + filePath));
            response.TransmitFile(Server.MapPath("~/Back/Facturas/" + Session["nombreUsuario"].ToString() + "/" + filePath));
            //response.BinaryWrite(data);
            response.End();
            BindGrid();
        }

    }
}