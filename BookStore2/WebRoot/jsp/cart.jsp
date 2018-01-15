<%@page import="javax.swing.text.Document"%>
<%@page import="org.springframework.beans.factory.annotation.Value"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
$(document).ready(function() {
	var value = 0;
	 $(":checkbox").each(function() {
		 var num= parseInt($(this).val());	
		 value += num;});
		 $("#total").text(value);
});
		
	



function changeNum(id,num){
	num = parseInt(num);
	
	if(num<1){
		if(confirm("是否确认要删除此商品？")){
			num = 0;
			location.href="${pageContext.request.contextPath}/cart/deleteOrder?orderId="+id;
		}else{
			num=1;
		}
	}
	location.href="${pageContext.request.contextPath}/cart/changeCounts?orderId="+id+"&count="+num;
}
		
function deleteOrder(id){
	
	
		if(confirm("是否确认要删除此商品？")){
			location.href="${pageContext.request.contextPath}/cart/deleteOrder?orderId="+id;}
		
		
		
	
	}


</script>

</head>

<body class="main">

	<jsp:include page="/jsp/head.jsp" />

	<jsp:include page="/jsp/menu_search.jsp" />


	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="jsp/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="666" height="89" />
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td><img src="images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="15%">序号</td>
													<td width="34%">商品名称</td>
													<td width="13%">价格</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="13%" >小计</td>
													<td width="8%">取消</td>
												</tr>
												
												<c:forEach items="${orderList}" var="o" >
												<tr class="books">
													<td width="15%">${o.getId()}</td>
													<td width="34%">${o.getGoods().getGoodsName()}</td>
													<td width="13%">${o.getGoods().getGoodsPrice()}</td>
													<td width="20%" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="button" value='-'  onclick="changeNum(${o.getId()},${o.getCount()-1 } )">
															${o.getCount()}<input
															type="button" value='+' 
															onclick="changeNum(${o.getId()},${o.getCount()+1 })"></td>
													<td width="13%" id="counts" >${o.getCount()* o.getGoods().getGoodsPrice()}</td>
													<td onclick="deleteOrder(${o.getId()},${o.getCount()-1 })">
													<input type="checkbox"  value="${ o.getCount()* o.getGoods().getGoodsPrice()}" style="display: none" >
													   <img alt="" src="images/quxiao.jpg" height="20px" width="20px">
													</td>
														
												</tr>
												
												</c:forEach>
											</table> 
											<c:if test="checkbox:checked">
												<c:set value="${o.getId()}" scope="request" var="booksId"/>
												
											</c:if>
									

											<table cellspacing="1" class="carttable">
												<tr>
													
													<td style="text-align:right; padding-right:40px;">  
													
													<font
												style="color:#FF6600; font-weight:bold">总计：<span id="total">
												${totals }
												</span>元</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
												<a
													href="${pageContext.request.contextPath}/jsp/index.jsp"><img
													src="images/gwc_jx.gif" border="0" /> </a>

												&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="${pageContext.request.contextPath}/cart/order">
													<img
													src="images/gwc_buy.gif" border="0" id="totalmoney" /> </a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="/jsp/foot.jsp" />


</body>
</html>
