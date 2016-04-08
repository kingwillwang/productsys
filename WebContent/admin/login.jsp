<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="util.Info"%>
<%@ page import="dao.CommDAO"%>
<%@ page import="util.PageManager"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<style type="text/css">
.button {
	font-size: 12px;
	text-align: center;
	padding: 0px;
	vertical-align: middle;
	line-height: 22px;
	margin: 0px;
	Height: 26px;
	Width: 60px;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #016aa9;
	overflow: hidden;
}

.STYLE1 {
	color: #000000;
	font-size: 12px;
}
.loginbtn{
	height: 19px;
	border: 1px solid gray; 
	font-size: 12px;
}
.unametext{
	width: 105px; 
	height: 17px; 
	border: solid 1px #7dbad7; 
	font-size: 12px; 
	color: black
}
.upasstext{
	width: 105px; 
	height: 17px; 
	border: solid 1px #7dbad7; 
	font-size: 12px; 
	color: black;
}
</style>
</head>
<body onload="f1.uname.focus();">
	<script type="text/javascript">
		function check() {
			if (f1.uname.value == "") {
				alert("请输入用户名");
				return false;
			}
			if (f1.upass.value == "") {
				alert("请输入密码");
				return false;
			}
			f1.submit();
		}
	</script>
	<form action="/productsys/productsys?ac=login" name="f1" method="post">
		<table width="100%" height="100%" border='0' cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="235"
								background="/productsys/admin/images/login_03.png"></td>
						</tr>
						<tr>
							<td height="53">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="394" height="53"
											background="/productsys/admin/images/login_05.png">&nbsp;</td>
										<td width="206"
											background="/productsys/admin/images/login_06.png">
											<table width="120%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="16%" height="25"><div align="right">
															<span class="STYLE1">用户 : </span>
														</div></td>
													<td width="57%" height="25">
														<div align="center">
															<input type="text" name="uname" id="uname" class="unametext"/>
														</div>
													</td>
													<td width="27%" height="25">&nbsp;</td>
												</tr>
												<tr>
													<td height="25"><div align="right">
															<span class="STYLE1">密码 : </span>
														</div></td>
													<td height="25">
														<div align="center">
															<input type="password" name="upass" id="upass" class="upasstext"/>
														</div>
													</td>
												</tr>
											</table>
										</td>
										<td width="362"
											background="/productsys/admin/images/login_07.png">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="height: 213px"
							background="/productsys/admin/images/login_08.png">
							<td height="25" align="center"valign="top" >
								<select name="utype">
									<option value="系统管理员">系统管理员</option>
									<option value="库存管理员">库存管理员</option>
									<option value="业务管理员">业务管理员</option>
								</select>
								<input type="button" onclick="check(); " class="loginbtn" value="登录" /> 
								<input type="reset" style="height: 19px; border: 1px solid gray; font-size: 12px;" value="重置" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
<%
	if (request.getAttribute("error") != null) {
%>
<script type="text/javascript">
	alert("用户名、密码错误或选择登录权限！");
</script>
<%} %>
</body>
</html>

