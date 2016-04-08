<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.navPoint { 
	color: white; 
	cursor: hand; 
	font-family: Webdings;
	font-size: 9pt;
} 
</style>
<script type="text/javascript">
	function switchSysBar() {
		var locate = location.href.replace('middel.jsp', '');
		var ssrc = document.all("img1").src.replace(locate, '');
		if (ssrc == "images/main_55.gif") {
			document.all("img1").src = "images/main_55_1.gif";
			document.all("frmTitle").style.display = "none"
		} else {
			document.all("img1").src = "images/main_55.gif";
			document.all("frmTitle").style.display = ""
		}
	}
</script>

</head>
<%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();

String url = "";
if(utype.equals("系统管理员"))url="welcome.jsp";
if(utype.equals("库存管理员"))url="welcome.jsp";
if(utype.equals("业务管理员"))url="welcome.jsp";

 %>
<body style="overflow:hidden">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
  <tr>
    <td width="171" id="frmTitle" noWrap name="fmTitle" align="center" valign="top">
    	<table width="171" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
      		<tr>
        		<td  bgcolor="#1873aa" style="width:6px;"></td>
        		<td width="165">
        			<iframe name="I1" height="100%" width="165" src="left.jsp" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
        		</td>
      		</tr>
    	</table>		
    </td>
    <td width="6"  style="width:6px;"valign="middle" bgcolor="1873aa" onclick="switchSysBar()">
    	<span class="navPoint" id="switchPoint" title="关闭/打开左栏">
    		<img src="images/main_55.gif" name="img1" width=6 height=40 id=img1>
    	</span>
	</td>
    <td width="100%" align="center" valign="top"><iframe name="I2" height="100%" width="100%" border="0" frameborder="0" src="<%=url %>"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
  </tr>
</table>
</body>
</html>

