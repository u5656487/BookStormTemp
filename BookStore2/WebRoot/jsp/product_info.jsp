<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function() {
	$("#buy").click(function() {
		var url = "cart/addcart?goodsid=${goods.goodsId }";
		$.ajax({
			url : url,
			type : "post",
			
			success : function(data) {
				alert("添加购物车成功！");
			},
				});
	});
});
</script>
</head>


<body class="main">

	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />
	
	<div id="divpagecontent">

		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="#">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="#">&nbsp;${goods.goodsType }</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${goods.goodsName }
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="645" height="84" />

								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">

											<div class="divbookcover">
												<p>
													<img src="images/bookcover/${goods.image }" width="213" height="269" border="0" />
												</p>
											</div>

											<div style="text-align:center; margin-top:25px">
												<img src="images/buybutton.gif" border="0"  id="buy"/>
											</div>
											<div style="text-align:center; margin-top:25px">
												${addmessage}
											</div>
										</td>
										<td style="padding:20px 5px 5px 5px"><img
											src="images/miniicon3.gif" width="16" height="13" /><font
											class="bookname">&nbsp;&nbsp;${goods.goodsName }</font>

											<hr />售价：<font color="#FF0000">￥:${goods.goodsPrice }元</font>
											<hr /> 类别：${goods.goodsType }

											<hr />
											<p>
												<b>内容简介：</b>
											</p>${goods.description }</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>


	<jsp:include page="foot.jsp" />


</body>
</html>
