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
using System.IO;

namespace BackRSS
{

    public partial class AdminPagos : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubirFactura.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false");
            if (!this.IsPostBack)
            {
                //if (Session["nombreCuenta"] == null)
                //{
                //    Response.Redirect("Error404.html");
                //}
                //else if (Session["rol"].ToString() == "Usuario")
                //{
                //    Response.Redirect("Error404.html");
                //}
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
                //    this.llenarCombo();
                //    this.BindGrid();
                //}
            }
        }

        private void BindGrid()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            con.Open();
            string query = "SELECT[idFactura],[nombreProveedor],[numeroFactura],[estatusPago], convert(nvarchar(20),[fechaLimitePago], 105) as fechaLimitePago,[fechaCreacion],[nombreFactura] FROM pagosPendientes WHERE nombreProveedor = @proveedor  ORDER BY 6 desc ";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@proveedor", cmbProveedores.SelectedValue.ToString());
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            //string nombre = (row.Cells[2].Controls[0] as TextBox).Text;
            //string numFactura = (row.Cells[3].Controls[0] as TextBox).Text;
            //string estatus = (row.Cells[4].Controls[0] as TextBox).Text;
            //string fechaPago = (row.Cells[5].Controls[0] as TextBox).Text;
            string nombre = (row.FindControl("txtNombreProveedor") as TextBox).Text;
            string numFactura = (row.FindControl("lblNumFac") as Label).Text;
            string estatus = (row.FindControl("txtEstatusFactura") as DropDownList).SelectedValue;
            string fechaPago = (row.FindControl("txtFechaPago") as TextBox).Text;

            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE pagosPendientes SET nombreProveedor=@nombreProv, numeroFactura=@numFac, " +
                    "estatusPago=@estatus, fechaLimitePago=convert(date, @fechaPago, 105) WHERE idFactura=@idFac"))
                {
                    cmd.Parameters.AddWithValue("@idFac", customerId);
                    cmd.Parameters.AddWithValue("@nombreProv", nombre);
                    cmd.Parameters.AddWithValue("@numFac", numFactura);
                    cmd.Parameters.AddWithValue("@estatus", estatus);
                    cmd.Parameters.AddWithValue("@fechaPago", SqlDbType.SmallDateTime);
                    cmd.Parameters["@fechaPago"].Value = fechaPago;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string nombre = (row.FindControl("lblName") as Label).Text;
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string fileName = (row.FindControl("lblFactura") as Label).Text;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM pagosPendientes WHERE idFactura = @idFac"))
                {
                    cmd.Parameters.AddWithValue("@idFac", customerId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            
            string file = Server.MapPath("~/Back/Facturas/" + nombre + "/" + fileName);
            if (fileName != null || fileName != string.Empty)
            {
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[6].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('¿Quieres eliminar este pago? No podras verlo de nuevo.');";

                Label tot = (Label)e.Row.FindControl("lblEstatus");
                string estatus = tot.Text;

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

            cmbProveedoresAdd.DataSource = ds;
            cmbProveedoresAdd.DataTextField = "nombreProveedor";
            cmbProveedoresAdd.DataValueField = "nombreProveedor";
            cmbProveedoresAdd.DataBind();

        }

        protected void cerrarSesion_Click(Object sender, EventArgs e)
        {
            Session["nombreCuenta"] = null;
            Session["rol"] = null;
            Session["nombreUsuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void btnBuscarProveedor_Click(object sender, EventArgs e)
        {
            this.BindGrid();
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

        protected void btnLimpiarFactura_Click(object sender, EventArgs e)
        {
            CleartextBoxes(this);
            txtNumFactura.Focus();
            this.BindGrid();
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

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            con.Open();
            string query = "SELECT [nombreProveedor] FROM pagosPendientes WHERE nombreFactura = @nomFactura";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@nomFactura", filePath);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            string nombreProveedor = dt.Rows[0][0].ToString();
            con.Close();

            //response.AddHeader("Content-Disposition", "attachment;filename=\"" + Server.MapPath("~/Files/" + filePath) + "\"");
            response.AddHeader("Content-Disposition", "attachment;filename=" + filePath);
            //byte[] data = req.DownloadData(Server.MapPath("~/Files/" + filePath));
            response.TransmitFile(Server.MapPath("~/Back/Facturas/" + nombreProveedor + "/" + filePath));
            //response.BinaryWrite(data);
            response.End();
            BindGrid();
        }

        protected void btnAgregarFactura_Click(object sender, EventArgs e)
        {
            
            if (FileUpload1.HasFile)
            {
                string[] validFileTypes = {"zip", "rar"};
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
                    string nombre = cmbProveedoresAdd.SelectedValue.ToString();
                    string numFactura = txtNumFactura.Text.Trim();
                    string estatus = cmbStatus.SelectedValue.ToString();
                    string fechaLimite = dtpFechaPago.Text.Trim();
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName).Trim();
                    string fileLocation = Server.MapPath("~/Back/Facturas/" + nombre + "/" + fileName);
                    FileInfo fileInfo = new FileInfo(fileLocation);
                    if (!fileInfo.Exists)
                    {
                        FileUpload1.SaveAs(fileLocation);

                        //Create SQL Connection and Command to Save File name in DataBase

                    
                        string query = "INSERT INTO pagosPendientes (nombreProveedor, numeroFactura, estatusPago, fechaLimitePago, nombreFactura) VALUES(@nomProveedor, @numFac, @estatus, convert(date, @fechaPago, 105), @nomFac)";
                        string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            using (SqlCommand cmd = new SqlCommand(query))
                            {
                                cmd.Parameters.AddWithValue("@nomProveedor", nombre);
                                cmd.Parameters.AddWithValue("@numFac", numFactura);
                                cmd.Parameters.AddWithValue("@estatus", estatus);
                                cmd.Parameters.AddWithValue("@fechaPago", SqlDbType.SmallDateTime);
                                cmd.Parameters["@fechaPago"].Value = fechaLimite;
                                cmd.Parameters.AddWithValue("@nomFac", fileName);
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                        string script = @"alert('Se ha registrado correctamente la factura.');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                        CleartextBoxes(this);
                        this.BindGrid();
                    }
                }
                else
                {
                    string script = @"alert('Archivo invalido. Subir archivo con extension .zip o .rar');";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
            }

        }
    }
}