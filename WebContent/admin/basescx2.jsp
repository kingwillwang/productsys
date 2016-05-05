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
<title>仓库管理</title>
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
<body>
<form action="basescx.jsp"  name="f1" method="post">
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
                									<span class="STYLE3">你当前的位置</span>：仓库管理
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
        					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C3E5FB">
         						<tr>
            						<td colspan=4 height="36" bgcolor="#FFFFFF" align="left" class="STYLE1"> 
            							<%
             								String pbname = request.getParameter("bname") == null ? "" : request.getParameter("bname");
             								String startbname = request.getParameter("startbname") == null ? "" : request.getParameter("startbname");
             								String endbname = request.getParameter("endbname") == null ? "" : request.getParameter("endbname");
             								HashMap mmm = new HashMap();
             							%>
             							&nbsp;&nbsp;&nbsp; 
										仓库名称 ： 
										<input type='text' class=''  size='20' name='bname' />
										&nbsp;&nbsp;
										<input type='submit' class='' value='查询信息' />
 										
										<!-- <input type='button'   class='' value='添加信息' onclick="window.location.replace('basestj.jsp')" /> --> 
									</td>
            					</tr>
          						<tr>
            						<td height="28" background="/productsys/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">仓库名称  </td>
									<td height="28" background="/productsys/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">仓库方位  </td>
									<!-- <td height="28" background="/productsys/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">操作  </td> -->
            					</tr>
          						<%
          							new CommDAO().delete(request, "bases");
          							if (request.getParameter("bnameid1") != null) {
          								new CommDAO().commOper("update bases set bname ='' where id=" + request.getParameter("bnameid1"));
          							}
          							if (request.getParameter("bnameid2") != null) {
          								new CommDAO().commOper("update bases set bname ='' where id=" + request.getParameter("bnameid2"));
          							}
          							String sql = "select * from bases where 1=1 ";
          							if (!pbname.equals("")) {
          								sql += " and bname like'%" + pbname + "%' ";
          							}
          							if (!startbname.equals("")) {
          								mmm.put("startbname", startbname);
          								sql += " and bname >'" + startbname + "' ";
          							}
          							if (!endbname.equals("")) {
          								mmm.put("endbname", endbname);
          								sql += " and bname <'" + Info.getDay(endbname, 1) + "' ";
          							}
          							sql += " order by id desc ";
          							String url = "basescx.jsp?1=1&bname=" + pbname + "";
          							ArrayList<HashMap> list = PageManager.getPages(url, 5, sql, request);
          							for (HashMap map : list) {
          						%>
								<tr>
            						<td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center">
            							<%=map.get("bname")%>
            						</td>
            						<td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center">
            							<%=map.get("baddrs")%>
            						</td>
            						<%-- <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center">
										<a href="basesxg.jsp?id=<%=map.get("id")%>">修改</a>|
										<a onclick="return confirm('确定要删除这条记录吗?')" href="basescx.jsp?scid=<%=map.get("id")%>">删除</a>
									</td> --%>
								</tr>
								<%}%>
        					</table>
        				</td>
        				<td width="8" background="/productsys/admin/tab/images/tab_15.gif" class="STYLE1" ></td>
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
        				<td colspan=4 align="center" valign="middle"  class="STYLE1" >
        					${page.info}
        				</td>
        				<td width="16">
        					<img src="/productsys/admin/tab/images/tab_20.gif" width="16" height="35" />
        				</td>
      				</tr>
    			</table>
    		</td>
  		</tr>
	</table>
</form>
<script language='javascript' src='/productsys/js/ajax.js'></script>
<script language='javascript' src='/productsys/js/My97DatePicker/WdatePicker.js'></script>
<script language='javascript' src='/productsys/js/popup.js'></script>
<% 
mmm.put("bname",pbname); 
%>
<%=Info.tform(mmm)%> 
<!-- <script language='javascript'> 
function update(no){ 
	pop('basesxg.jsp?id='+no,'信息修改',550,'100%') 
}

function add(){ 
	pop('basestj.jsp','信息添加',550,'100%') 
}
</script>  -->
</body>
</html>