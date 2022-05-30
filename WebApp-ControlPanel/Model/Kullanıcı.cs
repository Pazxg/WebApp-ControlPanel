using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using WebApp_ControlPanel.Dal;

namespace WebApp_ControlPanel.Model
{
    public class Kullanıcı
    {
        //getir ve götür
        public int Id { get; set; }
        public string KullanıcıAdı { get; set; }
        public string Sifre { get; set; }
        public string AdSoyad { get; set; }
        //giris yap kısmı 
        public bool GirisYap()
        {
            SqlConnection con = SqlCon.getconnect();
            SqlCommand cmd = new SqlCommand("Select * from  Kullanicii where KullaniciAdi=@kullanıcıadı and Sifre=@sifre", con);
            cmd.Parameters.AddWithValue("@kullanıcıadı", KullanıcıAdı);
            cmd.Parameters.AddWithValue("@sifre", Sifre);
            DataTable dt = new DataTable();
            con.Open();
            dt.Load(cmd.ExecuteReader());
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<Kullanıcı> KullanıcılarıGetir()
        {
            List<Kullanıcı> kullanıcılar = new List<Kullanıcı>();
            SqlConnection con = SqlCon.getconnect();
            SqlCommand cmd = new SqlCommand("Select * from Kullanicii where Silindi=0", con);
            DataTable dtKullanıcıList = new DataTable();
            con.Open();
            dtKullanıcıList.Load(cmd.ExecuteReader());
            foreach (DataRow dataRow in dtKullanıcıList.Rows)
            {
                kullanıcılar.Add(new Kullanıcı
                {
                    Id = Convert.ToInt32(dataRow["id"]),
                    KullanıcıAdı = dataRow["KullaniciAdi"].ToString(),
                    Sifre = dataRow["Sifre"].ToString(),
                    AdSoyad = dataRow["AdSoyad"].ToString()
                });
            }
            return kullanıcılar;
        }

        public bool KullaniciEkle()
        {
            try
            {
                SqlConnection con = SqlCon.getconnect();
                SqlCommand cmd = new SqlCommand("Insert into Kullanicii(KullaniciAdi,Sifre,AdSoyad) values(@kullanıcıadı,@sifre,@adsoyad)", con);
                cmd.Parameters.AddWithValue("@kullanıcıadı", KullanıcıAdı);
                cmd.Parameters.AddWithValue("@sifre", Sifre);
                cmd.Parameters.AddWithValue("@adsoyad", AdSoyad);
                DataTable dt = new DataTable();
                con.Open();
                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool KullaniciSil()
        {
            try
            {
                SqlConnection con = SqlCon.getconnect();
                SqlCommand cmd = new SqlCommand("Update Kullanicii set Silindi=1 where id=@id", con);
                cmd.Parameters.AddWithValue("@id", Id);


                con.Open();
                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public Kullanıcı KullaniciDetayGetir()
        {
            Kullanıcı kullanıcı = new Kullanıcı();
            SqlConnection con = SqlCon.getconnect();
            SqlCommand cmd = new SqlCommand("Select * from Kullanicii where Silindi=0 and id=@id", con);
            DataTable dKullanicii = new DataTable();
            cmd.Parameters.AddWithValue("@id", Id);
            con.Open();
            dKullanicii.Load(cmd.ExecuteReader());
            if (dKullanicii.Rows.Count > 0)
            {
                kullanıcı.AdSoyad = dKullanicii.Rows[0]["AdSoyad"].ToString();
                kullanıcı.KullanıcıAdı = dKullanicii.Rows[0]["KullaniciAdi"].ToString();
            }
            return kullanıcı;
        }

        public bool KullaniciGüncelle()
        {
            try
            {
                SqlConnection con = SqlCon.getconnect();
                SqlCommand cmd = new SqlCommand("Update Kullanicii set KullaniciAdi=@kullanıcıadı , AdSoyad=@adsoyad where id=@id", con);
                cmd.Parameters.AddWithValue("@kullanıcıadı", KullanıcıAdı);
                cmd.Parameters.AddWithValue("@adsoyad", AdSoyad);
                cmd.Parameters.AddWithValue("@id", Id);
                DataTable dt = new DataTable();
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch(Exception)
            
            {
                return false;
            }

        }

    }

}