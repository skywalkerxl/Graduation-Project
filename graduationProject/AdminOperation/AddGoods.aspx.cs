using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using com.force.json;
using Newtonsoft.Json;

public partial class AdminOperation_AddGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string imgSrc = Request.Params["imgSrc"]; //图片
        string descTxt = Request.Params["descTxt"]; //名称
        string priceTxt = Request.Params["priceTxt"]; //价格
        int GoodsClassID = Convert.ToInt32( Request.Params["addId"] ); //大类名称
        int GoodsNum = 100; //商品库存
        bool IsRecommeded = true; //是否上架

        string cs = "server = . ; database = graduation_demo_01 ; User ID = sa ; Password = 123456 ;";
        SqlConnection conn = new SqlConnection(cs);
        try
        {
            conn.Open();
            
            if (conn.State == ConnectionState.Open)
            {
                /* 向订单表中添加数据 */
                string sql_insert_goods = string.Format("insert into GoodsInfo(GoodsNum,GoodsName,GoodsClassID,GoodsPrice,IsRecommended,GoodsPic) values (@GoodsNum,@GoodsName,@GoodsClassID,@GoodsPrice,@IsRecommended,@GoodsPic)");
                SqlCommand cmd = new SqlCommand(sql_insert_goods, conn);
                cmd.Parameters.Add(new SqlParameter("@GoodsNum", GoodsNum));
                cmd.Parameters.Add(new SqlParameter("@GoodsName", descTxt));
                cmd.Parameters.Add(new SqlParameter("@GoodsClassID", GoodsClassID));
                cmd.Parameters.Add(new SqlParameter("@GoodsPrice", priceTxt));
                cmd.Parameters.Add(new SqlParameter("@IsRecommended", IsRecommeded));
                cmd.Parameters.Add(new SqlParameter("@GoodsPic", imgSrc));

                int n = cmd.ExecuteNonQuery();
                if (n <= 0)
                {
                    Response.Write("商品表插入失败");
                }
                else
                {
                    Response.Write("true");
                }
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
        finally
        {
            conn.Close();
        }
        
        


    }
}