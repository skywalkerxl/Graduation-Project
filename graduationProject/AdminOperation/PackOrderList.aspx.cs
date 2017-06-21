using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminOperation_PackOrderList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456; ";
        string OrderID = Request.Params["OrderID"];
        int status = Convert.ToInt32( Request.Params["Status"] );
        string sql = string.Format("update OrderInfo_demo02 set Status = '{0}' where OrderID = '{1}' ", status, OrderID);
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(sql, conn);

            try
            {
                conn.Open();
                int k = cmd.ExecuteNonQuery();//n接收影响行数，n>0表示修改成功

                if (k > 0)
                {
                    Response.Write("true");
                }
                else
                {
                    Response.Write("删除失败");
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