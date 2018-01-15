<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />

</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="jsp/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${gsu.goodsType }&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;图书列表
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>${gsu.goodsType}</h1>&nbsp;&nbsp;&nbsp;&nbsp;共${gsu.goodsNum}种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="images/productlist.gif" width="100%" height="38" />
								</div>

								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach items="${gsu.goodsList }" var="b">
											<td>
												<div class="divbookpic">
													<p>
														<a href="goods/searchById?goodsId=${b.goodsId}"> 
															<img src="images/bookcover/${b.image}"width="115" height="129" border="0" />
														</a>
													</p>
												</div>

												<div class="divlisttitle">
													<a href="goods/searchById?goodsId=${b.goodsId}">
														书名:${b.goodsName}<br />售价:${b.goodsPrice }
													</a>
												</div>
											</td>
										</c:forEach>

									</tr>
								</table>

								<div class="pagination" style="margin: auto">
									<ul>
										<li class="nextPage"><a href="javascript:void(0);"
											onclick="goPage(${gsu.currentPage-1})">&lt;&lt;上一页</a></li>
										<li>第${gsu.currentPage }页/共${gsu.totalPages }页</li>
										<li class="nextPage"><a href="javascript:void(0);"
											onclick="goPage(${gsu.currentPage+1})">下一页&gt;&gt;</a></li>
									</ul>
								</div>

							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
	<script type="text/javascript">
	function goPage(page) {
		//判断输入的值是否超限
		if (page < 1) {
			page = 1;
		} else {
			if (page > ${gsu.totalPages}) {
				page = ${gsu.totalPages};
			}
		}
		
		location.href = "goods/search?currentPage="+page+"&goodsType=${gsu.goodsType}&goodsName=${gsu.goodsName}"; 
			
	}
</script>
</body>
</html>
