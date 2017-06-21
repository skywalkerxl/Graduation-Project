using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public partial class mianInterfaceGoodsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string GCid = Request.Params["GoodsClassID"];
        string IsRe = "True";
        string cs = "server = .; database = graduation_demo_01; User ID = sa; Password = 123456";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            if (conn.State == ConnectionState.Open)
            {
                string sql_GoodsList = string.Format("select * from dbo.GoodsInfo where IsRecommended = '{0}' and GoodsClassID = '{1}'",IsRe,GCid);
                DataSet ds = new DataSet();
                SqlDataAdapter sda = new SqlDataAdapter(sql_GoodsList, conn);
                sda.Fill(ds);

                string json = JsonConvert.SerializeObject(ds.Tables[0]);
                Response.Write(JsonConvert.DeserializeObject(json));

            }
            else
            {
                Response.Write("数据库打开失败");
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
        finally {
            conn.Close();
        }
        
        //Response.Write("成功了！" + GCid + "success!");
        //Response.Write(GCid);
    }
}