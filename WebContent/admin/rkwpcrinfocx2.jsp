<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

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
<title>入库清单管理</title>
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
<form  action="rkwpcrinfocx.jsp"  name="f1" method="post">
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
													<span class="STYLE3">你当前的位置</span>：入库清单管理
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
									<td colspan=13 height="36" bgcolor="#FFFFFF" align="left" class="STYLE1"> 
										<%
 											String popdate = request.getParameter("opdate") == null ? "" : request.getParameter("opdate");
 											String startopdate = request.getParameter("startopdate") == null ? "" : request.getParameter("startopdate");
 											String endopdate = request.getParameter("endopdate") == null ? "" : request.getParameter("endopdate");
 											String pwpno = request.getParameter("wpno") == null ? "" : request.getParameter("wpno");
 											String startwpno = request.getParameter("startwpno") == null ? "" : request.getParameter("startwpno");
 											String endwpno = request.getParameter("endwpno") == null ? "" : request.getParameter("endwpno");
 											String pspname = request.getParameter("spname") == null ? "" : request.getParameter("spname");
 											String startspname = request.getParameter("startspname") == null ? "" : request.getParameter("startspname");
 											String endspname = request.getParameter("endspname") == null ? "" : request.getParameter("endspname");
 											/* String pgys = request.getParameter("gys") == null ? "" : request.getParameter("gys");
 											String startgys = request.getParameter("startgys") == null ? "" : request.getParameter("startgys");
 											String endgys = request.getParameter("endgys") == null ? "" : request.getParameter("endgys"); */
 										%> 
 										<% HashMap mmm = new HashMap();%> 
 										 入库日期：
 										<input type=text class='' size=10 name='startopdate' onclick='WdatePicker();' /> 
 										至
 										<input type=text class='' size=10 name='endopdate' onclick='WdatePicker();' /> 
 										
										物品编号：<%=Info.getselect("wpno","wpjbxx","wpno"," 1=1 ")%>
										物品名称：<%=Info.getselect("spname","wpjbxx","wpname"," 1=1 ")%>
										<%-- 供应商 ： <%=Info.getselect("gys","gysxx","gname"," 1=1 ")%> --%>
										&nbsp;
										<input type=submit class='' value='查询' /> 
										<input type=button class='' value='填写入库单' onclick="window.location.replace('rkwpcrinfotj.jsp')" />
											
										</td>
									</tr>



									<tr>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">入库日期</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">物品编号</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">物品名称</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">入库数量</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">当前数量</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">生产日期</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">产地</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">入库批次</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">存放位置</td>
										<td height="28"
											background="/productsys/admin/tab/images/bg.png"
											bgcolor="#FFFFFF" align="center" class="STYLE1">操作</td>
									</tr>



									<% 
new CommDAO().delete(request,"wpcrinfo"); 
if(request.getParameter("optypeid1")!=null){ 
 new CommDAO().commOper("update wpcrinfo set optype ='' where id="+request.getParameter("optypeid1"));  
} 
if(request.getParameter("optypeid2")!=null){ 
 new CommDAO().commOper("update wpcrinfo set optype ='' where id="+request.getParameter("optypeid2"));  
} 
String sql = "select * from wpcrinfo where 1=1 " ;
 if(!popdate.equals("")){ 
 sql+= " and opdate like'%"+popdate+"%' " ;
 }  
 if(!startopdate.equals("")){  
 mmm.put("startopdate",startopdate) ;
 sql+= " and opdate >'"+startopdate+"' " ;
 }  
 if(!endopdate.equals("")){  
 mmm.put("endopdate",endopdate) ;
 sql+= " and opdate <'"+Info.getDay(endopdate,1)+"' " ;
 }  
 if(!pwpno.equals("")){ 
 sql+= " and wpno like'%"+pwpno+"%' " ;
 }  
 if(!startwpno.equals("")){  
 mmm.put("startwpno",startwpno) ;
 sql+= " and wpno >'"+startwpno+"' " ;
 }  
 if(!endwpno.equals("")){  
 mmm.put("endwpno",endwpno) ;
 sql+= " and wpno <'"+Info.getDay(endwpno,1)+"' " ;
 }  
 if(!pspname.equals("")){ 
 sql+= " and spname like'%"+pspname+"%' " ;
 }  
 if(!startspname.equals("")){  
 mmm.put("startspname",startspname) ;
 sql+= " and spname >'"+startspname+"' " ;
 }  
 if(!endspname.equals("")){  
 mmm.put("endspname",endspname) ;
 sql+= " and spname <'"+Info.getDay(endspname,1)+"' " ;
 }  
 /* if(!pgys.equals("")){ 
 sql+= " and gys like'%"+pgys+"%' " ;
 }  
 if(!startgys.equals("")){  
 mmm.put("startgys",startgys) ;
 sql+= " and gys >'"+startgys+"' " ;
 }  
 if(!endgys.equals("")){  
 mmm.put("endgys",endgys) ;
 sql+= " and gys <'"+Info.getDay(endgys,1)+"' " ;
 }   */
  sql +="  and (1!=1 " ; 
  sql +="  or  optype like'%入库%' " ;
  sql +="  ) ";
  sql +=" order by id desc ";
/* String url = "rkwpcrinfocx.jsp?1=1&opdate="+popdate+"&wpno="+pwpno+"&spname="+pspname+"&gys="+pgys+"";  */
String url = "rkwpcrinfocx.jsp?1=1&opdate="+popdate+"&wpno="+pwpno+"&spname="+pspname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
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
											class="STYLE1" align="center"><%=map.get("nnum")%></td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center"><%=map.get("scdate")%></td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center"><%=map.get("cd")%></td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center"><%=map.get("pchi")%></td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center"><%=map.get("cfwz")%></td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center"><a
											href="rkwpcrinfoxg.jsp?id=<%=map.get("id")%>">修改</a>
											&nbsp;|&nbsp;<a onclick="return confirm('确定要删除这条记录吗?')" href="rkwpcrinfocx.jsp?scid=<%=map.get("id")%>">删除</a>
										</td>
									</tr>
									<%}%>


								</table></td>
							<td width="8"
								background="/productsys/admin/tab/images/tab_15.gif"
								class="STYLE1">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="35" background="/productsys/admin/tab/images/tab_19.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35">
								<img src="/productsys/admin/tab/images/tab_18.gif" width="12" height="35" />
							</td>
							<td colspan=13 align="center" valign="middle" class="STYLE1">
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
<script src="/productsys/js/ajax.js"></script>
	<%
		mmm.put("opdate", popdate);
		mmm.put("wpno", pwpno);
		mmm.put("spname", pspname);
		//mmm.put("gys", pgys);
	%>
	<%=Info.tform(mmm)%> 
	<%=Info.tform(mmm)%> 
<script  src='/productsys/js/My97DatePicker/WdatePicker.js'></script>
<script  src='/productsys/js/popup.js'></script>

<script type="text/javascript">
	function update(no) {
		pop('rkwpcrinfoxg.jsp?id=' + no, '信息修改', 550, '100%')
	}

	function add() {
		pop('rkwpcrinfotj.jsp', '信息添加', 550, '100%')
	}
</script>
</body>
</html>

