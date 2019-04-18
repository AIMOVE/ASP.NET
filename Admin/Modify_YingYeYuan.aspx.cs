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


public partial class Admin_Modify_YingYeYuan : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            SqlDataReader dr = data.GetDataReader("select * from dbo.YingYeYuan where id=" + Request.QueryString["id"].ToString());
            if (dr.Read())
            {

                txtUser.Text = dr["Name"].ToString();
                TextBox1.Text = dr["YueXin"].ToString();
                TextBox2.Text = dr["PYTime"].ToString();
                TextBox3.Text = dr["LoginName"].ToString();


            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        data.RunSql("update dbo.YingYeYuan set  Name='" + txtUser.Text + "', YueXin='" + TextBox1.Text + "' ,PYTime='" + TextBox2.Text + "',LoginName='" + TextBox3.Text + "'  where id=" + Request.QueryString["id"].ToString());
        Alert.AlertAndRedirect("修改成功", "AddYingYeYuan.aspx");
    }
}
