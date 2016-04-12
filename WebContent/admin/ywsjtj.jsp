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
<title>业务统计</title>
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
<form  action="ywsjtj.jsp"  name="f1" method="post"    >
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
                									<span class="STYLE3">你当前的位置</span>： 业务数据统计
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
            							<td colspan='15' height="66" bgcolor="#FFFFFF" align="left" class="STYLE1">
            							<%
            								String poptype = request.getParameter("optype") == null ? "" : request.getParameter("optype");
            								String startoptype = request.getParameter("startoptype") == null ? "" : request.getParameter("startoptype");
            								String endoptype = request.getParameter("endoptype") == null ? "" : request.getParameter("endoptype");
            								String popdate = request.getParameter("opdate") == null ? "" : request.getParameter("opdate");
            								String startopdate = request.getParameter("startopdate") == null ? "" : request.getParameter("startopdate");
            								String endopdate = request.getParameter("endopdate") == null ? "" : request.getParameter("endopdate");
            								String pwpno = request.getParameter("wpno") == null ? "" : request.getParameter("wpno");
            								String startwpno = request.getParameter("startwpno") == null ? "" : request.getParameter("startwpno");
            								String endwpno = request.getParameter("endwpno") == null ? "" : request.getParameter("endwpno");
            								String pspname = request.getParameter("spname") == null ? "" : request.getParameter("spname");
            								String startspname = request.getParameter("startspname") == null ? "" : request.getParameter("startspname");
            								String endspname = request.getParameter("endspname") == null ? "" : request.getParameter("endspname");
            								String excelsql = " where 1=1 ";
            								String exceltj = "";
            								if (!poptype.equals("")) {
            									excelsql += " and optype like'%" + poptype + "%' ";
            									exceltj += "&optype=" + poptype;
            								}
            								if (!startoptype.equals("")) {
            									excelsql += " and optype >'" + startoptype + "' ";
            									exceltj += "&optype=" + startoptype;
            								}
            								if (!endoptype.equals("")) {
            									excelsql += " and optype <'" + Info.getDay(endoptype, 1) + "' ";
            									exceltj += "&optype=" + endoptype;
            								}
            								if (!popdate.equals("")) {
            									excelsql += " and opdate like'%" + popdate + "%' ";
            									exceltj += "&opdate=" + popdate;
            								}
            								if (!startopdate.equals("")) {
            									excelsql += " and opdate >'" + startopdate + "' ";
            									exceltj += "&opdate=" + startopdate;
            								}
            								if (!endopdate.equals("")) {
            									excelsql += " and opdate <'" + Info.getDay(endopdate, 1) + "' ";
            									exceltj += "&opdate=" + endopdate;
            								}
            								if (!pwpno.equals("")) {
            									excelsql += " and wpno like'%" + pwpno + "%' ";
            									exceltj += "&wpno=" + pwpno;
            								}
            								if (!startwpno.equals("")) {
            									excelsql += " and wpno >'" + startwpno + "' ";
            									exceltj += "&wpno=" + startwpno;
            								}
            								if (!endwpno.equals("")) {
            									excelsql += " and wpno <'" + Info.getDay(endwpno, 1) + "' ";
            									exceltj += "&wpno=" + endwpno;
            								}
            								if (!pspname.equals("")) {
            									excelsql += " and spname like'%" + pspname + "%' ";
            									exceltj += "&spname=" + pspname;
            								}
            								if (!startspname.equals("")) {
            									excelsql += " and spname >'" + startspname + "' ";
            									exceltj += "&spname=" + startspname;
            								}
            								if (!endspname.equals("")) {
            									excelsql += " and spname <'" + Info.getDay(endspname, 1) + "' ";
            									exceltj += "&spname=" + endspname;
            								}
            								excelsql += " ";
 											HashMap mmm = new HashMap();
										%>
										 &nbsp;&nbsp;
											货物流向： 
											<select name='optype'>
												<option value="">不限</option>
												<option value='入库'>入库</option>
												<option value='报损'>报损</option>
												<option value='出库'>出库</option>
												<option value='退货'>退货</option>
											</select>
											&nbsp;&nbsp;
											 日期：
											<input type='text' class='' size='10' name='startopdate' onclick='WdatePicker();' />
											至
											<input type='text' class='' size='10' name='endopdate' onclick='WdatePicker();' />
											&nbsp;&nbsp;  
											 物品编号 ： 
											 <%=Info.getselect("wpno","wpcrinfo","wpno"," 1=1 ")%>
											 &nbsp;&nbsp;
											物品名称 ： 
											<%=Info.getselect("spname","wpcrinfo","spname"," 1=1 ")%>
											&nbsp;&nbsp;
											<input type='submit' class='' value='查询信息' /> 
											&nbsp;&nbsp; 
											<input type='button' value='导出excel' class=''
													onclick="window.location.replace('ywsjtj.jsp?excel=excel<%=exceltj%>');" />
											&nbsp;&nbsp; 
											<%if(request.getParameter("excel")!=null){%> 
											<%List<List> excellist = new CommDAO().selectforlist("select * from wpcrinfo order by id desc ");%> 
											<%request.setAttribute("where",excelsql );%> 
											<%Info.writeExcel("wpcrinfo","optype-物品流向@opdate-日期@pchi-入库批次@wpno-物品编号@spname-物品名称@tnum-数量@jcontent-备注@cd-产地@cfwz-存放位置",excellist, request,  response); %> <%}%>
											</td>
            							</tr>
          								<tr>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">物品流向</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">日期</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">入库批次</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">物品编号</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">物品名称</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">数量</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">备注</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">产地</td>
											<td height="28"
												background="/productsys/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">存放位置</td>
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
												if (!poptype.equals("")) {
													sql += " and optype like'%" + poptype + "%' ";
												}
												if (!startoptype.equals("")) {
													mmm.put("startoptype", startoptype);
													sql += " and optype >'" + startoptype + "' ";
												}
												if (!endoptype.equals("")) {
													mmm.put("endoptype", endoptype);
													sql += " and optype <'" + Info.getDay(endoptype, 1) + "' ";
												}
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
												if (!pwpno.equals("")) {
													sql += " and wpno like'%" + pwpno + "%' ";
												}
												if (!startwpno.equals("")) {
													mmm.put("startwpno", startwpno);
													sql += " and wpno >'" + startwpno + "' ";
												}
												if (!endwpno.equals("")) {
													mmm.put("endwpno", endwpno);
													sql += " and wpno <'" + Info.getDay(endwpno, 1) + "' ";
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
												
												sql += " order by id desc ";
												String url = "ywsjtj.jsp?1=1&optype=" + poptype + "&opdate=" + popdate 
														 + "&wpno=" + pwpno + "&spname=" + pspname + "";
												ArrayList<HashMap> list = PageManager.getPages(url, 25, sql, request);
												int num = 0;
												double amt = 0;
												for (HashMap map : list) {
											%>
										<tr>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("optype")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("opdate")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("pchi")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("wpno")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("spname")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("tnum")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("jcontent")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("cd")%></td>
											<td height="30" valign="middle" bgcolor="#FFFFFF"
												class="STYLE1" align="center"><%=map.get("cfwz")%></td>
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
        				<td colspan=15 align="center" valign="middle"  class="STYLE1" >
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
	mmm.put("optype",poptype); 
	mmm.put("opdate",popdate); 
	mmm.put("wpno",pwpno); 
	mmm.put("spname",pspname); 
%>
<%=Info.tform(mmm)%> 
</body>
</html>