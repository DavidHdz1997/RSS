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
    public partial class AdminProveedores : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlCommand cmd2;
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
                    llenarCombo();
                    if (btnModificarProveedor.Enabled)
                        btnModificarProveedor.Enabled = false;

                }
            }
                
            
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

        protected void btnGuardarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                con.Open();

                cmd = new SqlCommand("INSERT INTO USUARIOS (nombreUsuario, nombreCuenta, pwdUsuario, rolCuenta) VALUES (@nombreUsuario, @nombreCuenta, @pwd, @rol)", con);

                cmd.Parameters.AddWithValue("@nombreUsuario", txtNombreProveedor.Text.ToUpper().Trim());
                cmd.Parameters.AddWithValue("@nombreCuenta", txtNombreCuenta.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@rol", "USUARIO");
                cmd.ExecuteNonQuery();

                string nombreProveedor = txtNombreProveedor.Text.ToUpper().Trim();

                string folderPath = Server.MapPath("~/Back/Reportes/" + nombreProveedor + "/");
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);
                }

                string pathFacturas = Server.MapPath("~/Back/Facturas/" + nombreProveedor + "/");
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(pathFacturas))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(pathFacturas);
                }

                string pathCotizaciones = Server.MapPath("~/Back/Cotizaciones/" + nombreProveedor + "/");
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(pathCotizaciones))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(pathCotizaciones);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
            }

            /////////////////////////////

            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                con.Open();

                cmd2 = new SqlCommand("INSERT INTO PROVEEDORES (nombreProveedor, nombreContacto, telefonoContacto, correoContacto, direccion, ciudad, estado, pais) " + 
                                      "VALUES (@nombreProveedor, @contacto, @telefono, @correo, @direccion, @ciudad, @estado, @pais)", con);

                cmd2.Parameters.AddWithValue("@nombreProveedor", txtNombreProveedor.Text.ToUpper().Trim());
                cmd2.Parameters.AddWithValue("@contacto", txtContactoProveedor.Text.Trim());
                cmd2.Parameters.AddWithValue("@telefono", txtTelefonoProveedor.Text.Trim());
                cmd2.Parameters.AddWithValue("@correo", txtCorreoProveedor.Text.Trim());
                cmd2.Parameters.AddWithValue("@direccion", txtDireccion.Text.Trim());
                cmd2.Parameters.AddWithValue("@ciudad", txtCiudad.Text.Trim());
                cmd2.Parameters.AddWithValue("@estado", txtEstado.Text.Trim());
                cmd2.Parameters.AddWithValue("@pais", txtPais.Text.Trim());
                cmd2.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
                
            }
            string script = @"alert('Se ha registrado correctamente el proveedor.');";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            CleartextBoxes(this);
            llenarCombo();
            txtNombreProveedor.Focus();
        }

        protected void cerrarSesion_Click(Object sender, EventArgs e)
        {
            Session["nombreCuenta"] = null;
            Session["rol"] = null;
            Session["nombreUsuario"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void buscarCombo()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString()))
            {
                conn.Open();//abrimos conexion
                string sql = "SELECT TOP 1 * FROM PROVEEDORES WHERE nombreProveedor = @proveedor";
                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@proveedor", cmbProveedores.SelectedValue.ToString()); //enviamos los parametros
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtNombreProveedor.Text = reader["nombreProveedor"].ToString().Trim();
                    txtContactoProveedor.Text = reader["nombreContacto"].ToString().Trim();
                    txtTelefonoProveedor.Text = reader["telefonoContacto"].ToString().Trim();
                    txtCorreoProveedor.Text = reader["correoContacto"].ToString().Trim();
                    txtDireccion.Text = reader["direccion"].ToString().Trim();
                    txtCiudad.Text = reader["ciudad"].ToString().Trim();
                    txtEstado.Text = reader["estado"].ToString().Trim();
                    txtPais.Text = reader["pais"].ToString().Trim();
                }

                reader.Close();

                /////////////////   

                string sql2 = "SELECT TOP 1 * FROM USUARIOS WHERE nombreUsuario = @proveedor";
                SqlCommand cmd2 = new SqlCommand(sql2, conn); //ejecutamos la instruccion
                cmd2.Parameters.AddWithValue("@proveedor", cmbProveedores.SelectedValue.ToString()); //enviamos los parametros
                reader = cmd2.ExecuteReader();

                if (reader.Read())
                {
                    txtNombreCuenta.Text = reader["nombreCuenta"].ToString().Trim();
                    txtPassword.Text = reader["pwdUsuario"].ToString().Trim();
                }

                reader.Close();
            }
        }

        protected void btnBuscarProveedor_Click(object sender, EventArgs e)
        {
            buscarCombo();

            if (txtNombreProveedor.Enabled)
                txtNombreProveedor.Enabled = false;

            if (txtNombreCuenta.Enabled)
                txtNombreCuenta.Enabled = false;

            if (btnGuardarProveedor.Enabled)
                btnGuardarProveedor.Enabled = false;

            if (!btnModificarProveedor.Enabled)
                btnModificarProveedor.Enabled = true;

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

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            if (!txtNombreProveedor.Enabled)
                txtNombreProveedor.Enabled = true;

            if (!txtNombreCuenta.Enabled)
                txtNombreCuenta.Enabled = true;

            if (!btnGuardarProveedor.Enabled)
                btnGuardarProveedor.Enabled = true;

            if (btnModificarProveedor.Enabled)
                btnModificarProveedor.Enabled = false;

            CleartextBoxes(this);
            txtNombreProveedor.Focus();
        }

        protected void btnModificarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                con.Open();

                cmd = new SqlCommand("UPDATE USUARIOS SET pwdUsuario = @pwd WHERE nombreUsuario = @nombreUsuario", con);

                cmd.Parameters.AddWithValue("@pwd", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@nombreUsuario", txtNombreProveedor.Text.ToUpper().Trim());
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
            }

            /////////////////////////////

            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
                con.Open();

                cmd2 = new SqlCommand("UPDATE PROVEEDORES SET nombreContacto = @contacto, telefonoContacto = @telefono, correoContacto = @correo, direccion = @direccion, ciudad = @ciudad, " + 
                                      "estado = @estado, pais = @pais WHERE nombreProveedor = @nombreProveedor", con);
                
                cmd2.Parameters.AddWithValue("@contacto", txtContactoProveedor.Text.Trim());
                cmd2.Parameters.AddWithValue("@telefono", txtTelefonoProveedor.Text.Trim());
                cmd2.Parameters.AddWithValue("@correo", txtCorreoProveedor.Text.Trim());
                cmd2.Parameters.AddWithValue("@direccion", txtDireccion.Text.Trim());
                cmd2.Parameters.AddWithValue("@ciudad", txtCiudad.Text.Trim());
                cmd2.Parameters.AddWithValue("@estado", txtEstado.Text.Trim());
                cmd2.Parameters.AddWithValue("@pais", txtPais.Text.Trim());
                cmd2.Parameters.AddWithValue("@nombreProveedor", txtNombreProveedor.Text.ToUpper().Trim());
                cmd2.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                buscarCombo();
                con.Close();
            }
            string script = @"alert('Se ha modificado correctamente el proveedor.');";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
        }
    }
}