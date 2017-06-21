using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class GoPay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Request.Params["username"];//获取用户名
        string password = Request.Params["password"];//获取密码
        string OrderID = Request.Params["oid"]; //获取前台传来的订单号
        string sp = Request.Params["sp"];//获取支付额度
        string PayStatus = "true";//定义支付状态
        int OrderStatus = 2;
        int status = 1;

        string cs = "server =.; database = graduation_demo_01 ; User ID = sa ; Password = 123456;";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            if (conn.State == ConnectionState.Open)
            {
                string sql_select = string.Format("Select * from dbo.PayUserInfo where UserName = '{0}' and Password = '{1}' and Status = '{2}'", username, password, status);
                SqlDataAdapter sda = new SqlDataAdapter(sql_select, conn);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                //if 该用户不存在
                if (ds.Tables[0].Rows.Count == 0){
                    Response.Write("false");
                }
                else
                {
                    string sql = string.Format("update OrderInfo_demo02 set IsPay = '{0}',Status = '{1}' where OrderID = '{2}' ", PayStatus, OrderStatus, OrderID);
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    int k = cmd.ExecuteNonQuery(); //k接收影响行数，k>0表示修改成功
                    if (k > 0)
                    {
                        Response.Write("true");
                    }
                    else
                    {
                        Response.Write("修改订单表错误");
                    }
                }
            }
            else
            {
                Response.Write("数据库打开错误！");
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message.ToString());
        }
        finally
        {
            conn.Close();
            Response.End();
        }
    }
}