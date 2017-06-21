using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public partial class mainInterfaceDefault01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456;";
        SqlConnection conn = new SqlConnection(cs);
        try {
            conn.Open();
            if (conn.State == ConnectionState.Open)
            {
                string sql_GoodsClass = "select * from dbo.GoodsClassInfo_02 where Isdelete = 0"; //1表示该分类已经被删除
                SqlDataAdapter sda = new SqlDataAdapter(sql_GoodsClass, conn);
                DataSet ds = new DataSet();
                DataTable dt = new DataTable(sql_GoodsClass);
                sda.Fill(ds);
                //string msg = "{ 'message' : '数据库连接成功！'}";
                string json = JsonConvert.SerializeObject(ds.Tables[0]);//
                Response.Write( JsonConvert.DeserializeObject(json)  );
            }
            else {
                Response.Write("数据库打开错误！");
            }
        }
        catch(Exception e1)
        {
            string msg = "{ 'message' : "+ e1.Message +" }";
            Response.Write(msg);
        }
        finally
        {
            conn.Close();
        }
    }
    
}