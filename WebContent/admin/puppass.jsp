<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.CommDAO"%>
<%@ page import="util.Info"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>密码修改</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 13px;
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
<script>
	var  highlightcolor='#caffff';
	function  changeto(){
		source=event.srcElement;
		if(source.tagName=="tr"||source.tagName=="table")
		return;
		while(source.tagName!="td")
		source = source.parentElement;
		source = source.parentElement;
		cs = source.children;  
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=highlightcolor;
		}
	}

	function  changeback(){
		if(event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
		return
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
	}
</script>
</head>
	<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){
 	%>
	<script language='javascript'>
		alert("操作成功!");
	</script> 
 	<%
 		}
  		CommDAO dao = new CommDAO();
   		HashMap u = (HashMap)Info.getUser(request);
  		String id = (String)u.get("id");
   		u = (HashMap)dao.select("select * from sysuser where id="+id).get(0);
   		dao.close();
   	%>
<body>
<form action="/productsys/productsys?ac=uppass&id=<%=id %>" name="f1" method="post">
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
                									<span class="STYLE3">你当前的位置</span>：修改登录密码
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
        					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          						<tr>
            						<td height="30" bgcolor="#FFFFFF" align="center" width="220"> 
            							<span class="STYLE1">用户名</span> 
            						</td> 
            						<td height="30" bgcolor="#FFFFFF">
            							&nbsp;<input name="uname"  class="textBox" type="text" disabled="disabled" value="<%=u.get("uname")%>" readonly="readonly"  id="textfield" size="20" /> 
            						</td> 
          						</tr>
          						<tr>
            						<td height="30" bgcolor="#FFFFFF" align="center" width="220"> 
            							<span class="STYLE1">新密码</span> 
            						</td> 
            						<td height="30" bgcolor="#FFFFFF">
            							&nbsp;<input name="upass"  class="textBox" type="password" id="textfield" size="20" />
            						</td> 
          						</tr>
			          			<tr>
            						<td height="30" bgcolor="#FFFFFF" align="center" width="220"> 
            							<span class="STYLE1">再次输入新密码</span> 
            						</td> 
            						<td height="30" bgcolor="#FFFFFF"> 
            							&nbsp;<input name="repass"  class="textBox" type="password" id="textfield2" size="20" />
            						</td> 
          						</tr>
          						<tr>
            						<td height="30" bgcolor="#FFFFFF" colspan="2" align="center"> 
             							<input type="submit" name="button" class="btn" onmousedown="check();"  id="button" value="提交信息" />&nbsp;&nbsp;&nbsp;
                            			<input type="reset" name="button" class="btn"  id="button" value="重新填写" />
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
        				<td></td>
        				<td width="16">
        					<img src="/productsys/admin/tab/images/tab_20.gif" width="16" height="35" />
        				</td>
      				</tr>
    			</table>
    		</td>
  		</tr>
	</table>
</form>
<script language='javascript'>
	function check(){
    	if(f1.upass.value==""){
        	alert("请输入新密码");
            return;
        }
        if(f1.upass.value!=f1.repass.value){
            alert("两次密码输入不一致");
            return;
        }
                            
   }
</script>
</body>
</html>