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
public partial class Login : System.Web.UI.Page
{

    SqlHelper data = new SqlHelper();
    SqlDataReader dr;
    Alert js = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


        }

    }


    private void chkADmin()
    {
        if (username.Value == "" && password.Value == "")
        {
            Alert.AlertAndRedirect("没有输入账号和密码！", "Login.aspx");


        }
        else
        {
            dr = data.GetDataReader("select * from  UsersInfo where Name='" + username.Value.Trim() + "'and Password='" + password.Value.Trim() + "'     and Roule='总店'");
            if (dr.Read())
            {
                Session["adminid"] = dr["id"].ToString();
                Session["admin"] = dr["Name"].ToString();
                Session["user"] = dr["name"].ToString();
                Session["UserName"] = dr["TName"].ToString();
                Session["userid"] = dr["id"].ToString();

                string sql = "insert into  Login(UserName,UserRoul,Logintime) values('" + dr["TName"].ToString() + "','总店','" + DateTime.Now + "')";
                data.RunSql(sql);
                Response.Redirect("Admin/Index.aspx");

            }
            else
            {
                Alert.AlertAndRedirect("总店的账号或者密码不对请重新登陆！", "login.aspx");
            }
        }
    }

  
   
    protected void Submit1_ServerClick1(object sender, EventArgs e)
    {
        if (Identify.SelectedItem.Text == "总店")
        {
            chkADmin();


        }
        if (Identify.SelectedItem.Text == "分店")
        {
            if (username.Value == "" && password.Value == "")
            {
                Alert.AlertAndRedirect("没有输入账号和密码！", "Login.aspx");


            }
            else
            {
                dr = data.GetDataReader("select * from  [YingYeYuan] where LoginName='" + username.Value.Trim() + "'and LoginPwd='" + password.Value.Trim() + "'    ");
                if (dr.Read())
                {
                    Session["user"] = dr["FDName"].ToString();
                    Session["UserName"] = dr["name"].ToString();
                    Session["userid"] = dr["FDID"].ToString();



                    string sql = "insert into  Login(UserName,UserRoul,Logintime) values('" + dr["FDName"].ToString() + "','分店','" + DateTime.Now + "')";
                    data.RunSql(sql);
                    Response.Redirect("FenDianManger/Index.aspx");

                }
                else
                {
                    Alert.AlertAndRedirect("账号或者密码不对请重新登陆！", "Login.aspx");
                }
            }
        }

    }
}
