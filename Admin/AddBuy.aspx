<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBuy.aspx.cs" Inherits="Admin_AddBuy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>服装进货</title>
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
            服装进货</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif" style="height: 49px"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr height="20">
                <td lang="zh-cn">
                    <span></span>服装类别：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="89px">
                    </asp:DropDownList></td>
            </tr>
        <tr height="20">
            <td lang="zh-cn" style="height: 20px">
                服装名称：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                    Width="130px">
                </asp:DropDownList></td>
        </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">服装编码：</span><asp:TextBox ID="txtCode" runat="server" Width="212px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">服装单价：</span><asp:TextBox ID="txtdanjia" runat="server" Width="86px"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">服装规格：</span><asp:TextBox ID="txtguige" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">生产日期：</span><asp:TextBox ID="txtriqi" runat="server"  onclick="fPopCalendar(event,this,this)" onfocus="this.select()" ></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td align="center" style="height: 20px">
                    <span lang="zh-cn">服装描述</span></td>
            </tr>
            <tr height="20">
                <td align="center">
                    <asp:TextBox ID="txtds" runat="server" Height="81px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                </td>
            </tr>
        </table>
    </td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" valign="middle" style="height: 19px">
            </td>
            <td align="center" bgcolor="#f7f8f9" valign="top" style="height: 19px">
                进货信息</td>
            <td background="images/mail_rightbg.gif" style="height: 19px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                进货数量：<asp:TextBox ID="TextBox1" runat="server" Width="110px" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                输入进货数量<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                供应商：<asp:DropDownList ID="DropDownList3" runat="server" Width="201px">
                </asp:DropDownList></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                金额总计：<asp:TextBox ID="TextBox2" runat="server" Width="110px"></asp:TextBox></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 19px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 19px" valign="top">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确 认" />
                &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td background="images/mail_rightbg.gif" style="height: 19px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 62px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 62px" valign="top">
            </td>
            <td background="images/mail_rightbg.gif" style="height: 62px">
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
