using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class mianInterface : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string cs = "server=. ; database=graduation_demo_01 ; User ID = sa ; Password = 123456 ; ";
        //SqlConnection conn = new SqlConnection(cs);
        //try
        //{
        //    conn.Open();
        //    if (conn.State == ConnectionState.Open)
        //    {
        //        string sql_goodsClass = "select * from dbo.GoodsClassInfo_02 ";
        //        DataSet ds = new DataSet();
        //        SqlDataAdapter sda = new SqlDataAdapter(sql_goodsClass, conn);
        //        sda.Fill(ds);
        //        //Response.Write(ul_demo.InnerText);
        //        //ul_demo.InnerText += "<li class='fl'><div class='image'><img ID='img_demo_02' runat='server' alt='食品生鲜' src='' /></div><div class='caption'><div class='blur'><input type='button' class='btn_details' value='查看更多'/><br /><span ID='span_demo_02' runat='server'></span></div><div class='caption_area'></div></div></li>";
                
        //        /* 
        //        string arrid = ds.Tables[0].Rows[0][0].ToString() + "|"
        //            + ds.Tables[0].Rows[1][0].ToString() + "|"
        //            + ds.Tables[0].Rows[2][0].ToString() + "|"
        //            + ds.Tables[0].Rows[3][0].ToString() + "|"
        //            + ds.Tables[0].Rows[4][0].ToString() + "|";
        //        */
        //        //btn1.name = ds.Tables[0].Rows[0][0].ToString(); 
        //        //btn1.
        //        //Response.Write(ds.Tables[0].Rows[0][1]);
        //        //填充描述
        //        span1.InnerText = ds.Tables[0].Rows[0][1].ToString();
        //        span2.InnerText = ds.Tables[0].Rows[1][1].ToString();
        //        span3.InnerText = ds.Tables[0].Rows[2][1].ToString();
        //        span4.InnerText = ds.Tables[0].Rows[3][1].ToString();
        //        span5.InnerText = ds.Tables[0].Rows[4][1].ToString();

        //        //Response.Write(ds.Tables[0].Rows[0][2]);
        //        //填充图像
        //        /*img1.Src = ds.Tables[0].Rows[0][2].ToString();
        //        img2.Src = ds.Tables[0].Rows[1][2].ToString();
        //        img3.Src = ds.Tables[0].Rows[2][2].ToString();
        //        img4.Src = ds.Tables[0].Rows[3][2].ToString();
        //        img5.Src = ds.Tables[0].Rows[4][2].ToString();
        //        */


        //    }
        //    else
        //    {
        //        Response.Write("链接失败");
        //    }
        //}
        //catch (Exception e1)
        //{
        //    Response.Write(e1.Message);
        //}
        //finally
        //{
        //    conn.Close();
        //}
    }
}