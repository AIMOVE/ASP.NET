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

public partial class Admin_AddGoods : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = data.GetDataReader("select * from  Class  ");
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        data.RunSql("insert into GoodsInfo(Code,name,ds,danjia,TypeName,TypeId,guige,shengchanriqi,Images)values('" + TextBox1.Text + "','" + txtname.Text + "','" + txtds.Text + "','" + txtdanjia.Text + "','" + DropDownList1.SelectedItem.Text + "'," + DropDownList1.SelectedValue + ",'" + txtguige.Text + "','" + txtriqi.Text + "','"+pic.Text+"')");


        Alert.AlertAndRedirect("添加成功！", "GoodsManger.aspx");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string res;
        upload up = new upload();
        res = up.Up(file1, "../uploads/");
        this.Label1.Visible = true;
        this.Label1.Text = up.Resup[Convert.ToInt32(res)];
        this.pic.Text = up.s;
        Image1.ImageUrl = "../uploads/" + pic.Text;
    }
}
