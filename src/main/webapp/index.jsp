<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
	<script src="resources/js/jquery-1.12.4.min.js"></script>
	<script src="resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script src="resources/js/echarts.min.js"></script>

	<title>Insert title here</title>
</head>
<body class="container">
	<ol>
		<li>
			<h3>基础报表 </h3>
			<ul>
				<li><a href="jsps/basic/charts1.jsp" target="_blank">柱状图</a></li>
				<li>
					<a href="jsps/basic/charts2.jsp" target="_blank">南丁格尔图(基础饼状图)</a>
					<ul>
						<li><a href="jsps/basic/charts3.jsp" target="_blank">南丁格尔图(调整半径大小)</a></li>
						<li><a href="jsps/basic/charts4.jsp" target="_blank">南丁格尔图(增加阴影,设置饼的颜色)</a></li>
						<li><a href="jsps/basic/charts5.jsp" target="_blank">南丁格尔图(浅色背景和浅色标签)</a></li>
						<li><a href="jsps/basic/charts6.jsp" target="_blank">南丁格尔图(设置扇形的颜色)</a></li>
					</ul>
				</li>
			</ul>
		</li>
		<li>
			<h3>异步数据加载和更新 </h3>
			<ul>
				<li><a href="jsps/sync/sync1.jsp" target="_blank">完整异步加载</a></li>
				<li><a href="jsps/sync/sync2.jsp" target="_blank">完整异步等待动画</a></li>
			</ul>
		</li>
		<li>
			<h3>散点图 </h3>
			<ul>
				<li><a href="jsps/scatter/scatter1.jsp" target="_blank">散点图</a></li>
				<li><a href="jsps/sync/sync2.jsp" target="_blank">完整异步等待动画</a></li>
			</ul>
		</li>
	</ol>

</body>
</html>