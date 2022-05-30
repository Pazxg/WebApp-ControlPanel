using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_ControlPanel.Model;
namespace WebApp_ControlPanel
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void GirisYap_Click(object sender, EventArgs e)
        {
            Kullanıcı Logger = new Kullanıcı();
            Logger.KullanıcıAdı = KullanıcıAdı.Text;
            Logger.Sifre = Sifre.Text;
            bool LoggerCont = Logger.GirisYap();
            //OTURUMU AÇ Defaulta git                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
            if (LoggerCont)
            {   
                //REDİRECT YÖNLENDİRME KOMUTU
                Session["KullanıcıAdı"] = Logger.KullanıcıAdı;   
                Response.Redirect("Default.aspx");
            }
            else
            {
                Labelx.Text = "Kullanıcı Adı veya Şifre Hatalı";
            }
        }
    }
}