<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>服装连锁店管理系统</title>
     
<LINK rel="stylesheet" type="text/css" href="images/reset.css"><LINK rel="stylesheet" 
type="text/css" href="images/style.css"><LINK rel="stylesheet" type="text/css" 
href="images/lrtk.css">
 
</head>
<body>
    <form id="form1" runat="server">
  <SECTION id="h1" class="jawbone-takeover-minimulti jawbone-hero"><I 
style="opacity: 1.05;" class="jawbone-hero-image" data-hero-min-opacity=".3" 
data-hero-image-fade="true" data-hero-image-fixed="true"></I>
<DIV class="warp"><A href="#">
<DIV class="logo"></DIV></A>
<DIV class="loginbox">
<DIV class="cd-user-modal-container">
<UL class="cd-switcher">
  <LI> 用户登录</LI>
   </UL>
<DIV id="cd-login">
 
<DIV class="list"><input id="username" runat="server" class="listinp" name="username" placeholder="用户名"
            type="text" /></DIV>
<DIV class="list"><input id="password" runat="server" class="listinp" name="password"
                placeholder="密码" type="password" /></DIV>

<DIV class="list"><asp:DropDownList ID="Identify"  class="listinp" runat="server">
                  <asp:ListItem>总店</asp:ListItem>
                  <asp:ListItem>分店</asp:ListItem>
              </asp:DropDownList></DIV>
 
<DIV class="login"><input id="Submit1" runat="server" class="btn" onserverclick="Submit1_ServerClick1"
                                type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" /></DIV>
 </DIV> 
 
 </DIV></DIV>
  </DIV></SECTION>
 
         
    </form>
</body>
</html>
