<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChuKuList.aspx.cs" Inherits="Admin_ChuKuList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>入库信息</title>
     <script language="javascript" type="text/javascript" src="../JavaScript/Calendar.js"></script>
    
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
  <link href="css/common.css"rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif" style="height: 49px"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif" style="height: 49px"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">
            等待配货信息</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif" style="height: 49px"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 35px" valign="middle">
            </td>
            <td bgcolor="#f7f8f9" style="height: 35px" valign="top">
                选择分店：<asp:DropDownList ID="DropDownList3" runat="server" Width="201px">
                </asp:DropDownList>开始时间：
                <asp:TextBox ID="txtbtime" runat="server"  onclick="fPopCalendar(event,this,this)" onfocus="this.select()" 
                    Width="150px"></asp:TextBox>结束时间：
                <asp:TextBox ID="txtEtime" runat="server"  onclick="fPopCalendar(event,this,this)" onfocus="this.select()" 
                    Width="150px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" /></td>
            <td background="images/mail_rightbg.gif" style="height: 35px">
            </td>
        </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
        <asp:GridView ID="dlinfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" DataKeyNames="id" OnPageIndexChanging="dlinfo_PageIndexChanging"
            OnRowDataBound="dlinfo_RowDataBound" OnRowDeleting="dlinfo_RowDeleting" Width="100%">
            <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageButtonCount="12"
                PreviousPageText="上一页" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" HorizontalAlign="Left" />
            <Columns>
                <asp:TemplateField HeaderText="服装名称">
                    <ItemTemplate>
                        <asp:Label ID="name" runat="server" Text='<%# Bind("name") %>' Width="158px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="单价">
                    <ItemTemplate>
                        <asp:Label ID="danjia" runat="server" Text='<%# Bind("danjia") %>' Width="100px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="申请时间">
                    <ItemTemplate>
                        <asp:Label ID="AddTime" runat="server" Text='<%# Bind("AddTime") %>' Width="168px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="经手人">
                    <ItemTemplate>
                        <asp:Label ID="CManger" runat="server" Text='<%# Bind("CManger") %>' Width="100px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="申请数量">
                    <ItemTemplate>
                        <asp:Label ID="shuliang" runat="server" Text='<%# Bind("shuliang") %>' Width="100px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                
                  <asp:TemplateField HeaderText="申请分店">
                    <ItemTemplate>
                        <asp:Label ID="DianPuName" runat="server" Text='<%# Bind("DianPuName") %>' Width="100px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="选择">
                                      <EditItemTemplate>
                                          <asp:CheckBox ID="CheckBox1" runat="server" />
                                      </EditItemTemplate>
                                      <HeaderTemplate>
                                          选择
                                      </HeaderTemplate>
                                      <ItemTemplate>
                                          <asp:CheckBox ID="chkSelect" runat="server" />
                                      </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Left" Width="100px" />
                                  </asp:TemplateField>
            </Columns>
            <PagerTemplate>
                <table border="0" width="100%">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">首页 </asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                CommandName="Page" Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">上一页 </asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">下一页 </asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">尾页 </asp:LinkButton>
                            共
                            <asp:Label ID="LabelPageCount" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageCount %>"> </asp:Label>
                            页 第
                            <asp:Label ID="Label2" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"> </asp:Label>
                            页
                        </td>
                        <td align="right" width="20%">
                        </td>
                    </tr>
                </table>
            </PagerTemplate>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" CssClass="ct" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" valign="middle" style="height: 28px">
            </td>
            <td align="center" bgcolor="#f7f8f9" valign="top" style="height: 28px">
                &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                <asp:Button ID="btnSelectAll" runat="server" OnClick="btnSelectAll_Click" Text="全选" />
                <asp:Button
                    ID="btnDel" runat="server" OnClick="btnDel_Click" OnClientClick="javascript:return confirm('确定要配货出库么？');"
                    Text="出库" /></td>
            <td background="images/mail_rightbg.gif" style="height: 28px">
            </td>
        </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
