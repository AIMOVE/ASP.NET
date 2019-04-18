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
public partial class Admin_AddStoreInfo : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    Alert alert = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (txtbtime.Text == "")
            {
                txtbtime.Text = DateTime.Now.ToShortDateString();
            }
            if (txtEtime.Text == "")
            {
                txtEtime.Text = DateTime.Now.ToShortDateString();
            }
            getinfo();
        }
    }
    protected void dlinfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    

    }
    private void getinfo()
    {
        try
        {
            dlinfo.DataSource = GetCodeBy(0);
            dlinfo.DataBind();
        }
        catch
        {
        }
    }
    protected void dlinfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        dlinfo.PageIndex = e.NewPageIndex;
        getinfo();
    }
    protected void dlinfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //鼠标移动变色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f6f6f6',this.style.fontWeight='';");
            //当鼠标离开的时候 将背景颜色还原的以前的颜色 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
        }
        //单击行改变行背景颜色 
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", "this.style.backgroundColor='#f6f6f6'; this.style.color='buttontext';this.style.cursor='default';");
        }

    }
    public DataSet GetCodeBy(int iCount)
    {
        string strTop = "";
        if (iCount > 1)
        {
            strTop = "top " + iCount.ToString();
        }
        string sql = "";
        string b = Convert.ToDateTime(txtbtime.Text).ToShortDateString() + " 00:00";
        string e = Convert.ToDateTime(txtEtime.Text).ToShortDateString() + " 23:59";
        if (TextBox1.Text == "")
        {
            sql = "select  " + strTop + "  * from [JinHuo]  where istRuKu='是' and  AddTime  between '" + Convert.ToDateTime(b) + "' and  '" + Convert.ToDateTime(e) + "'";
        }
        else
        {
            sql = "select  " + strTop + "  * from [JinHuo]  where istRuKu='是' and   name like '%" + TextBox1.Text + "%' and  AddTime  between '" + Convert.ToDateTime(b) + "' and  '" + Convert.ToDateTime(e) + "'";

        }
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = null;
        try
        {
            con.Open();
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (SqlException ex)
        {
            throw ex;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return ds;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        getinfo();
    }
}
