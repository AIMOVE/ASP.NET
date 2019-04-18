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
public partial class AdminManger_AddAdminInfo : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    Alert alert = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            DropDownList1.DataSource = data.GetDataReader("select * from  BuMen  ");
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();

        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlDataReader dr = data.GetDataReader("select * from   UsersInfo where  name='" + txtUser.Text + "'");
        if (dr.Read())
        {
            Label4.Text = "账号已经存在";
            return;


        }
        else
        {
            data.RunSql("insert into UsersInfo(name,Password,TName,Bumen,Roule)values('" + txtUser.Text + "','" + txtPwd.Text + "','" + TextBox1.Text + "','" + DropDownList1.SelectedItem.Text + "','总店')");
            Alert.AlertAndRedirect("添加成功", "AdminManger.aspx");
        }
    }
}
