using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_ControlPanel.Model;

namespace WebApp_ControlPanel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //OTURUMU AÇ VE DENGELE
            if(Session["KullanıcıAdı"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
               LoggerKullanıcıAdı.Text = Session["KullanıcıAdı"].ToString();
            }
        }
        protected void CıkısYap_Click(object sender, EventArgs e)
        {
            Session.Abandon();//Tumden sert Cıkıs,Daha Guvenılır.
            Response.Redirect("Login.aspx");//Cıkıs Sonrası Logın Sayfasına Yonlendırme.
           //CIKIS ICIN KULLANILABILECEKLER
            //Session.RemoveAll();
             //Session.Clear();    
        } 
        
        [WebMethod]
        public static string KullanıcılarıGetir()
        {
            Kullanıcı kullanıcı = new Kullanıcı();
            return JsonConvert.SerializeObject(kullanıcı.KullanıcılarıGetir());
        }

        [WebMethod]
        public static string KullaniciEkle(string kullaniciadi, string sifre, string adsoyad)
        {
            Kullanıcı kullanıcı = new Kullanıcı();
            kullanıcı.AdSoyad = adsoyad;
            kullanıcı.Sifre = sifre;
            kullanıcı.KullanıcıAdı = kullaniciadi;
            return JsonConvert.SerializeObject(kullanıcı.KullaniciEkle());
        }

        [WebMethod]
        public static string KullaniciSil(int id)
        {
            Kullanıcı kullanıcı = new Kullanıcı();
            
            kullanıcı.Id = id;
            return JsonConvert.SerializeObject(kullanıcı.KullaniciSil());
        }

        [WebMethod]
        public static string KullaniciDetayGetir(int id)
        {
            Kullanıcı kullanıcı = new Kullanıcı();

            kullanıcı.Id = id;
            return JsonConvert.SerializeObject(kullanıcı.KullaniciDetayGetir());
        }

        [WebMethod]
        public static string KullaniciDuzenle(int id, string kullaniciadi, string adsoyad)
        {
            Kullanıcı kullanıcı = new Kullanıcı();
            kullanıcı.Id = id;
            kullanıcı.AdSoyad = adsoyad;
            kullanıcı.KullanıcıAdı = kullaniciadi;
            return JsonConvert.SerializeObject(kullanıcı.KullaniciGüncelle());
        }

    }
}
