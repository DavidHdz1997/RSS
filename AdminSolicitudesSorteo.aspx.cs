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
    public partial class AdminSolicitudesSorteo : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataTable dt;
        //SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
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

                    con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                    con.Open();
                    da = new SqlDataAdapter("SELECT [idSolicitud],[nombreProveedor],[numeroParte],[descripcion],[cantidadPiezas],[razonSorteo],[imagenDefecto],convert(nvarchar(20),[fechaInicio], 105) as fechaInicio,convert(nvarchar(20),[fechaSolicitud], 105) as fechaSolicitud FROM[rsstest].[dbo].[testSolicitud] WHERE [fechaSolicitud] = convert(date,GETDATE(), 105) AND cotizacionCreada NOT IN ('Y')", con);
                    dt = new DataTable();

                    da.Fill(dt);

                    gdImage.DataSource = dt;

                    gdImage.DataBind();
                    con.Close();
                    

                }
            }
            
        }

        protected void buscarSolicitudes() {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            con.Open();
            string query = "SELECT [idSolicitud],[nombreProveedor],[numeroParte],[descripcion],[cantidadPiezas],[razonSorteo],[imagenDefecto],convert(nvarchar(20),[fechaInicio], 105) as fechaInicio,convert(nvarchar(20),[fechaSolicitud], 105) as fechaSolicitud FROM[rsstest].[dbo].[testSolicitud] WHERE [fechaSolicitud] = convert(date,@fechaSolicitud, 105) AND cotizacionCreada NOT IN ('Y')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@fechaSolicitud", SqlDbType.SmallDateTime);
            cmd.Parameters["@fechaSolicitud"].Value = dtpFechaSolicitud.Text;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);

            gdImage.DataSource = dt;

            gdImage.DataBind();
            con.Close();
        }

        protected void btnBuscarSolicitud_Click(object sender, EventArgs e)
        {
            buscarSolicitudes();

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
            gdImage.DataBind();
        }

        protected void CotizarSorteo(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;

            foreach (GridViewRow row in gdImage.Rows)
            {
                bool flag = false;
                string numCot = (row.FindControl("txtNumCotizacion") as TextBox).Text;
                decimal cph = Convert.ToDecimal((row.FindControl("txtCPH") as TextBox).Text);
                decimal tpp = Convert.ToDecimal((row.FindControl("txtTPP") as TextBox).Text);
                string idSolicitud = (row.FindControl("lblId") as Label).Text;
                string moneda = (row.FindControl("cmbMoneda") as DropDownList).SelectedValue.ToString();
                string fechaCotizacion = (row.FindControl("lblFechaSol") as Label).Text;
                string proveedor = (row.FindControl("lblProveedor") as Label).Text;
                string numParte = (row.FindControl("lblNumParte") as Label).Text;
                string descripcion = (row.FindControl("lblDescripcion") as Label).Text;
                string razonSorteo = (row.FindControl("lblRazonSort") as Label).Text;
                decimal cantPiezas = Convert.ToDecimal((row.FindControl("lblCantPzs") as Label).Text);
                

                if (id.ToString() == idSolicitud.ToString())
                {
                    if (numCot != "" && cph.ToString() != "" && tpp.ToString() != "")
                    {
                        flag = true;
                        decimal segsTotales = Math.Round((tpp * cantPiezas),2);
                        decimal hrsTotales = Math.Round((segsTotales / 3600),2);
                        decimal subtotal = Math.Round((cph * hrsTotales),2);
                        decimal iva = Math.Round((subtotal * (decimal)0.16),2);
                        decimal total = Math.Round((subtotal + iva),2);

                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                        con.Open();//abrimos conexion
                        string sql = "SELECT telefonoContacto, correoContacto FROM PROVEEDORES WHERE nombreProveedor = @proveedor";
                        SqlCommand cmd3 = new SqlCommand(sql, con); //ejecutamos la instruccion
                        cmd3.Parameters.AddWithValue("@proveedor", proveedor); //enviamos los parametros
                        cmd3.ExecuteScalar();
                        DataTable dt = new DataTable();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd3);
                        adapter.Fill(dt);
                        con.Close();
                        string telefonoProveedor = dt.Rows[0][0].ToString();
                        string correoProveedor = dt.Rows[0][1].ToString();

                        con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE testSolicitud SET cotizacionCreada = 'Y', numeroCotizacion = @numCot, cph = @cph, tpp = @tpp, moneda = @moneda WHERE idSolicitud = @id", con);
                        cmd.Parameters.AddWithValue("@numCot", numCot);
                        cmd.Parameters.AddWithValue("@cph", cph);
                        cmd.Parameters.AddWithValue("@tpp", tpp);
                        cmd.Parameters.AddWithValue("@moneda", moneda);
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        
                        
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[cotizaciones] (numeroCotizacion, fechaCotizacion, nombreProveedor, telefonoProveedor, correoProveedor, numeroParte, descripcion, razonSorteo, " +
                                                        "moneda, costoPorHora, cantidadHoras, subTotal, ivaCotizacion, totalCotizacion) VALUES (@numCot, @fechaCot, @nombreProv, @telProv, @correoProv, @numParte, @desc, @razonSor, @moneda, " +
                                                        "@costoPH, @cantHoras, @subTotal, @iva, @total)", con);
                        cmd2.Parameters.AddWithValue("@numCot", numCot);
                        cmd2.Parameters.AddWithValue("@fechaCot", SqlDbType.SmallDateTime);
                        cmd2.Parameters["@fechaCot"].Value = fechaCotizacion;
                        cmd2.Parameters.AddWithValue("@nombreProv", proveedor);
                        cmd2.Parameters.AddWithValue("@telProv", telefonoProveedor);
                        cmd2.Parameters.AddWithValue("@correoProv", correoProveedor);
                        cmd2.Parameters.AddWithValue("@numParte", numParte);
                        cmd2.Parameters.AddWithValue("@desc", descripcion);
                        cmd2.Parameters.AddWithValue("@razonSor", razonSorteo); 
                        cmd2.Parameters.AddWithValue("@moneda", moneda);    
                        cmd2.Parameters.AddWithValue("@costoPH", cph);
                        cmd2.Parameters.AddWithValue("@cantHoras", hrsTotales);
                        cmd2.Parameters.AddWithValue("@subTotal", subtotal);
                        cmd2.Parameters.AddWithValue("@iva", iva);
                        cmd2.Parameters.AddWithValue("@total", total);
                        cmd2.ExecuteNonQuery();
                        con.Close();

                        string script = @"alert('Cotizacion creada correctamente. Usted puede verla en el modulo ""Cotizaciones"" ');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

                        break;
                    }
                    else
                    {
                        flag = false;
                        string script = @"alert('Datos invalidos o no completos.');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                        break;
                    }
                }
            }

            buscarSolicitudes();
        }
    }
}