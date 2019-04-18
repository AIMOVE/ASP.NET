using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class FenDianManger_AddXiaoShou : System.Web.UI.Page
{

    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
      
        }
    }

    private void BinderGoodsInfo()
    {
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  GoodsKucun where Code='" + txtCode.Text.Trim() + "' and DianPuId='" + Session["userid"].ToString() + "' ");
        if (dr.Read())
        {

            txtguige.Text = dr["guige"].ToString();
            txtCode.Text = dr["Code"].ToString();
            txtSL.Text = dr["shuliang"].ToString();
          
            TextBox5.Text = dr["name"].ToString();
            TextBox2.Text = dr["danjia"].ToString();
            Hidden1.Value = dr["GoodsInfoId"].ToString();
        }
        else
        {
            alert.Alertjs("没有服装信息！");
            return;
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label3.Text = Convert.ToString(float.Parse(TextBox1.Text)*float.Parse(TextBox2.Text));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        BinderGoodsInfo();

      
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (int.Parse(txtSL.Text) < int.Parse(TextBox1.Text))
        {
            alert.Alertjs("数量不能大于库存数量！");
        }
        else
        {
            SqlDataReader dr;
            dr = data.GetDataReader("select   *  from GoodsKucun where GoodsInfoId='" + Hidden1.Value + "' and DianPuId='" + Session["userid"].ToString() + "' ");
            if (dr.Read())
            {
                string sql = "update GoodsKucun set shuliang=shuliang-" + float.Parse(TextBox1.Text) + " where  DianPuId='" + Session["userid"].ToString() + "'  and GoodsInfoId=" + Hidden1.Value;
                data.RunSql(sql);
            }
            data.RunSql("insert into XiaoShou(ChengPinId,name,guige,shuliang,Code,CManger,SumMoeny,SealDanJia,DianPuName,DianPuId)values('" + Hidden1.Value + "','" + TextBox5.Text + "','" + txtguige.Text + "'," + TextBox1.Text.Trim() + ",'" + txtCode.Text + "','" + Session["UserName"].ToString() + "','" + Label3.Text + "','" + TextBox2.Text+ "','" + Session["user"].ToString() + "','" + Session["userid"].ToString() + "')");

            Alert.AlertAndRedirect("销售订单成功！", "AddXiaoShou.aspx");

        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataReader dr;
        dr = data.GetDataReader("select * from  GoodsKucun where name='" + TextBox3.Text.Trim() + "' and DianPuId='" + Session["userid"].ToString() + "' ");
        if (dr.Read())
        {

            txtguige.Text = dr["guige"].ToString();
            txtCode.Text = dr["Code"].ToString();
            txtSL.Text = dr["shuliang"].ToString();

            TextBox5.Text = dr["name"].ToString();
            TextBox2.Text = dr["danjia"].ToString();
            Hidden1.Value = dr["GoodsInfoId"].ToString();
        }
        else
        {
            alert.Alertjs("没有服装信息！");
            return;
        }
    }
}
