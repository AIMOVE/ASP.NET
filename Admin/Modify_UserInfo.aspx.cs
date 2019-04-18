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
public partial class AdminManger_Modify_UserInfo : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
                DropDownList1.DataSource = data.GetDataReader("select * from  BuMen  ");
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();

                SqlDataReader dr = data.GetDataReader("select * from UsersInfo where id=" + Request.QueryString["id"].ToString());
                if (dr.Read())
                {

                    txtUser.Text = dr["Name"].ToString();
                    TextBox1.Text = dr["TName"].ToString();

                  
                    DropDownList1.Items.FindByText(dr["Bumen"].ToString()).Selected = true;//选项Text  
            
                }
            
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        data.RunSql("update UsersInfo set  Name='" + txtUser.Text + "', TName='" + TextBox1.Text + "',Bumen='" + DropDownList1.SelectedItem.Text + "'  where id=" + Request.QueryString["id"].ToString());
        Alert.AlertAndRedirect("修改成功", "AdminManger.aspx");
    }
}
