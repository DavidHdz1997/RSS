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
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static DataTable Autenticar(string usuario, string password)
        {
            //consulta a la base de datos
            
            //cadena conexion
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString()))
            {
                conn.Open();//abrimos conexion
                string sql = "SELECT * FROM Usuarios WHERE nombreCuenta = @user AND pwdUsuario = @pass";
                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@user", usuario); //enviamos los parametros
                cmd.Parameters.AddWithValue("@pass", password);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                conn.Close();
                if (count > 0) {
                    return dt;
                }
                else {
                    dt = null;
                    return dt;
                }
                
            }
        }

        protected void logIn_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = Autenticar(usuarioLogin.Text, txtPassword.Text);

            if (dt != null) { 
                if (dt.Rows[0][4].ToString() == "A")
                {
                    Session["nombreUsuario"] = dt.Rows[0][1].ToString();
                    Session["nombreCuenta"] = dt.Rows[0][2].ToString();
                    Session["rol"] = "Administrador";
                    //logIn.PostBackUrl = "~/AdminProveedores.aspx";
                    Response.Redirect("AdminProveedores.aspx");
                }
                else if (dt.Rows[0][4].ToString() == "USUARIO")
                {
                    Session["nombreUsuario"] = dt.Rows[0][1].ToString();
                    Session["nombreCuenta"] = dt.Rows[0][2].ToString();
                    Session["rol"] = "Usuario";

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString()))
                    {
                        conn.Open();//abrimos conexion
                        string sql = "SELECT telefonoContacto, correoContacto FROM Proveedores WHERE nombreProveedor = @nombreProveedor";
                        SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                        cmd.Parameters.AddWithValue("@nombreProveedor", Session["nombreUsuario"].ToString());
                        cmd.ExecuteScalar();
                        DataTable dt2 = new DataTable();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        adapter.Fill(dt2);
                        conn.Close();
                            Session["correo"] = dt2.Rows[0][1].ToString();
                            Session["telefono"] = dt2.Rows[0][0].ToString();
                    }

                    //logIn.PostBackUrl = "~/Reportes.aspx";
                    Response.Redirect("Reportes.aspx");
                }
                else
                {
                    string script = @"alert('Ha escrito mal su nombre o su contraseña, intente nuevamente.');
                            location.reload;";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
                
                
            }
            else {
                    string script = @"alert('Ha escrito mal su nombre o su contraseña, intente nuevamente.');
                            location.reload;";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
                
        }
    }
}