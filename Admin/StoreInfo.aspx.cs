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
public partial class Admin_StoreInfo : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    Alert alert = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (float.Parse(e.Row.Cells[4].Text) < float.Parse(e.Row.Cells[5].Text))
            {
                e.Row.BackColor = System.Drawing.Color.Red;
            }
            else
            {


            }
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
    
            sql = "select  " + strTop + "  * from [GoodsKucun] ";
      
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
