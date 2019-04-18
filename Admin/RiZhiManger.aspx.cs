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
public partial class Admin_RiZhiManger : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Get_Info();
        }
    }
    protected void gvInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlHelper mydata = new SqlHelper();

        string ID = gvInfo.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            mydata.RunSql("delete  from Login  where  id='" + ID + "'");

            Label4.Text = "删除成功！";
            gvInfo.EditIndex = -1;
            Get_Info();
        }
        catch
        {

            Label4.Text = "删除失败！";
        }

    }



    private void Get_Info()
    {
        try
        {


            gvInfo.DataSource = GetCodeBy(0);
            gvInfo.DataBind();
        }
        catch
        {

        }

    }
    protected void gvInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvInfo.PageIndex = e.NewPageIndex;
        Get_Info();
    }
    protected void gvInfo_RowDataBound(object sender, GridViewRowEventArgs e)
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
        SqlHelper date = new SqlHelper();
        string strTop = "";
        if (iCount > 1)
        {
            strTop = "top " + iCount.ToString();
        }

        string sql = "select  " + strTop + "  * from [Login] ";
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

}