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
	<title>bookStore注册页面</title>
	<%--导入css --%>
	<link rel="stylesheet" href="css/main.css" type="text/css" />

</head>
	<script type="text/javascript" src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">
	function changeImage() {
		
		document.getElementById("img").src = "authCode/code?time="
				+ new Date().getTime();
	}

	


	$(function(){	
		
		$("#username").blur(function(){
			namePass();
		});
		
		$("#password").blur(function(){
			pwdPass();
		});
		
		$("#rePassword").blur(function(){
			repwdPass();
		});
		
		$("#email").blur(function(){
			emailPass();
		});
		
		$("#ckcode").blur(function(){
			checkword();
		});
		
		
		var np = false;
		var pp = false;
		var rep = false;
		var ep = false;
		$("#btn").click(function(){
			if(np == true && pp == true && rep == true && ep == true){
				return true;
			}else{
				alert("您的注册信息不完整，请再次核对");
				return false;
			}
		});
			var url = "register/check";	//路径	
			
			
		function checkword(){
			var mess ='${checkcode_session}';
			
			data:mess,
			$.ajax({					
				success:function(){	
					alert('${checkcode_session}');
					if($("#ckcode").val() == null||$("#ckcode").val()==""){
						$("#ckcode_check").text("验证码不能为空").show().css("color","red");
					}else if($("#ckcode").val() == mess){					
						$("#ckcode_check").text("验证码正确").show().css("color","green");	
					}else{
						$("#ckcode_check").text("验证码错误").show().css("color","red");	
					}			
				},			
			});	
		}
			
			
			
			function namePass(){
				var un = $("#username").val();		
			$.ajax({			
				url:url,
				data:{"tryname":un},//发送数据											
				success:function(datas){	
					var  unzz = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;						
					if(un == ""){
						$("#username_msg").text("名字未输入").show().css("color","red");
					}else if(!unzz.test(un)){
						$("#username_msg").text("名字为4-15位字母数字且字母开头").show().css("color","red");
					}else if(datas=="true"){
						$("#username_msg").text("名字已经存在").show().css("color","red");
					}else{
						np = true;
						$("#username_msg").text("验证正确").show().css("color","green");	
					};		
				},			
			});	
		}
				
				
			function pwdPass(){	
			$.ajax({
				url:url,								
				success:function(){	
					var pwd = $("#password").val();
					var  pwdzz = /^[a-zA-Z0-9]{6,15}$/;
					if(pwd == ""){
						$("#password_msg").text("密码未输入").show().css("color","red");
					}else if(!pwdzz.test(pwd)){
						$("#password_msg").text("密码为6-15位字母数字").show().css("color","red");
					}else{
						pp = true;
						$("#password_msg").text("验证正确").show().css("color","green");	
					}					
				},			
			});	
		}
				
				
				
			function repwdPass(){	
			$.ajax({
				url:url,										
				success:function(){		
					var repwd = $("#rePassword").val();
					if(repwd == null || repwd ==''){
						$("#rePassword_msg").text("验证为空").show().css("color","red");	
					}else if(repwd == $("#password").val()){					
						rep = true;
						$("#rePassword_msg").text("验证正确").show().css("color","green");	
					}else{
						$("#rePassword_msg").text("验证错误或空").show().css("color","red");	
					}				
				},			
			});	
		}
				
				
			function emailPass(){	
				$.ajax({
					url:url,										
					success:function(){		
						
						var em = $("#email").val();
						var  emzz = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
						if(em == ""){
							$("#email_msg").text("邮箱未输入").show().css("color","red");
						}else if(!emzz.test(em)){
							$("#email_msg").text("邮箱不符合规则").show().css("color","red");
						}else{
							ep = true;
							$("#email_msg").text("验证正确").show().css("color","green");	
						}			
					},			
				});	
			}
		});

			function submit(){
				var un = $("#username").val();		
			$.ajax({			
				url:url,
				data:{"tryname":un},//发送数据											
				success:function(datas){											
					var  unzz = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;						
					if(un == ""){
						$("#username_msg").text("名字未输入").show().css("color","red");
					}else if(!unzz.test(un)){
						$("#username_msg").text("名字为4-15位字母数字且字母开头").show().css("color","red");
					}else if(datas=="true"){
						$("#username_msg").text("名字已经存在").show().css("color","red");
					}else{
						$("#username_msg").text("验证正确").show().css("color","green");	
					};				
				},			
			});	
		}
	
	</script>

<body class="main">
	<%@include file="head.jsp"%>
	<%--导入头 --%>
	<%@include file="menu_search.jsp"%><%--导入导航条与搜索 --%>

	<div id="divcontent">
		<form action="register/reg?" method="post">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px">
						<h1>新会员注册 ${user_msg }</h1>
						
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">会员邮箱：</td>
								<td style="width:40%">
								<input type="text" class="textinput" id="email"
									name="email" /></td>
								<td><font id="email_msg" color="#999999">*必填项--请输入有效的邮箱地址</font></td>
							</tr>
							<tr>
								<td style="text-align:right">会员名：</td>
								<td>
									<input type="text" class="textinput" id="username" name="username" />
								</td>
								<td><font id="username_msg" color="#999999">*必填项--用户名设置至少6位</font></td>
							</tr>
							<tr>
								<td style="text-align:right">密码：</td>
								<td><input type="password" class="textinput" id="password"
									name="password" /></td>
								<td><font id="password_msg" color="#999999">*必填项--密码设置至少6位</font></td>
							</tr>
							<tr>
								<td style="text-align:right">重复密码：</td>
								<td><input type="password" class="textinput" id="rePassword"
									name="repassword" /></td>
								<td><font id="rePassword_msg" color="#999999">*必填项--两次密码必须一致</font></td>
							</tr>
							<tr>
								<td style="text-align:right">性别：</td>
								<td colspan="2">&nbsp;&nbsp;<input type="radio"
									name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="gender" value="女" /> 女</td>
							</tr>
							<tr>
								<td style="text-align:right">联系电话：</td>
								<td colspan="2"><input type="text" class="textinput"
									style="width:350px" name="telephone" /></td>
							</tr>
							<tr>
								<td style="text-align:right">详细地址：</td>
								<td colspan="2"><textarea class="textarea" name="introduce"></textarea>
								</td>
							</tr>

						</table>



						<h1>注册校验</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">输入校验码：</td>
								<td style="width:50%"><input type="text" class="textinput" name="ckcode" id="ckcode"/>
								</td>
								<td><font id="ckcode_check" color="#999999">*必填项--验证码</font></td>
							</tr>
							<tr>
								<td style="text-align:right;width:20%;">&nbsp;</td>
								<td colspan="2" style="width:50%"><img
									src="authCode/code" width="180"
									height="30" class="textinput" style="height:30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
					
								</td>
							</tr>
						</table>



						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top:20px; text-align:center"><input id="btn"
									type="image" src="images/signup.gif" name="submit" border="0">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>



	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" /></td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a></td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2018 &copy; eShop All Rights RESERVED.</b> </font></td>
			</tr>
		</table>
	</div>


</body>
</html>
