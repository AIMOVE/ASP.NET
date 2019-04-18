<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify_YingYeYuan.aspx.cs" Inherits="Admin_Modify_YingYeYuan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>分店管理</title>
    
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
            修改分店用户</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif" style="height: 49px"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 30px" valign="middle">
            </td>
            <td bgcolor="#f7f8f9" style="height: 30px" valign="top">
                姓名：<asp:TextBox ID="txtUser" runat="server" Width="103px"></asp:TextBox>
                &nbsp; &nbsp; <span lang="zh-cn">月薪：</span><asp:TextBox ID="TextBox1" runat="server"
                    Width="123px"></asp:TextBox>
                <span lang="zh-cn">聘用日期：</span><asp:TextBox ID="TextBox2" runat="server" onclick="fPopCalendar(event,this,this)"
                    onfocus="this.select()" Width="145px"></asp:TextBox>
                &nbsp;&nbsp;登陆账号<span lang="zh-cn">：</span><asp:TextBox ID="TextBox3" runat="server"
                    Width="87px"></asp:TextBox>&nbsp;
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="修改" />
                &nbsp; &nbsp;</td>
            <td background="images/mail_rightbg.gif" style="height: 30px">
            </td>
        </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
        &nbsp;</td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" valign="top">
            </td>
            <td background="images/mail_rightbg.gif">
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
