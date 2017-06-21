using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public partial class GetGoodsList : System.Web.UI.Page
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
                string OrderID = Request.Params["OrderID"];
                //联合查询
                string sql_select = string.Format("select * from OrderDetails_demo01 o, GoodsInfo g where OrderID = '{0}' and o.GoodsID = g.GoodsID ", OrderID);
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