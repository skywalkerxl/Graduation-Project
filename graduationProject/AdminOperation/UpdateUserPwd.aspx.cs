using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdminOperation_UpdateUserPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456 ";
        string UserID = Request.Params["UserID"];
        string UserPwd = Request.Params["UserPwd"];
        string sql_update = string.Format("update UserInfo set UserPwd = '{0}' where UserID = '{1}' ", UserPwd, UserID);

        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            if (conn.State == ConnectionState.Open)
            {
                SqlCommand cmd = new SqlCommand(sql_update, conn);
                int n = cmd.ExecuteNonQuery();
                if (n > 0)
                {
                    Response.Write("true");
                }
                else
                {
                    Response.Write("删除失败");
                }
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