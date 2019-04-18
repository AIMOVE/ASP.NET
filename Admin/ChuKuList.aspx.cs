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
public partial class Admin_ChuKuList : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    Alert alert = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
 

            DropDownList3.DataSource = data.GetDataReader("select * from  FenDian  ");
            DropDownList3.DataTextField = "Name";
            DropDownList3.DataValueField = "id";
            DropDownList3.DataBind();
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

        sql = "select  " + strTop + "  * from [GoodsChuKu]  where DianPuName<>'总店' and   DianPuId='" + DropDownList3.SelectedValue + "' and  AddTime  between '" + Convert.ToDateTime(b) + "' and  '" + Convert.ToDateTime(e) + "' and IsPeiHuo='否'";

        
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
    protected void btnDel_Click(object sender, EventArgs e)
    {
        for (int rowIndex = 0; rowIndex < dlinfo.Rows.Count; rowIndex++)
        {
            if (((CheckBox)dlinfo.Rows[rowIndex].Cells[0].FindControl("chkSelect")).Checked)
            {
                if (DelCode(Convert.ToInt32(dlinfo.DataKeys[rowIndex].Value)))
                {

                }
            }
        }
        getinfo();
        Alert.AlertAndRedirect("配货成功！", "ChuKuList.aspx");
    }
    protected void btnSelectAll_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        bool isOK = false;
        if (btn.Text == "全选")
        {
            isOK = true;
            //找到PagerTemplate中的全选按钮
            btnSelectAll.Text = "取消全选";
        }
        else
        {
            btnSelectAll.Text = "全选";
        }

        foreach (GridViewRow row in dlinfo.Rows)
        {
            ((CheckBox)row.Cells[0].FindControl("chkSelect")).Checked = isOK;
        }
    }
    public bool DelCode(int id)
    {
        bool isOK = false;
        string sql = "update  dbo.GoodsChuKu  set IsPeiHuo='是'  where id=" + id;
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        SqlCommand cmd = new SqlCommand(sql, con);
        try
        {
            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
                isOK = true;
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return isOK;
    }

}
