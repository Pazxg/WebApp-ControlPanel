using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
namespace WebApp_ControlPanel.Dal
{
    public static class SqlCon
    {
     public static SqlConnection getconnect()
        {
           SqlConnection con = new SqlConnection(@"Data Source =DESKTOP-BN7K6JP\SQLEXPRESS; Initial Catalog=YönetimPaneli; Integrated Security=True");
           return con;
        }
    }
}