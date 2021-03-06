﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>服装连锁店管理系统</title>
       <link rel="stylesheet" href="./css/x-admin.css" media="all">
</head>
<body>
    <form id="form1" runat="server">
  <div class="layui-layout layui-layout-admin">
            <div class="layui-header header header-demo">
                <div class="layui-main">
                    <a class="logo" href="admin_main.aspx">
                   <img src="images/banner2.png"></img>
                    </a>
                    <ul class="layui-nav" lay-filter="">
                      <li class="layui-nav-item"><img src="images/0.jpg" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                      <li class="layui-nav-item">
                        <a href="javascript:;"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                         
                          
                          <dd><a href="../Login.aspx">退出</a></dd>
                        </dl>
                      </li>
                      <!-- <li class="layui-nav-item">
                        <a href="" title="消息">
                            <i class="layui-icon" style="top: 1px;">&#xe63a;</i>
                        </a>
                        </li> -->
                      <li class="layui-nav-item x-index"><a href="admin_main.aspx"> </a></li>
                    </ul>
                </div>
            </div>
            <div class="layui-side layui-bg-black x-side">
                <div class="layui-side-scroll">
                    <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">
                    <!--数据管理-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;" _href="main.html">
                               <i class="layui-icon" style="top: 3px;">&#xe62d;</i><cite>当前分店库存</cite>
                            </a>
                      <dl class="layui-nav-child">
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="StoreInfo.aspx">
                                           <cite>当前分店库存</cite>
                                        </a>
                              </dd>
                                </dd>
                                 
                                   
                            </dl>
                        </li>
                        
                      
                    
                         
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>进货管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                 
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="AddChuKu.aspx">
                                            <i class="layui-icon"></i><cite>货物申请</cite>
                                        </a>
                                    </dd>
                                </dd>
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="ChuKuList.aspx">
                                            <i class="layui-icon"></i><cite>货物申请管理</cite>
                                        </a>
                                    </dd>
                                </dd>
                                
                            </dl>
                        </li>
                        
                        
                        
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>销售管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                 
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="AddXiaoShou.aspx"">
                                            <i class="layui-icon"></i><cite>添加销售</cite>
                                        </a>
                                    </dd>
                                </dd>
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="XiaoShouManger.aspx">
                                            <i class="layui-icon"></i><cite>销售管理</cite>
                                        </a>
                                    </dd>
                                </dd>
                               
                               
                            </dl>
                        </li>
                        
                        
                      
                          
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>系统管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                 
                                
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="ModifyPwd.aspx">
                                            <i class="layui-icon"></i><cite>修改密码</cite>
                                        </a>
                                    </dd>
                                </dd>
                                
                            </dl>
                        </li>
                        
                      
                    </ul>
                </div>

            </div>
            <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true">
                <div class="x-slide_left"></div>
                <ul class="layui-tab-title">
                    <li class="layui-this">
                        操作界面
                        <i class="layui-icon layui-unselect layui-tab-close">ဆ</i>
                    </li>
                </ul>
                <div class="layui-tab-content site-demo site-demo-body">
                    <div class="layui-tab-item layui-show">
                        <iframe frameborder="0" src="admin_main.aspx" class="x-iframe"></iframe>
                    </div>
                </div>
            </div>
            <div class="site-mobile-shade">
            </div>
        </div>
           <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script src="./js/x-admin.js"></script>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
    </form>
</body>
</html>
