using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;

public partial class GetOrderList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "server = .; database = graduation_demo_01; User ID = sa; Password = 123456;";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            if (conn.State == ConnectionState.Open)
            {
                string UserID = Request.Params["UserID"];
                string IsPay = Request.Params["IsPay"];
                int Status =  Convert.ToInt32(Request.Params["Status"]);
                string sql_select = "";
                
                if( UserID != "" )
                {
                    sql_select = string.Format("select * from OrderInfo_demo02 where OrderOwnerID = '{0}' and IsPay = '{1}' and Status = '{2}' order by OrderTime desc", Convert.ToInt32(UserID), IsPay, Status );
                }
                else
                {
                    sql_select = string.Format("select * from OrderInfo_demo02 order by OrderTime desc");
                }
                
                DataSet ds = new DataSet();
                SqlDataAdapter sda = new SqlDataAdapter(sql_select, conn);
                sda.Fill(ds);
                string json = JsonConvert.SerializeObject(ds.Tables[0]);
                Response.Write(JsonConvert.DeserializeObject(json));
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
        finally
        {
            conn.Close();
        }
    }
}