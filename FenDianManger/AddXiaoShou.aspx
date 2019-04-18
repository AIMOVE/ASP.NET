<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddXiaoShou.aspx.cs" Inherits="FenDianManger_AddXiaoShou" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> 销售管理</title>
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
            销售管理</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif" style="height: 49px"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr height="20">
                <td style="height: 19px">
                    <span lang="zh-cn">服装编码：</span><asp:TextBox ID="txtCode" runat="server" Width="212px"></asp:TextBox>&nbsp;
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click"
                        Text="查找" />
                    <input id="Hidden1" runat="server" type="hidden" /></td>
            </tr>
        <tr height="20">
            <td style="height: 19px">
                服装名称：<asp:TextBox ID="TextBox3" runat="server" Width="212px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CausesValidation="False" OnClick="Button1_Click"
                        Text="查找" /></td>
        </tr>
        <tr height="20">
            <td style="height: 19px">
                服装名称：<asp:TextBox ID="TextBox5" runat="server" Width="236px"></asp:TextBox></td>
        </tr>
            <tr height="20">
                <td style="height: 20px">
                    <span lang="zh-cn">服装规格：</span><asp:TextBox ID="txtguige" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">库存数量：</span><asp:TextBox ID="txtSL" runat="server"></asp:TextBox>
                </td>
            </tr>
        <tr height="20">
            <td>
                销售订单单价：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        </table>
    </td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" valign="middle" style="height: 20px">
            </td>
            <td align="center" bgcolor="#f7f8f9" valign="top" style="height: 20px">
                填写销售订单信息</td>
            <td background="images/mail_rightbg.gif" style="height: 20px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                销售数量：<asp:TextBox ID="TextBox1" runat="server" Width="110px" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                输入销售订单数量<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                应付金额：<asp:Label ID="Label3" runat="server"></asp:Label></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="添加" /></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 163px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 163px" valign="top">
            </td>
            <td background="images/mail_rightbg.gif" style="height: 163px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 19px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 19px" valign="top">
                <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td background="images/mail_rightbg.gif" style="height: 19px">
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
