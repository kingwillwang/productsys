<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
String uname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
 
uname = Info.getGBKStr(uname); 
HashMap map = new CommDAO().select("select * from gongzhi where uname='"+uname+"'").get(0);
 System.out.println("111111");
out.print(map.get("jbgz")+"-"+map.get("jxgz")+"-"+map.get("kc")+"-"+map.get("kcbei")+"-"+map.get("bt")+"-"+map.get("btbei"));
 
 

%>