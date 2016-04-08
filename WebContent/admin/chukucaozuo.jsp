<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出库操作</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<style type="text/css">
.chukubtn{
	width:200px;
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
<table width="100%" border="0px" cellspacing="0px" cellpadding="0px">
	<tr>
		<td height="2"></td>
	</tr>
	<tr>
		<td height="30px" background="/productsys/admin/tab/images/tab_05.gif">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="12px" height="30px">
						<img src="/productsys/admin/tab/images/tab_03.gif" width="12px" height="30px" />
					</td>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="46%" valign="middle">
									<table width="100%" border="0px" cellspacing="0px" cellpadding="0px">
										<tr>
											<td width="5%">
												<div align="center">
													<img src="/productsys/admin/tab/images/tb.gif" width="16px" height="16px" />
												</div>
											</td>
											<td width="95%" class="STYLE1">
												<span class="STYLE3">你当前的位置</span>：出库操作
											</td>
										</tr>
									</table>
								</td>
								<td width="54%">
									<table border="0px" align="right" cellpadding="0px" cellspacing="0px">
										<tr></tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td width="16px">
						<img src="/productsys/admin/tab/images/tab_07.gif" width="16px" height="30px" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<div align="center">
				<h1>请进行RFID扫描</h1>
				<img alt="RFID扫描" src="../admin/images/saomiao.gif">
			</div>
			<div align="center">
				<button type="button" class="btn btn-primary btn-lg chukubtn">出库</button>
			</div>
		</td>
	</tr>
</table>
</body>
</html>