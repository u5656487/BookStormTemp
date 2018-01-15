<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="js/my.js">
	
</script>
<script type="text/javascript">

	function fillNameValue(subDiv) {
		document.getElementById("name").value = subDiv.innerHTML;
		
		document.getElementById("content").style.display="none";
	}
	
	function search(){
		var name = document.getElementById("name").value;
		if(name != ''){
			location.href = "goods/search?goodsName="+name;	
		}
		
	}

	
	function changeBackground_over(div){
		div.style.background="gray";
	}
	
	function changeBackground_out(div){
		div.style.background="white";
	}
//-->
</script>

<div id="divmenu">
	<a
		href="goods/search?goodsType=文学">文学</a>
	<a
		href="goods/search?goodsType=生活">生活</a>
	<a
		href="goods/search?goodsType=计算机">计算机</a>
	<a
		href="goods/search?goodsType=外语">外语</a>
	<a
		href="goods/search?goodsType=经营">经管</a>
	<a
		href="goods/search?goodsType=励志">励志</a>
	<a
		href="goods/search?goodsType=社科">社科</a>
	<a
		href="goods/search?goodsType=学术">学术</a>
	<a
		href="goods/search?goodsType=少儿">少儿</a>
	<a
		href="goods/search?goodsType=艺术">艺术</a>
	<a
		href="goods/search?goodsType=原版">原版</a>
	<a
		href="goods/search?goodsType=科技">科技</a>
	<a
		href="goods/search?goodsType=考试">考试</a>
	<a
		href="goods/search?goodsType=生活百科">生活百科</a>
	<a href="goods/search?goodsType=全部商品" style="color:#FFFF00">全部商品目录</a>
</div>
<div id="divsearch">
	
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td style="text-align:right; padding-right:220px">
				Search 
				<input type="text" name="name" class="inputtable" onkeyup="searchName();" id="name" /> 
				<input type="image" src="images/serchbutton.gif" style="margin-bottom:-4px" onclick="search()">
				</td>
			</tr>
		</table>

</div>
<div id="content"
	style="background-color:white;width:128px; text-align:left;margin-left:945px;color:black;float:left;margin-top: -20px;display: none">
</div>