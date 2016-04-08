<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>欢迎进入系统后台</title>
<link href="/productsys/admin/images/syscome.files/Admin.css" rel=stylesheet>
<script type="text/javascript" src="/productsys/admin/images/syscome.files/Admin.js"></script>
<script type="text/javascript" src="/productsys/js/popup.js"></script>
<meta content="MSHTML 6.00.2900.5726" name=GENERATOR>
</head>
<body>
<%
String docname = request.getParameter("docname");
if(docname!=null)
{
 %>
 <script type="text/javascript">
 var txt = parent.document.getElementById("txt");
 var docname = parent.document.getElementById("docname");
 docname.value="<%=docname%>";
 popclose();
 </script>
 <%} %>
<form action="/productsys/productsys?ac=uploaddoc" enctype="multipart/form-data" name="f1" method="post">
<table cellSpacing='1' cellPadding=3 width="100%" align='center' border='0'>
	<tr>
    	<td align="center" class=forumrow>
    		<label>
    			<input name="txt" type="file"  size="27">
      		</label>
    	</td>
    </tr>
	<tr>
    	<td height=31 align="center" class='forumrow'>
      		<input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </tr>
  </table>
</form>
<script type="text/javascript">
function check()
{
if(f1.olduserpass.value=="")
{
alert("请输入原密码");
return;
}
if(f1.userpass.value=="")
{
alert("请输入新密码");
return;
}
if(f1.copyuserpass.value!=f1.userpass.value)
{
alert("两次密码输入不一致");
return;
}
}

<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("原密码不对");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/productsys/admin/kcfiles.jsp");
 <%}%>
 </script>
</body>
</html>

