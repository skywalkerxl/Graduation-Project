using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Paysuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456; ";
        string OrderID = Request.Params["OrderID"]; //获取前台传来的订单号
        string sp = Request.Params["sp"];
        string PayStatus = "true";

        string sql = string.Format("update OrderInfo_demo02 set IsPay = '{0}' where OrderID = '{1}' ", PayStatus, OrderID);
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(sql, conn);

            try
            {
                conn.Open();
                int k = cmd.ExecuteNonQuery();//k接收影响行数，k>0表示修改成功

                if (k > 0)
                {
                    Response.Write("true");
                }
                else
                {
                    Response.Write("false");
                }

            }
            catch (Exception e1)
            {
                Response.Write(e1.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

        }
    }
}