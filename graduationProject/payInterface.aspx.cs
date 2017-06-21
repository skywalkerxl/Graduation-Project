using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class graduation_project_pay_demo_paydemo_01 : System.Web.UI.Page
{
    /*
    protected void Page_Load(object sender, EventArgs e)
    {
        paySuccess.Visible = false;
    }
    protected void BtnSubmit_click(object sender, EventArgs e)
    {
        payBox.Visible = false;
        paySuccess.Visible = true;
        string _url = "pay_demo_success.aspx";
        //Response.Redirect(_url);
        string cs = "server = .;Initial Catalog = graduation_demo_01 ; User ID = sa ; Password = 123456 ;";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();

            if (conn.State == ConnectionState.Open)
            {
                successTips.Text = "链接成功！";
            }
            else
            {
                successTips.Text = "链接失败！";
            }
        }
        catch (Exception e1)
        {
            successTips.Text = e1.ToString();
        }
        finally
        {
            conn.Close();
        }
    }
    */
    
}