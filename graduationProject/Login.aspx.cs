using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;


public partial class day5_Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //string dbUserName = "123";
        //string dbPassword = "123";
        string username = Request.Params["username"];
        string password = Request.Params["password"];

        string cs = "server =.; database = graduation_demo_01 ; User ID = sa ; Password = 123456;";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            if (conn.State == ConnectionState.Open)
            {
                string sql_select = string.Format("Select * from dbo.UserInfo where UserName = '{0}' and UserPwd = '{1}' and Status = '{2}'", username, password, 1);
                SqlDataAdapter sda = new SqlDataAdapter(sql_select, conn);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                //该用户不存在
                if( ds.Tables[0].Rows.Count == 0 )
                    Response.Write("false");
                //该用户为普通用户
                else if( ds.Tables[0].Rows[0][4].ToString() == "1" )
                    Response.Write("user|" + ds.Tables[0].Rows[0][0]);
                //该用户为管理员
                else if ( ds.Tables[0].Rows[0][4].ToString() == "2" )
                    Response.Write("admin|" + ds.Tables[0].Rows[0][0]);
            }
            else
            {
                Response.Write("数据库打开错误！");
            }
        }
        catch(Exception e1)
        {
            Response.Write(e1.Message.ToString());
        }
        finally
        {
            conn.Close();
            Response.End();
        }


        //if (username != null || password != null)
        //{
        //    Response.Write("你所使用的是" + Request.RequestType + "方式传送的姓名:" + username + "和密码:" + password);
        //}
        //else
        //{
        //    Response.Write("POST的数据为空");
        //}
        //if( dbUserName == username && dbPassword == password )
        //{
        //    Response.Write("true");
        //}
        //else
        //{
        //    Response.Write("false");
        //}
    }
    
}