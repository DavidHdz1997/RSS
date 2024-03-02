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
    public partial class LogDoc : System.Web.UI.Page
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
                string sql = "SELECT * FROM usuariosDocs WHERE nombreCuenta = @user AND pwdUsuario = @pass";
                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@user", usuario); //enviamos los parametros
                cmd.Parameters.AddWithValue("@pass", password);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                conn.Close();
                if (count > 0)
                {
                    return dt;
                }
                else
                {
                    dt = null;
                    return dt;
                }

            }
        }

        protected void logIn_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = Autenticar(usuarioLogin.Text, txtPassword.Text);

            if (dt != null)
            {
                Session["nombreUsuarioDoc"] = dt.Rows[0][1].ToString();
                Session["nombreCuentaDoc"] = dt.Rows[0][2].ToString();
                //logIn.PostBackUrl = "~/AdminProveedores.aspx";
                if (dt.Rows[0][2].ToString() == "user")
                {
                    Session["rolDoc"] = "Usuario";
                }
                else
                {
                    Session["rolDoc"] = "Administrador";
                }
                Response.Redirect("AdminDocumentos.aspx");
                
            }
            else
            {
                string script = @"alert('Ha escrito mal su nombre o su contraseña, intente nuevamente.');
                            location.reload;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

        }
    }
}