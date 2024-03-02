using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BackRSS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string puesto = "";

        protected void btnPost1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile == false)
            {
                string script = @"alert('No adjunto su CV. Intentelo nuevamente.');
                            window.location.hostname;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
            else {
                string[] validFileTypes = { "pdf", "doc", "docx" };
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
                    puesto = "Inspector de Calidad";
                    UploadFile(1);
                    EnviarCorreo(1);
                    string script = @"alert('CV enviado a recursos humanos satisfactoriamente.');
                            window.location.hostname;";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    txtNombre1.Text = "";
                    txtEmail1.Text = "";
                    FileUpload1.Dispose();
                    FileUpload1.FileContent.Close();
                }
                else
                {
                    string script = @"alert('Archivo invalido. Subir CV con extension .doc, .docx o .pdf');
                            window.location.hostname;";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
                btnPost1.Enabled = true;
            }
        }

        protected void btnPost2_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile == false)
            {
                string script = @"alert('No adjunto su CV. Intentelo nuevamente.');
                            window.location.hostname;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
            else
                {
                    string[] validFileTypes = { "pdf", "doc", "docx" };
                string ext = System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName);
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
                    puesto = "Tecnico en ESD";
                    UploadFile(2);
                    EnviarCorreo(2);
                
                    string script = @"alert('CV enviado a recursos humanos satisfactoriamente.');
                            window.location.href='Default.aspx';";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    txtNombre2.Text = "";
                    txtEmail2.Text = "";
                    FileUpload2.Dispose();
                    FileUpload2.FileContent.Close();
                }
                else
                {
                    string script = @"alert('Archivo invalido. Subir CV con extension .doc, .docx o .pdf');
                            window.location.href='Default.aspx';";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
                btnPost2.Enabled = true;
            }
        }

        protected void btnPost3_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile == false)
            {
                string script = @"alert('No adjunto su CV. Intentelo nuevamente.');
                            window.location.hostname;";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
            else
                {
                    string[] validFileTypes = { "pdf", "doc", "docx" };
                string ext = System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName);
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
                    puesto = "Supervisor de Calidad";
                    UploadFile(3);
                    EnviarCorreo(3);
                    string script = @"alert('CV enviado a recursos humanos satisfactoriamente.');
                            window.location.href='Default.aspx';";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    txtNombre3.Text = "";
                    txtEmail3.Text = "";
                    FileUpload3.Dispose();
                    FileUpload3.FileContent.Close();
                }
                else
                {
                    string script = @"alert('Archivo invalido. Subir CV con extension .doc, .docx o .pdf');
                            window.location.href='Default.aspx';";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
                btnPost3.Enabled = true;
            }
        }

        public void EnviarCorreo(int flag)
        {
            /*-------------------------MENSAJE DE CORREO----------------------*/

            //Creamos un nuevo Objeto de mensaje
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            //Direccion de correo electronico a la que queremos enviar el mensaje
            mmsg.To.Add("faguilar@rsssacv.com");

            //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

            //Asunto
            mmsg.Subject = "CV";
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

            ////Direccion de correo electronico que queremos que reciba una copia del mensaje
            //mmsg.Bcc.Add("destinatariocopia@servidordominio.com"); //Opcional

            //Cuerpo del Mensaje
           
            if (flag == 1)
            {
                mmsg.Body = "Nombre del postulante: " + txtNombre1.Text + "\n" + "Correo para contactarlo: " + txtEmail1.Text + "\n" + "Numero para contactarlo: " + txtCelular1.Text + "\n" +
               "Puesto Deseado: " + puesto;
                mmsg.BodyEncoding = System.Text.Encoding.UTF8;
                mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML
                string path = (Server.MapPath("~/Front/Files/" + Path.GetFileName(FileUpload1.FileName)));
                mmsg.Attachments.Add(new Attachment(path));
            }
            if (flag == 2)
            {
                mmsg.Body = "Nombre del postulante: " + txtNombre2.Text + "\n" + "Correo para contactarlo: " + txtEmail2.Text + "\n" + "Numero para contactarlo: " + txtCelular2.Text + "\n" +
               "Puesto Deseado: " + puesto;
                mmsg.BodyEncoding = System.Text.Encoding.UTF8;
                mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML
                string path = (Server.MapPath("~/Front/Files/" + Path.GetFileName(FileUpload2.FileName)));
                mmsg.Attachments.Add(new Attachment(path));
            }
            if (flag == 3)
            {
                mmsg.Body = "Nombre del postulante: " + txtNombre3.Text + "\n" + "Correo para contactarlo: " + txtEmail3.Text + "\n" + "Numero para contactarlo: " + txtCelular3.Text + "\n" +
               "Puesto Deseado: " + puesto;
                mmsg.BodyEncoding = System.Text.Encoding.UTF8;
                mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML
                string path = (Server.MapPath("~/Front/Files/" + Path.GetFileName(FileUpload3.FileName)));
                mmsg.Attachments.Add(new Attachment(path));
            }
            //Correo electronico desde la que enviamos el mensaje
            mmsg.From = new System.Net.Mail.MailAddress("davidhsoni42@gmail.com");


            /*-------------------------CLIENTE DE CORREO----------------------*/

            //Creamos un objeto de cliente de correo
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials = new System.Net.NetworkCredential("davidhsoni42@gmail.com", "1656645101297");

            cliente.Port = 587; //465; //587 //25
            cliente.EnableSsl = true;
            cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";


            /*-------------------------ENVIO DE CORREO----------------------*/

            try
            {
                //Enviamos el mensaje      
                cliente.Send(mmsg);
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                string script = @"alert('Hubo un error al enviar su CV. Intente de nuevo mas tarde.');
                        window.location.href='Default.aspx';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

        }

        public void UploadFile(int flag)
        {
            string folderPath = Server.MapPath("~/Front/Files/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            if (flag == 1)
            {
                //Save the File to the Directory (Folder).
                FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            }

            if (flag == 2)
            {
                //Save the File to the Directory (Folder).
                FileUpload2.SaveAs(folderPath + Path.GetFileName(FileUpload2.FileName));

            }

            if (flag == 3)
            {
                //Save the File to the Directory (Folder).
                FileUpload3.SaveAs(folderPath + Path.GetFileName(FileUpload3.FileName));

            }

        }

        public void EnviarCorreoSugerencias()
        {
            /*-------------------------MENSAJE DE CORREO----------------------*/

            //Creamos un nuevo Objeto de mensaje
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            //Direccion de correo electronico a la que queremos enviar el mensaje
            mmsg.To.Add("faguilar@rsssacv.com");

            //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

            //Asunto
            mmsg.Subject = "Sugerencias";
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

            ////Direccion de correo electronico que queremos que reciba una copia del mensaje
            //mmsg.Bcc.Add("destinatariocopia@servidordominio.com"); //Opcional

            //Cuerpo del Mensaje
            
            mmsg.Body = "Nombre: " + txtNombreBS.Text + "\n" + "Correo: " + txtEmailBS.Text + "\n" + "Sugerencia: " + txtComentario.Text;
            mmsg.BodyEncoding = System.Text.Encoding.UTF8;
            mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML
           
            //Correo electronico desde la que enviamos el mensaje
            mmsg.From = new System.Net.Mail.MailAddress("davidhsoni42@gmail.com");

            /*-------------------------CLIENTE DE CORREO----------------------*/

            //Creamos un objeto de cliente de correo
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials = new System.Net.NetworkCredential("davidhsoni42@gmail.com", "1656645101297");

            cliente.Port = 587; //465; //587 //25
            cliente.EnableSsl = true;
            cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";

            /*-------------------------ENVIO DE CORREO----------------------*/

            try
            {
                //Enviamos el mensaje      
                cliente.Send(mmsg);
                string script = @"alert('Sugerencia enviada a recursos humanos satisfactoriamente.');
                            window.location.href='Default.aspx';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                txtComentario.Text = "";
                txtNombreBS.Text = "";
                txtEmailBS.Text = "";
                btnEnviarSugerencia.Enabled = true;
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                string script = @"alert('Hubo un error al enviar su sugerencia. Intente de nuevo mas tarde.');
                        window.location.href='Default.aspx';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

        }

        protected void btnEnviarSugerencia_Click(object sender, EventArgs e)
        {
            EnviarCorreoSugerencias();
        }

        public void EnviarCorreoContacto()
        {
            /*-------------------------MENSAJE DE CORREO----------------------*/

            //Creamos un nuevo Objeto de mensaje
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            //Direccion de correo electronico a la que queremos enviar el mensaje
            mmsg.To.Add("faguilar@rsssacv.com");

            //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

            //Asunto
            mmsg.Subject = "Contacto";
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

            ////Direccion de correo electronico que queremos que reciba una copia del mensaje
            //mmsg.Bcc.Add("destinatariocopia@servidordominio.com"); //Opcional

            //Cuerpo del Mensaje

            mmsg.Body = "Nombre: " + txtNombreContacto.Text + "\n" + "Correo: " + txtEmailContacto.Text + "\n" + "Numero para contacto: " + txtNumeroContacto.Text + "\n" + "Mensaje: " + txtComentarioContacto.Text;
            mmsg.BodyEncoding = System.Text.Encoding.UTF8;
            mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML

            //Correo electronico desde la que enviamos el mensaje
            mmsg.From = new System.Net.Mail.MailAddress("davidhsoni42@gmail.com");

            /*-------------------------CLIENTE DE CORREO----------------------*/

            //Creamos un objeto de cliente de correo
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials = new System.Net.NetworkCredential("davidhsoni42@gmail.com", "1656645101297");

            cliente.Port = 587; //465; //587 //25
            cliente.EnableSsl = true;
            cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";

            /*-------------------------ENVIO DE CORREO----------------------*/

            try
            {
                //Enviamos el mensaje      
                cliente.Send(mmsg);
                string script = @"alert('Gracias por contactarnos. En breve nos pondremos en contacto con usted.');
                            window.location.href='Default.aspx';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                
                btnContacto.Enabled = true;
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                string script = @"alert('Hubo un error al enviar su mensaje. Intente de nuevo mas tarde o envie un mensaje al siguiente correo: faguilar@rsssacv.com');
                        window.location.href='Default.aspx';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

        }


        protected void btnContacto_Click(object sender, EventArgs e)
        {
            EnviarCorreoContacto();
        }
    }
}