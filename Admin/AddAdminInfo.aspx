<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdminInfo.aspx.cs" Inherits="AdminManger_AddAdminInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>服装连锁店管理系统</title>
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
    <td height="29" valign="top" background="images/mail_leftbg.gif" style="width: 8px"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td style="height: 31px"><div class="titlebt">添加账号</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td height="71" valign="middle" background="images/mail_leftbg.gif" style="width: 8px">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="height: 72px">
      <tr>
        <td valign="top" style="width: 998px; height: 20px">
            登陆帐号：<asp:TextBox ID="txtUser" runat="server" Width="148px"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser"
                ErrorMessage="*"></asp:RequiredFieldValidator><br />
            登陆密码：<asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="148px"></asp:TextBox>
            &nbsp;
            <span lang="zh-cn">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                    ErrorMessage="*"></asp:RequiredFieldValidator><br />
                真实姓名：</span><asp:TextBox ID="TextBox1" runat="server" Width="148px"></asp:TextBox>&nbsp;&nbsp;<br />
            所在部门：<asp:DropDownList ID="DropDownList1" runat="server" Width="124px">
            </asp:DropDownList></td>
      </tr>
        <tr>
            <td align="center" style="width: 998px; height: 24px;" valign="top">
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="添 加" />
            <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif" style="width: 8px"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
      <td height="17" valign="top" background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17" /></td>
    <td background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
