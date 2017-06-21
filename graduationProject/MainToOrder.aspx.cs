using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;
using com.force.json;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string OrderOwnerID = Request.Params["UserID"]; // 获取前台传来的用户id
        object obj = JsonConvert.DeserializeObject(Request.Params["AGoodsID"]); 
        string str = JsonConvert.SerializeObject(obj);
        JSONArray jar = new JSONArray(str);

        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456 ;";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            /*
                Windows 文件时间是一个 64 位值，它表示自协调世界时 (UTC) 公元 (C.E.) 1601 年 1 月 1 日午夜 12:00 以来已经过的 间隔数（以 100 纳秒为一个间隔）。 
                获取windows文件时间作为订单编号，这个编号不会重复
             */

            string OrderID = DateTime.Now.ToFileTime().ToString(); 

            if (conn.State == ConnectionState.Open)
            {
                /* 向订单表中添加数据 */
                string sql_insert_order =string.Format( "insert into OrderInfo_demo02(OrderID,OrderOwnerID,OrderTime,IsPay,Status) values (@OrderID,@OrderOwnerID,@OrderTime,@IsPay,@Status)");
                SqlCommand cmd = new SqlCommand(sql_insert_order, conn);
                cmd.Parameters.Add(new SqlParameter("@OrderID", OrderID));
                cmd.Parameters.Add(new SqlParameter("@OrderOwnerID", OrderOwnerID));
                cmd.Parameters.Add(new SqlParameter("@OrderTime", DateTime.Now.ToString() ));
                cmd.Parameters.Add(new SqlParameter("@IsPay", "false"));
                cmd.Parameters.Add(new SqlParameter("@Status", 1));

                int n = cmd.ExecuteNonQuery();
                if (n <= 0)
                {
                    Response.Write("订单表插入失败");
                }
                /* 向订单详情表中添加数据 */
                string sql_insert_details = string.Format("insert into OrderDetails_demo01(OrderID, GoodsID) values (@OrderID, @GoodsID)");
                int m = 0;
                for (int i = 0; i < jar.length(); i++)
                { 
                    SqlCommand cmd_details = new SqlCommand(sql_insert_details, conn);
                    cmd_details.Parameters.Add(new SqlParameter("@OrderID", OrderID));
                    cmd_details.Parameters.Add(new SqlParameter("@GoodsID", jar.getJSONObject(i).getString("GoodsID")));
                    m = cmd_details.ExecuteNonQuery();
                    if (m <= 0)
                    {
                        Response.Write("订单详情表插入失败");
                    }
                }
                if( m > 0 && n > 0 )
                {
                    Response.Write("true");
                }
                
                


            }
            
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
        finally {
            conn.Close();
        }
        
        


    }

    private Array Array(string str_GoodsID)
    {
        throw new NotImplementedException();
    }
    //Response.Write(jar.length().ToString());
    //Response.Write(jar.getJSONObject(0).getString("GoodsID"));
    //Response.Write(jar.getJSONObject(1).getString("GoodsID"));

    //Array arr = 
    //JArray jr = new JArray()
    //;
    //Response.Write(  );
    //JSONObject jobj = (JSONObject)JsonConvert.DeserializeObject(Request.Params["AGoodsID"]);
    //JSONArray jar = (JSONArray)JsonConvert.DeserializeObject(Request.Params["AGoodsID"]);
    //jar.put(jobj);
    //Response.Write(jar.length());
    //object obj = JsonConvert.DeserializeObject(str_GoodsID);
    //JsonConvert.p;
    //JSONObject jobj = (JSONObject)obj;
    //JSONArray Jarr = new JSONArray();
    //Jarr.put(jobj);
    //Response.Write(Jarr.length());
    //JSONArray Arr_GoodsID = (JSONArray)JsonConvert.DeserializeObject(str_GoodsID);
    //Response.Write(Arr_GoodsID);
    //JSONObject jso = (JSONObject)JsonConvert.DeserializeObject(Request.Params["AGoodsID"]);
    //jso.put(JsonConvert.DeserializeObject(Request.Params["AGoodsID"]));
    //Arr_GoodsID.put( JsonConvert.DeserializeObject(Request.Params["AGoodsID"]) );

    //Response.Write(JsonConvert.DeserializeObject(Request.Params["AGoodsID"]));
    //Response.Write( jso);
    //Object  ArrGoodsID = ;
    //Response.Write( );
}