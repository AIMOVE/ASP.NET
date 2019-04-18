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
public partial class Admin_AddChuKu : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    public string DownPath;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            Type();
            GetChanp();
        }
    }
    /// <summary>
    /// 绑定类别
    /// </summary>
    private void Type()
    {
        DropDownList1.DataSource = data.GetDataReader("select * from  Class  ");
        DropDownList1.DataTextField = "Name";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        DropDownList1.Items.Add(new ListItem("选择服装类别", "0")); //动态添加新项
    }
    private void GetChanp()
    {
        DropDownList2.DataSource = data.GetDataReader("select * from  GoodsInfo where TypeName='" + DropDownList1.SelectedItem.Text + "'   ");
        DropDownList2.DataTextField = "Name";
        DropDownList2.DataValueField = "id";
        DropDownList2.DataBind();
        this.DropDownList2.Items.Insert(0, new ListItem("请选择进货服装", "0"));
    }
    private void BinderGoodsInfo()
    {

      


        SqlDataReader dr;
        dr = data.GetDataReader("select * from  GoodsKucun where GoodsInfoId='" + DropDownList2.SelectedValue + "'   ");
        if (dr.Read())
        {

            txtguige.Text = dr["guige"].ToString();
            txtCode.Text = dr["Code"].ToString();
            txtSL.Text = dr["shuliang"].ToString();
            TextBox2.Text = dr["StoreName"].ToString();
          
            txtdanjia.Text = dr["danjia"].ToString();
         
        }
        else
        {
            alert.Alertjs("没有服装信息！");
            return;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetChanp();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        BinderGoodsInfo();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
     


        if (int.Parse(txtSL.Text) < int.Parse(TextBox1.Text))
        {
            alert.Alertjs("数量不能大于库存数量！");
        }
        else
        {
            SqlDataReader dr;
            dr = data.GetDataReader("select   *  from GoodsKucun where GoodsInfoId='" + DropDownList2.SelectedValue + "' and DianPuId='0' ");
            if (dr.Read())
            {
                string sql = "update GoodsKucun set shuliang=shuliang-" + float.Parse(TextBox1.Text) + " where  DianPuId='0'  and GoodsInfoId=" + DropDownList2.SelectedValue;
                data.RunSql(sql);
            }

            data.RunSql("insert into GoodsChuKu(name,danjia,guige,shuliang,Code,CManger,GoodsInfoId,SumMoeny,SealDanJia,DianPuName,DianPuId)values('" + DropDownList2.SelectedItem.Text + "','" + txtdanjia.Text + "','" + txtguige.Text + "'," + TextBox1.Text.Trim() + ",'" + txtCode.Text + "','" + Session["UserName"].ToString() + "','" + DropDownList2.SelectedValue + "','" + TextBox2.Text + "','" + txtdanjia.Text + "','" + Session["user"].ToString() + "','" + Session["userid"].ToString() + "')");


            SqlDataReader dr1;
            dr1 = data.GetDataReader("select   *  from GoodsKucun where GoodsInfoId='" + DropDownList2.SelectedValue + "' and DianPuId='" + Session["userid"].ToString() + "' ");
            if (dr1.Read())
            {

                data.RunSql("update GoodsKucun set shuliang=shuliang+" + float.Parse(TextBox1.Text) + " where  GoodsInfoId='" + DropDownList2.SelectedValue + "' and DianPuId='" + Session["userid"].ToString() + "'");
            }
            else
            {
                data.RunSql("insert into GoodsKucun(name,ds,danjia,guige,shuliang,Code,GoodsInfoId,DianPuName,DianPuId,TypeId,TypeName)values('" + DropDownList2.SelectedItem.Text + "','" + txtds.Text + "','" + txtdanjia.Text + "','" + txtguige.Text + "'," + TextBox1.Text.Trim() + ",'" + txtCode.Text + "','" + DropDownList2.SelectedValue + "','" + Session["user"].ToString() + "','" + Session["userid"].ToString() + "','" + DropDownList1.SelectedValue + "','" + DropDownList1.SelectedItem.Text + "')");
            }

            Alert.AlertAndRedirect("分店申请成功！","ChuKuList.aspx");

        }

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox2.Text = Convert.ToString(float.Parse(TextBox1.Text) * float.Parse(txtdanjia.Text));
    }
}
