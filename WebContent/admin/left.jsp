<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="util.Info"%> 
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}

.menu_title span {
	font-weight: bold; 
	left: 3px;
	color: #ffffff; 
	position: relative;
	top: 2px; 
}
.menu_title2 span {
	font-weight: bold;
	left: 3px; 
	color: #FFCC00; 
	position: relative; 
	top: 2px;
}

a { 
	text-decoration: none 
}
</style> 
 
<%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="images/main_40.gif">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td width="19%"></td>
        		<td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      		</tr>
    	</table>
    </td>
  </tr>
  <tr>
    <td valign="top">
       <%if(utype.equals("系统管理员")){ %>
          <%=Info.getCol("A","2","入库管理",null,null) %>
          <%=Info.getCol("C","2",null,null,"") %>
          <%=Info.getCol("B","2","入库清单","rkwpcrinfocx.jsp",null) %>
          <%=Info.getCol("B","2","入库操作","rukucaozuo.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          <%=Info.getCol("A","4","出库管理",null,null) %>
          <%=Info.getCol("C","4",null,null,"none") %>
          <%=Info.getCol("B","4","出库清单","ckwpcrinfocx.jsp",null) %>
          <%=Info.getCol("B","4","出库操作","chukucaozuo.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          
          <%=Info.getCol("A","1","库存管理",null,null) %>
          <%=Info.getCol("C","1",null,null,"none") %>
          <%=Info.getCol("B","1","仓库管理","basescx.jsp",null) %>
          <%=Info.getCol("B","1","物品类别管理","wptypescx.jsp",null) %>
          <%=Info.getCol("B","1","物品基本信息管理","wpjbxxcx.jsp",null) %>
          <%=Info.getCol("B","1","库存盘点","kcpd.jsp",null) %>
          <%=Info.getCol("B","1","库存预警","kcyj.jsp",null) %>
          <%=Info.getCol("B","1","库存报损","bswpcrinfocx.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          <%=Info.getCol("A","3","信息维护",null,null) %>
          <%=Info.getCol("C","3",null,null,"none") %>
          <%=Info.getCol("B","3","系统用户管理","sysusercx.jsp",null) %>
          <%=Info.getCol("B","3","修改个人信息","psysuserxg.jsp",null) %>
          <%=Info.getCol("B","3","修改登录密码","puppass.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          <%--  <%=Info.getCol("B","2","退货信息查看","thwpcrinfocx.jsp",null) %> 
          <%=Info.getCol("B","4","业务数据统计","ywsjtj.jsp",null) %> 
          <%=Info.getCol("B","1","供应商信息管理","gyssysusercx.jsp",null) %>
          <%=Info.getCol("B","1","客户信息管理","khsysusercx.jsp",null) %> --%> 
    <%} %>
    
       <%if(utype.equals("库存管理员")){ %>
          <%=Info.getCol("A","2","入库信息管理",null,null) %>
          <%=Info.getCol("C","2",null,null,"") %>
          <%=Info.getCol("B","2","入库清单","rkwpcrinfocx.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
           
          <%=Info.getCol("A","4","出库管理",null,null) %>
          <%=Info.getCol("C","4",null,null,"none") %>
          <%=Info.getCol("B","4","出库清单","ckwpcrinfocx.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
           
          <%=Info.getCol("A","1","库存管理",null,null) %>
          <%=Info.getCol("C","1",null,null,"none") %>
          <%=Info.getCol("B","1","仓库管理","basescx.jsp",null) %>
          <%=Info.getCol("B","1","物品类别管理","wptypescx.jsp",null) %>
          <%=Info.getCol("B","1","物品基本信息管理","wpjbxxcx.jsp",null) %>
          <%=Info.getCol("B","1","库存盘点","kcpd.jsp",null) %>
          <%=Info.getCol("B","1","库存预警","kcyj.jsp",null) %>
          <%=Info.getCol("B","1","库存报损","bswpcrinfocx.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          <%=Info.getCol("A","3","个人信息维护",null,null) %>
          <%=Info.getCol("C","3",null,null,"none") %>
          <%=Info.getCol("B","3","修改个人信息","psysuserxg.jsp",null) %>
          <%=Info.getCol("B","3","修改登录密码","puppass.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
    <%} %>
    
       	<%if(utype.equals("业务管理员")){ %>
         <%=Info.getCol("A","2","入库管理",null,null) %>
          <%=Info.getCol("C","2",null,null,"") %>
          <%=Info.getCol("B","2","入库清单","rkwpcrinfocx2.jsp",null) %>
          <%=Info.getCol("B","2","入库操作","rukucaozuo.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          <%=Info.getCol("A","4","出库管理",null,null) %>
          <%=Info.getCol("C","4",null,null,"none") %>
          <%=Info.getCol("B","4","出库清单","ckwpcrinfocx2.jsp",null) %>
          <%=Info.getCol("B","4","出库操作","chukucaozuo.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
          
          <%=Info.getCol("A","3","个人信息维护",null,null) %>
          <%=Info.getCol("C","3",null,null,"none") %>
          <%=Info.getCol("B","3","修改个人信息","psysuserxg.jsp",null) %>
          <%=Info.getCol("B","3","修改登录密码","puppass.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
    <%} %>
    
    
     
    </td>
  </tr>
  
  <tr>
    <td height="18" background="images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" valign="bottom"><div align="center" class="STYLE3">版本：2016V1.0</div></td>
      </tr>
    </table></td>
  </tr>
</table>
<script type="text/javascript">
	function showsubmenu(sid) {
		whichEl = eval("submenu" + sid);
		imgmenu = eval("imgmenu" + sid);
		if (whichEl.style.display == "none") {
			eval("submenu" + sid + ".style.display=\"\";");
			imgmenu.background = "images/main_47.gif";
		} else {
			eval("submenu" + sid + ".style.display=\"none\";");
			imgmenu.background = "images/main_48.gif";
		}
	}

	function go(purl) {
		parent.document.getElementsByTagName("iframe")[1].src = (purl);
	}
</script>
