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

public partial class Admin_BackDataBase : System.Web.UI.Page
{

    SqlConnection myConnection = new SqlConnection(SqlHelper.connstring);
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string newname = "ClothingChainStore" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + ".bak";
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        string nepath = Server.MapPath("../DataBack\\") + newname;
        string sql = "BACKUP DATABASE ClothingChainStore to DISK ='" + nepath + "'" + "with init";
        SqlCommand cmd = new SqlCommand(sql, cn);
        try
        {
            cn.Open();
            cmd.ExecuteNonQuery();
            HyperLink1.Text = "已成功备份到服务器路径：" + nepath + " 请点击下载到本地！";
            HyperLink1.NavigateUrl = "../DataBack\\" + newname;
            HyperLink1.Visible = true;
        }
        catch (Exception ex)
        {
            string exm = ex.Message;
            Label1.Text = "备份数据库出错，该文件可能不存在！";
            Label1.Visible = true;
        }
        finally
        {
            cmd.Dispose();
            cn.Close();
            cn.Dispose();
        }
    }
}
