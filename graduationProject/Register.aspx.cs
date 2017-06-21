using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456; ";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            string username = Request.Params["username"];//获取前台传来的用户名
            string password = Request.Params["password"];//获取前台传来的密码

            if (conn.State == ConnectionState.Open)
            {
                string sql_select_user = string.Format("select count(*) from UserInfo where UserName = '{0}' and Status = '{1}'", username, 1);
                SqlCommand cmd_select = new SqlCommand(sql_select_user, conn);
                int n = Convert.ToInt32( cmd_select.ExecuteScalar() );
                //判断用户是否已经存在
                if (n > 0)
                {
                    Response.Write("repetition");
                }
                //执行添加用户操作
                else
                {
                    string sql_insert_user = string.Format(" insert into UserInfo(UserName,UserPwd,HeadPhoto,Power,Status) values (@UserName,@UserPwd,@HeadPhoto,@Power,@Status) ");
                    SqlCommand cmd_insert = new SqlCommand(sql_insert_user, conn);
                    cmd_insert.Parameters.Add(new SqlParameter("@UserName", username));
                    cmd_insert.Parameters.Add(new SqlParameter("@UserPwd", password));
                    cmd_insert.Parameters.Add(new SqlParameter("@HeadPhoto", "img/UserInfo/xl.jpg"));
                    cmd_insert.Parameters.Add(new SqlParameter("@Power", 1));
                    cmd_insert.Parameters.Add(new SqlParameter("@Status", 1));
                    int m = cmd_insert.ExecuteNonQuery();
                    if (m > 0)
                    {
                        string sql_getUserID = string.Format("select * from UserInfo where UserName = '{0}' and Status = '{1}'", username, 1);
                        SqlDataAdapter sda = new SqlDataAdapter(sql_getUserID, conn);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        //判断用户是否已经存在
                        if( ds.Tables[0].Rows.Count > 0 )
                        {
                            Response.Write("true|" + ds.Tables[0].Rows[0][0]);
                        }else{
                            Response.Write("false");
                        }
                    }
                    else
                    {
                        Response.Write("false");
                    }
                }
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message.ToString());
        }
        finally {
            conn.Close();
        }
    }
}