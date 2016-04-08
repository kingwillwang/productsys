<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.CommDAO"%>
<%@ page import="util.Info"%>
<%@ page import="util.PageManager"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%> 
<%
	HashMap user = Info.getUser(request);
	String uname = user.get("uname").toString();
	String utype = user.get("utype").toString();
	String userid = user.get("id").toString();
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", -10);
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>修改个人信息</title>
<style type="text/css">
a { 
	text-decoration: none 
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 13px
}
.STYLE3 {
	font-size: 12px; 
	font-weight: bold; 
}
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
</style>
</head>
<%
	new CommDAO().delete(request, "sysuser");
	String id = userid;
	String erjitype = request.getParameter("erjitype");
	String myztree = request.getParameter("myztree");
	HashMap ext = new HashMap();
	new CommDAO().update(request, response, "sysuser", ext, true, false);
	HashMap mmm = new CommDAO().getmap(id, "sysuser");
%>
<body>
<form  action="psysuserxg.jsp?f=f&id=<%=mmm.get("id")%>"  name="f1" method="post"  onsubmit="return checkform()" >
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="2"></td>
		</tr>
  		<tr>
    		<td height="30" background="/productsys/admin/tab/images/tab_05.gif">
    			<table width="100%" border="0" cellspacing="0" cellpadding="0">
      				<tr>
        				<td width="12" height="30">
        					<img src="/productsys/admin/tab/images/tab_03.gif" width="12" height="30" />
        				</td>
        				<td>
        					<table width="100%" border="0" cellspacing="0" cellpadding="0">
          						<tr>
            						<td width="46%" valign="middle">
            							<table width="100%" border="0" cellspacing="0" cellpadding="0">
              								<tr>
                								<td width="5%">
                									<div align="center">
                										<img src="/productsys/admin/tab/images/tb.gif" width="16" height="16" />
                									</div>
                								</td>
                								<td width="95%" class="STYLE1">
                									<span class="STYLE3">你当前的位置</span>：修改个人信息
                								</td>
              								</tr>
            							</table>
            						</td>
            						<td width="54%">
            							<table border="0" align="right" cellpadding="0" cellspacing="0">
              								<tr></tr>
            							</table>
            						</td>
          						</tr>
        					</table>
        				</td>
        				<td width="16">
        					<img src="/productsys/admin/tab/images/tab_07.gif" width="16" height="30" />
        				</td>
      				</tr>
    			</table>
    		</td>
  		</tr>
  		<tr>
    		<td>
    			<table width="100%" border="0" cellspacing="0" cellpadding="0">
      				<tr>
        				<td width="8" background="/productsys/admin/tab/images/tab_12.gif"></td>
        				<td>
        					<table style="margin-top:3px" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C3E5FB" >
          						<tr style="display:none">
            						<td height="28" colspan="2" background="/productsys/admin/tab/images/bg.gif" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">信息标题</span>
            							</div>
            						</td>
            					</tr>
          						<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">用户名</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<%=mmm.get("uname")%>
            						</td>
          						</tr>
								<tr>
           	 						<td width="17%" height="30" bgcolor="#FFFFFF">
           	 							<div align="center">
           	 								<span class="STYLE1">用户类别</span>
           	 							</div>
           	 						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<%=mmm.get("utype")%>
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">姓名</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text' onblur='checkform()' class='' id='tname' name='tname' size='30' />
            							<label id='clabeltname' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">性别</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<span id="sexdanx">
            								<label>
            									<input type='radio' name='sex' value='男' />男 
            								</label>
											<label>
												<input type='radio' name='sex' value='女' />女 
											</label>
										</span>
									</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">联系电话</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text' onblur='checkform()' class='' id='tel' name='tel' size='30' />
            							<label id='clabeltel' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">联系邮箱</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text' onblur='checkform()' class='' id='email' name='email' size='30' />
            							<label id='clabelemail' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">家庭地址</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<textarea  cols='35' rows='3'  onblur='checkform()' style="margin-top: 1px;margin-bottom: 1px"  class=''   name='addrs' ></textarea>
            						</td>
          						</tr>
            					<tr>
            						<td height="32" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">
            							<input type="submit" name="Submit"  value="提交信息" />&nbsp;&nbsp;
            							<input type='button' value='重置信息' onclick='getPvalue()' />            
            						</td>
            					</tr>
        					</table>
        				</td>
        				<td width="8" background="/productsys/admin/tab/images/tab_15.gif"></td>
      				</tr>
    			</table>
    		</td>
  		</tr>
  		<tr>
    		<td height="35" background="/productsys/admin/tab/images/tab_19.gif">
    			<table width="100%" border="0" cellspacing="0" cellpadding="0">
     	 			<tr>
        				<td width="12" height="35">
        					<img src="/productsys/admin/tab/images/tab_18.gif" width="12" height="35" />
        				</td>
        				<td align="center" valign="middle"></td>
        				<td width="16">
        					<img src="/productsys/admin/tab/images/tab_20.gif" width="16" height="35" />
        				</td>
      				</tr>
    			</table>
    		</td>
  		</tr>
	</table>
</form>
<script language='javascript' src='/productsys/js/My97DatePicker/WdatePicker.js'></script> 
<script language='javascript' src='/productsys/js/ajax.js'></script> 
<script language='javascript' src='/productsys/js/popup.js'></script> 
 
<script language='javascript'>  
	function checkform() {
		var tnameobj = document.getElementById("tname");
		if (tnameobj.value == "") {
			document.getElementById("clabeltname").innerHTML = "&nbsp;&nbsp;<font color=red>请输入姓名</font>";
			return false;
		} else {
			document.getElementById("clabeltname").innerHTML = "  ";
		}
		
		var telobj = document.getElementById("tel");
		if (telobj.value == "") {
			document.getElementById("clabeltel").innerHTML = "&nbsp;&nbsp;<font color=red>请输入联系电话</font>";
			return false;
		} else {
			document.getElementById("clabeltel").innerHTML = "  ";
		}
		var telobj = document.getElementById("tel");
		if (telobj.value != "") {
			if (telobj.value.length > 11 || telobj.value.length < 8 || isNaN(telobj.value)) {
				document.getElementById("clabeltel").innerHTML = "&nbsp;&nbsp;<font color=red>联系电话必须为8-11位数字</font>";
				return false;
			} else {
				document.getElementById("clabeltel").innerHTML = "";
			}
		}
		
		var emailobj = document.getElementById("email");
		if (emailobj.value != "") {
			var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if (!myreg.test(emailobj.value)) {
				document.getElementById("clabelemail").innerHTML = "&nbsp;&nbsp;<font color=red>联系邮箱格式不正确</font>";
				return false;
			} else {
				document.getElementById("clabelemail").innerHTML = "";
			}
		}
		return true;
	}
</script>  
<%=Info.tform(mmm)%> 
</body>
</html>