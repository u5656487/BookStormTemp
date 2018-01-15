<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="p" uri="http://www.springframework.org/tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="jsp/modifyuserinfo.jsp">用户信息修改</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="cart/order">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="user/outLogin">用戶退出</a></td>
						</tr>
						
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a >头像显示</a></td>
						</tr>
						<tr>
							<td class="listtd">
							<img src="upload/${user.account}" width="180" height="189" border="0" />
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="jsp/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="jsp/myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>


					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<form action="upload/fileUpload" method="post" enctype="multipart/form-data">
									<table width="100%" border="0" cellspacing="2" class="upline">
										<tr>
											<td  style="text-align:right">头像上传：</td>
											<td><input type="file" name="photo"/></td>
											<td><input type="submit"  value="上传"></td>
										</tr>
									</table>
								</form>
								<form action="user/updateUser" method="post">
									<input type="hidden" name="Uid" value="${user.uid }"/>
									<table width="100%" border="0" cellspacing="2" class="upline">
										<tr>
											<td style="text-align:right; width:20%">会员邮箱：</td>
											<td style="width:40%; padding-left:20px">${user.email }</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">会员名：</td>
											<td style="padding-left:20px">${user.username }</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">修改密码：</td>
											<td><input type="password" name="password"
												class="textinput" /></td>
											<td><font color="#999999">密码设置至少6位，请区分大小写</font></td>
										</tr>
										<tr>
											<td style="text-align:right">重复密码：</td>
											<td><input type="password" name="repassword" class="textinput" /></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">性别：</td>
											<td colspan="2">&nbsp;&nbsp;<input type="radio"
												name="gender" value="男" ${u.gender== "男"? "checked='checked' ":"" } />
												男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="radio" name="gender" value="女" ${u.gender==
												"女"? "checked='checked' ":"" } /> 女</td>
										</tr>
										<tr>
											<td style="text-align:right">联系方式：</td>
											<td colspan="2"><input name="phone" type="text"
												value="${user.phone }" class="textinput" /></td>
										</tr>

										<tr>
											<td style="text-align:right">地址：</td>
											<td colspan="2"><input name="phone" type="text"
												value="${user.address }" class="textinput" /></td>
										</tr>
										<tr>
											<td style="text-align:right">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>

									<p style="text-align:center">
										<input type="image" src="images/botton_gif_025.gif" border="0">
									</p>
									<p style="text-align:center">&nbsp;</p>
								</form>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
