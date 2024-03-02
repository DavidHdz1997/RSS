using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;

namespace BackRSS
{
    public partial class AdminDocumentos : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubirDocumento.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false");
            if (!this.IsPostBack)
            {
                if (Session["nombreCuentaDoc"] == null)
                {
                    Response.Redirect("LogDoc.aspx");
                }
                else
                {
                    if (Session["nombreUsuarioDoc"] != null)
                    {
                        Label1.Text = Session["nombreUsuarioDoc"].ToString();
                    }
                    if (Session["rolDoc"].ToString() == "Usuario")
                    {
                        gvFiles.Columns[6].Visible = false;
                        gvFiles.Columns[7].Visible = false;
                        Label2.Text = "Usuario";
                    }
                    BindFiles();
                }

            }
        }

        private void BindFiles()
        {
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter da = new SqlDataAdapter("SELECT [ID], [FileName], [subidoPor], CONVERT(NVARCHAR(10), [fechaSubido], 105) + ' ' + convert(NVARCHAR(8), [fechaSubido], 14) as fechaSubido, [modificadoPor], CONVERT(NVARCHAR(10), [fechaModificado], 105) + ' ' + convert(NVARCHAR(8), [fechaModificado], 14) as fechaModificado FROM [rsstest].[dbo].[FILES] ORDER BY 6 DESC", con);
            con.Open();                                                                     
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvFiles.DataSource = dt;
            gvFiles.DataBind();
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session["nombreCuentaDoc"] = null;
            Session["nombreUsuarioDoc"] = null;
            Response.Redirect("LogDoc.aspx");
        }

        protected void btnCargarDocumentos_Click(object sender, EventArgs e)
        {
            if (Session["rolDoc"].ToString() == "Usuario")
            {
                string script = @"alert('Usted no tiene permisos para subir documentos.');
                            location.reload;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fileLocation = Server.MapPath("~/Files/" + fileName);
                    FileInfo fileInfo = new FileInfo(fileLocation);
                    if (!fileInfo.Exists)
                    {
                        FileUpload1.SaveAs(fileLocation);

                        //Create SQL Connection and Command to Save File name in DataBase

                        SqlConnection sqlCon = new SqlConnection(str);
                        string strInsert = "INSERT INTO Files (FileName, subidoPor, modificadoPor) VALUES (@FileName, @subido, @modificado)";
                        SqlCommand command = new SqlCommand(strInsert, sqlCon);
                        command.Parameters.AddWithValue("@FileName", fileName);
                        command.Parameters.AddWithValue("@subido", Session["nombreUsuarioDoc"]);
                        command.Parameters.AddWithValue("@modificado", Session["nombreUsuarioDoc"]);
                        sqlCon.Open();
                        int result = command.ExecuteNonQuery();
                        sqlCon.Close();
                        BindFiles();
                    }
                    else
                    {
                        string script = @"alert('El archivo que intenta subir ya existe.');
                            location.reload;";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    }
                }
            }
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFiles.EditIndex = -1;
            BindFiles();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
                gvFiles.EditIndex = e.NewEditIndex;
                BindFiles();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GridViewRow row = gvFiles.Rows[e.RowIndex];
            int id = Convert.ToInt32((row.FindControl("lblId") as Label).Text);
            string fileName = (row.FindControl("lblFile") as Label).Text;
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("DELETE FROM Files WHERE ID = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
            string file = Server.MapPath("~/Files/" + fileName);
            if (fileName != null || fileName != string.Empty)
            {
                if (File.Exists(file))
                {
                    File.Delete(file);
                }
            }
            BindFiles();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["rolDoc"].ToString() == "Usuario")
            {
                string script = @"alert('Usted no tiene permisos para modificar documentos.');
                            location.reload;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
            else
            {
                GridViewRow row = gvFiles.Rows[e.RowIndex];
                int id = Convert.ToInt32((row.FindControl("lblId") as Label).Text);
                string fileName = (row.FindControl("lblEditFile") as Label).Text;
                FileUpload file = row.FindControl("fuEditFile") as FileUpload;
                string fileNameU = string.Empty;
                if (file.HasFile)
                {
                    fileNameU = file.FileName;
                    if (fileName == fileNameU)
                    {
                        file.SaveAs(Server.MapPath("~/Files/") + fileNameU);
                        SqlConnection con = new SqlConnection(str);
                        SqlCommand cmd = new SqlCommand("UPDATE Files SET FileName = @File, modificadoPor = @modificadoPor, fechaModificado = GETDATE() WHERE ID = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.Parameters.AddWithValue("@File", fileName);
                        cmd.Parameters.AddWithValue("@modificadoPor", Session["nombreUsuarioDoc"]);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        gvFiles.EditIndex = -1;
                        BindFiles();
                    }
                    else
                    {
                        string script = @"alert('El archivo que intenta subir es distinto al guardado. Debe subirlo como nuevo archivo.');
                            location.reload;";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    }
                }
            }
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
            response.TransmitFile(Server.MapPath("~/Files/" + filePath));
            //response.BinaryWrite(data);
            response.End();
            BindFiles();
        }

        protected void gvFiles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gvFiles.EditIndex)
            {
                //(e.Row.Cells[6].Controls[0] as LinkButton).Visible = false;
                LinkButton lbtD = (LinkButton)e.Row.FindControl("lnkDownload");
                lbtD.Visible = false;
            }

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gvFiles.EditIndex)
            {
                (e.Row.Cells[7].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('¿Quieres eliminar este documento? No podras verlo de nuevo.');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gvFiles.PageIndex = e.NewPageIndex;
            BindFiles();
        }
    }
}