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
	<div class="container" id="main" style="width:600px;height: 480px;border: 1px solid red;">
	</div>
	
</body>
<script type="text/javascript">
	//基于准备好的dom，初始化Echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	
	//执行图表的配置项和数据
	var option = {
			
		series:[
	        {
	        	name:'访问来源',
	        	type:'pie',
	        	radius:'55%',
	        	data:[
	        		{value:400,name:'搜索引擎'},
	        		{value:335,name:'直接访问'},
	        		{value:310,name:'邮件营销'},
	        		{value:274,name:'联盟广告'},
	        		{value:235,name:'频广告'},
	        	]
	        }
		]
	}
	
	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option);	
</script>
</html>