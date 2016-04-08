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
response.setHeader("Pragma","No-cache");    
response.setHeader("Cache-Control","no-cache");    
response.setDateHeader("Expires", -10);   
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>仓库修改</title>
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
	new CommDAO().delete(request, "bases");
	String id = request.getParameter("id");
	String erjitype = request.getParameter("erjitype");
	String myztree = request.getParameter("myztree");
	HashMap ext = new HashMap();
	new CommDAO().update(request, response, "bases", ext, true, false);
	HashMap mmm = new CommDAO().getmap(id, "bases");
%>
<body>
<form  action="basesxg.jsp?f=f&id=<%=mmm.get("id")%>"  name="f1" method="post"  onsubmit="return checkform()" >
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
                									<span class="STYLE3">你当前的位置</span>：信息修改
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
            								<span class="STYLE1">仓库名称</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text' onblur='checkform()' class='' id='bname' name='bname' size='30' />
            							<label id='clabelbname' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">仓库方位</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<textarea  cols='35' rows='3'  onblur='checkform()'   style='margin-top: 1px;margin-bottom: 1px'  class=''   name='baddrs'   ></textarea>
            						</td>
          						</tr>
            					<tr>
            						<td height="32" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">
            							<input type="submit" name="Submit"  value="提交信息" />&nbsp;&nbsp;
            							<input type='button' value='返回上页' onclick='window.location.replace("basescx.jsp")' />            
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

  
<script language='javascript' >  
function checkform(){  
	var bnameobj = document.getElementById("bname");  
	if(bnameobj.value==""){  
		document.getElementById("clabelbname").innerHTML="&nbsp;&nbsp;<font color=red>请输入仓库名称</font>";  
		return false;  
	}else{ 
		document.getElementById("clabelbname").innerHTML="  ";  
	}  
	var bnameobj = document.getElementById("bname");  
	if(bnameobj.value!=""){  
		var ajax = new AJAX(); 
		ajax.post("/productsys/factory/checkno.jsp?table=bases&col=bname&value="+bnameobj.value+"&checktype=update&id=<%=mmm.get("id")%>&ttime=<%=Info.getDateStr()%>");
		var msg = ajax.getValue();
		if (msg.indexOf('Y') > -1) {
			document.getElementById("clabelbname").innerHTML = "&nbsp;&nbsp;<font color=red>仓库名称已存在</font>";
			return false;
		} else {
			document.getElementById("clabelbname").innerHTML = "  ";
		}
	}
	return true;
}
</script>  
<%=Info.tform(mmm)%> 
</body>
</html>