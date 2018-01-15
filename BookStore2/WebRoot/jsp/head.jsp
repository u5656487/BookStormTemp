<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../js/jquery-1.8.3.js" type="text/javascript"></script>



<div id="divhead">
	<table class="headtable">
		<tr>
			<td><a href="jsp/index.jsp"><img src="images/logo.png" width="95" height="30" border="0" /> </a></td>
			<td><a><img src="images/ad/fiveBoy.gif" width="270" height="50"></a></td>
			<td style="text-align:right" >
				<img src="images/cart.gif" width="26" height="23" style="margin-bottom:-4px" />
				&nbsp;
				<a href="cart/usercart">购物车</a> | 
				<a id="account" href="user/onlineTest">我的帐户</a>|
				<a href="jsp/register.jsp">新用户注册</a>| 
				<a href="jsp/login.jsp">用户登录|${user.username}</a>| 
				<br/>
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
	$("#account").click(function(){
		${user}
		if(${user}!=null){
			return true;
		}else{
			alert("您的注册信息不完整，请再次核对");
			return false;
		}
	});
</script>