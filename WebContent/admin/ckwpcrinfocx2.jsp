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
<title>出库清单管理</title>
<style type="text/css">
a { 
	text-decoration: none; 
}

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
</head>
<body>
<form action="ckwpcrinfocx.jsp"  name="f1" method="post">
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
                									<span class="STYLE3">你当前的位置</span>：出库清单管理
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
        					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C3E5FB" >
         						<tr>
            						<td colspan='13' height="40" bgcolor="#FFFFFF" align="left" class="STYLE1">
            							<%
            								String popdate = request.getParameter("opdate") == null ? "" : request.getParameter("opdate");
            								String startopdate = request.getParameter("startopdate") == null ? "" : request.getParameter("startopdate");
            								String endopdate = request.getParameter("endopdate") == null ? "" : request.getParameter("endopdate");
            								String pspname = request.getParameter("spname") == null ? "" : request.getParameter("spname");
            								String startspname = request.getParameter("startspname") == null ? "" : request.getParameter("startspname");
            								String endspname = request.getParameter("endspname") == null ? "" : request.getParameter("endspname");
            								HashMap mmm = new HashMap();
            							%> 
            							&nbsp;
            							出库日期 ：<input type='text' class='' size='10' name='startopdate' onclick='WdatePicker();'/>
										至 <input type='text' class='' size='10' name='endopdate' onclick='WdatePicker();' />&nbsp;&nbsp;
										物品名称：<input type='text' class='' id='wpname' size='50' name='spname'/>&nbsp;&nbsp;
										<input type='submit' class='' value='查询信息' />&nbsp;&nbsp;
									</td>
            					</tr>
          						<tr>
									<td height="28" 
										background="/productsys/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1">出库日期</td>
									<td height="28"
										background="/productsys/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1">物品编号</td>
									<td height="28"
										background="/productsys/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1">物品名称</td>
									<td height="28"
										background="/productsys/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1">出库数量</td>
									<td height="28"
										background="/productsys/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1">入库批次</td>
								</tr>
          						<%
          							new CommDAO().delete(request, "wpcrinfo");
          							if (request.getParameter("optypeid1") != null) {
          								new CommDAO().commOper("update wpcrinfo set optype ='' where id=" + request.getParameter("optypeid1"));
          							}
          							if (request.getParameter("optypeid2") != null) {
          								new CommDAO().commOper("update wpcrinfo set optype ='' where id=" + request.getParameter("optypeid2"));
          							}
          							String sql = "select * from wpcrinfo where 1=1 ";
          							if (!popdate.equals("")) {
          								sql += " and opdate like'%" + popdate + "%' ";
          							}
          							if (!startopdate.equals("")) {
          								mmm.put("startopdate", startopdate);
          								sql += " and opdate >'" + startopdate + "' ";
          							}
          							if (!endopdate.equals("")) {
          								mmm.put("endopdate", endopdate);
          								sql += " and opdate <'" + Info.getDay(endopdate, 1) + "' ";
          							}
          							
          							if (!pspname.equals("")) {
          								sql += " and spname like'%" + pspname + "%' ";
          							}
          							if (!startspname.equals("")) {
          								mmm.put("startspname", startspname);
          								sql += " and spname >'" + startspname + "' ";
          							}
          							if (!endspname.equals("")) {
          								mmm.put("endspname", endspname);
          								sql += " and spname <'" + Info.getDay(endspname, 1) + "' ";
          							}
          							
          							sql += "  and (1!=1 ";
          							sql += "  or  optype like'%出库%' ";
          							sql += "  ) ";
          							sql += " order by id desc ";
          							String url = "ckwpcrinfocx.jsp?1=1&opdate=" + popdate  + "&spname=" + pspname + "";
          							ArrayList<HashMap> list = PageManager.getPages(url, 5, sql, request);
          							for (HashMap map : list) {
          						%>
								<tr>
									<td height="30" valign="middle" bgcolor="#FFFFFF"
										class="STYLE1" align="center"><%=map.get("opdate")%></td>
									<td height="30" valign="middle" bgcolor="#FFFFFF"
										class="STYLE1" align="center"><%=map.get("wpno")%></td>
									<td height="30" valign="middle" bgcolor="#FFFFFF"
										class="STYLE1" align="center"><%=map.get("spname")%></td>
									<td height="30" valign="middle" bgcolor="#FFFFFF"
										class="STYLE1" align="center"><%=map.get("tnum")%></td>
									<td height="30" valign="middle" bgcolor="#FFFFFF"
										class="STYLE1" align="center"><%=map.get("pchi")%></td>
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
        				<td colspan=10 align="center" valign="middle"  class="STYLE1" >
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
		mmm.put("opdate",popdate); 
		mmm.put("spname",pspname); 
	%>
	<%=Info.tform(mmm)%> 
</body>
</html>