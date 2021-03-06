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
</head>
<body class="container">
	<!-- 为ECharts准备一个具备大小(宽高的dom) -->
	<div class="container" id="main" style="width: 1000px;height:600px;border: 1px solid">
	
	</div>
</body>
<script type="text/javascript">
	// 基于准备好的dom，初始化Echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	
	//执行图表的配置项和数据
	var option = {
		title : {
			show : true,//是否显示
			text : '男性女性身高体重分布',//主标题文字
			link : 'http://www.baidu.com',//主标题文本超链接。
			target : 'self',//可选blank，默认blank
			textStyle:{
				color:'#333',//主标题文字的颜色。
				fontStyle:'normal',//主标题样式italic,oblique,normal*
				fontSize:18//主标题字体大小，默认18
			},
			subtext : '抽样调查来自: Heinz  2003',//副标题文字(在link,target,textStyle前面添加sub即为副标题进行处理)
			padding:[0,10,0,20],//标题内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
			itemGap:10,//主副标题之前的间距，默认5
			//zlevel z
			left:'auto',//grid 组件离容器左侧的距离left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
				//如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
			//和left类似，还有center，right,bottom
			//backgroundColor:'#ccc',//标题背景色，默认transparent，透明
			borderColor:'rgba(128, 128, 128, 0.5)'//标题的边框的颜色
		},
		grid : {
			left : '3%',
			right : '7%',
			bottom : '3%',
			containLabel : true//grid 区域是否包含坐标轴的刻度标签，在无法确定坐标轴标签的宽度，容器有比较小无法预留较多空间的时候，可以设为 true 防止标签溢出容器。
			
		},
		xAxis : [ {
			type : 'value',//坐标轴类型，value，数值轴，适用于连续数据。
			//'category'类目轴，适用于离散的类目数据，为该类型时必须通过 data 设置类目数据。
			// time 时间轴，适用于连续的时序数据，与数值轴相比时间轴带有时间的格式化，在刻度计算上也有所不同，例如会根据跨度的范围来决定使用月，星期，日还是小时范围的刻度。
			// log' 对数轴。适用于对数数据
			position:'bottom',//坐标轴位置，可选top
			name:'身高',//坐标轴名称
			//nameTextStyle(color,fontStyle,fontWeight,fontFamily,fontSize)
			nameLocation:'middle',//坐标轴显示位置，可选start，end。
			nameGap:20,//坐标轴名称和轴的距离，默认15
			inverse:false,//是否是反向坐标系，默认false
			//max:'dataMax',最大刻度
			//min:'dataMin',//最小刻度
			boundaryGap:['10%','10%'],//坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样。
			//类目轴中 boundaryGap 可以配置为 true 和 false。默认为 true，这时候刻度只是作为分隔线，标签和数据点都会在两个刻度之间的带(band)中间。
			//非类目轴，包括时间，数值，对数轴，boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。
			
			scale : true,//是否是脱离 0 值比例。设置成 true 后坐标刻度不会强制包含零刻度。在双数值轴的散点图中比较有用。 在设置 min 和 max 之后该配置项无效。
			minInterval:1,//自动计算的坐标轴最小间隔大小 例如可以设置成1保证坐标轴分割刻度显示成整数。
			axisLine :{//坐标轴轴线相关设置
				show:true,//是否显示坐标轴轴线。
				lineStyle:{//坐标轴线的样式
					color:'#333',//颜色
					width:2,//宽度,默认1
					type:'dashed'//线的样式，可选solid(默认),dashed,dotted
				}
			},
			axisLabel : {//坐标轴刻度标签的相关设置。
				show:true,
				inside:false,//刻度标签是否朝内，默认朝外。
				rotate:-20,//刻度标签旋转的角度，在类目轴的类目标签显示不下的时候可以通过旋转防止标签之间重叠。 旋转的角度从 -90 度到 90 度
				margin:8,//刻度标签与轴线之间的距离。默认8
				formatter : '{value} cm',
				textStyle:{
					color:function(val){
						return val >= 170 ? 'green' : 'red';
					}
				}
			},
			/* splitLine : {//在坐标系中的分割线设置
				show:true,
				lineStyle : {
					type : 'dashed',//'solid','dashed','dotted'
					color: ['red', 'green','gray','black'],//使用深浅的间隔色
				}
			}, */
			splitArea:{//在坐标系中的分割区域，默认不显示
				show:true
			},
			//data:[]类目数据，在类目轴（type: 'category'）中有效。,只有在category类型的坐标轴中才有用
		} ],
		yAxis : [ {
			type : 'value',
			scale : true,
			name:'体重',
			nameLocation:'middle',//坐标轴显示位置，可选start，end。
			nameGap:30,//坐标轴名称和轴的距离，默认15
			axisLabel : {
				formatter : '{value} kg',
				rotate:70
			},
			splitLine : {
				lineStyle : {
					type : 'dashed'
				}
			}
		} ],
		dataZoom:[
       		{//x轴坐标系内缩放
       			type:'inside',
       			show:true,
       			xAxisIndex:[0],
       			startValue:150,
       			endValue:180,
       		},
       		
       		{//y轴坐标系内缩放
       			type:'inside',
       			show:true,
       			yAxisIndex:[0],
       			startValue:50,
       			endValue:80,
       		},
       		{//y轴拖动缩放
       			type:'slider',
       			show:true,
       			yAxisIndex:[0],
       			startValue:50,
       			endValue:80,
       			fillerColor:'rgba(47,69,240,0.25)',//选中范围的填充颜色
       			handleColor:'rgba(47,69,240,0.8)',
       			showDetail:false,
       	//		top:'5%',
       	//		bottom:'50%'
       		}
		],
		/* visualMap:{
			type: 'continuous',
	        min: 30,
	        max: 200,
	        text:['High','Low'],
	        range: [50, 120],
	        realtime: false,
	        inverse:false,//是否反转
	        calculable : true,//是否启用手柄控制大小
	       inRange: {//inRange 能定义目标系列（参见 .seriesIndex）视觉形式，也同时定义了 本身的视觉样式。通俗来讲就是，假如控制的是散点图，那么 inRange 同时定义了散点图的 颜色、尺寸 等，也定义了 ` 本身的颜色、尺寸` 等。这二者能对应上。
	            color: ['orangered','yellow','lightskyblue'],
	           // symbolSize: [3, 30]
	        }, 
	        orient:'vertical',
	        outOfRange: {
	            color: ['red'],
	            symbolSize: [3, 30]
	        }
	     //   color: ['orangered','yellow','lightskyblue']
		}, */
		tooltip : {
			trigger : 'axis',//可选item
			showDelay : 0,//显示延迟
		//	hideDelay : 2000,//隐藏延迟
			enterable:true,
			formatter : function(params) {
				if(params.componentType == 'markLine'){
					if(params.dataIndex==1){
						return params.seriesName + ' :<br/>' + params.name + ' : '
						+ params.value + 'cm ';
					} else {
						return params.seriesName + ' :<br/>' + params.name + ' : '
						+ params.value + 'kg ';
					}
					
				} else {
					if (params.value.length > 1) {
						return params.seriesName + ' :<br/>' + params.value[0]
								+ 'cm ' + params.value[1] + 'kg ';
					} else {
						return params.seriesName + ' :<br/>' + params.name + ' : '
								+ params.value + 'kg ';
					}
				}
			},
			transitionDuration:0.4,//过度动画
			axisPointer : {
				show : true,
				type : 'cross',
				lineStyle : {
					type : 'dashed',
					width : 1
				}
			}
		},
		toolbox:{
			show:true,
			feature:{
				dataZoom:{},
				magicType: {
			        type: ['line', 'bar', 'stack', 'tiled']
			    },
				restore:{},
				saveAsImage:{},
				//dataView:{}//数据视图
				
			}
		},
		legend : {
			data : [ '女性', '男性' ],
			left : 'center'
		},
		
		series : [
				{
					name : '女性',
					type : 'scatter',
					data : [ [ 161.2, 51.6 ], [ 167.5, 59.0 ], [ 159.5, 49.2 ],
							[ 157.0, 63.0 ], [ 155.8, 53.6 ], [ 170.0, 59.0 ],
							[ 159.1, 47.6 ], [ 166.0, 69.8 ], [ 176.2, 66.8 ],
							[ 160.2, 75.2 ], [ 172.5, 55.2 ], [ 170.9, 54.2 ],
							[ 172.9, 62.5 ], [ 153.4, 42.0 ], [ 160.0, 50.0 ],
							[ 147.2, 49.8 ], [ 168.2, 49.2 ], [ 175.0, 73.2 ],
							[ 157.0, 47.8 ], [ 167.6, 68.8 ], [ 159.5, 50.6 ],
							[ 175.0, 82.5 ], [ 166.8, 57.2 ], [ 176.5, 87.8 ],
							[ 170.2, 72.8 ], [ 174.0, 54.5 ], [ 173.0, 59.8 ],
							[ 179.9, 67.3 ], [ 170.5, 67.8 ], [ 160.0, 47.0 ],
							[ 154.4, 46.2 ], [ 162.0, 55.0 ], [ 176.5, 83.0 ],
							[ 160.0, 54.4 ], [ 152.0, 45.8 ], [ 162.1, 53.6 ],
							[ 170.0, 73.2 ], [ 160.2, 52.1 ], [ 161.3, 67.9 ],
							[ 166.4, 56.6 ], [ 168.9, 62.3 ], [ 163.8, 58.5 ],
							[ 167.6, 54.5 ], [ 160.0, 50.2 ], [ 161.3, 60.3 ],
							[ 167.6, 58.3 ], [ 165.1, 56.2 ], [ 160.0, 50.2 ],
							[ 170.0, 72.9 ], [ 157.5, 59.8 ], [ 167.6, 61.0 ],
							[ 160.7, 69.1 ], [ 163.2, 55.9 ], [ 152.4, 46.5 ],
							[ 157.5, 54.3 ], [ 168.3, 54.8 ], [ 180.3, 60.7 ],
							[ 165.5, 60.0 ], [ 165.0, 62.0 ], [ 164.5, 60.3 ],
							[ 156.0, 52.7 ], [ 160.0, 74.3 ], [ 163.0, 62.0 ],
							[ 165.7, 73.1 ], [ 161.0, 80.0 ], [ 162.0, 54.7 ],
							[ 166.0, 53.2 ], [ 174.0, 75.7 ], [ 172.7, 61.1 ],
							[ 167.6, 55.7 ], [ 151.1, 48.7 ], [ 164.5, 52.3 ],
							[ 163.5, 50.0 ], [ 152.0, 59.3 ], [ 169.0, 62.5 ],
							[ 164.0, 55.7 ], [ 161.2, 54.8 ], [ 155.0, 45.9 ],
							[ 170.0, 70.6 ], [ 176.2, 67.2 ], [ 170.0, 69.4 ],
							[ 162.5, 58.2 ], [ 170.3, 64.8 ], [ 164.1, 71.6 ],
							[ 169.5, 52.8 ], [ 163.2, 59.8 ], [ 154.5, 49.0 ],
							[ 159.8, 50.0 ], [ 173.2, 69.2 ], [ 170.0, 55.9 ],
							[ 161.4, 63.4 ], [ 169.0, 58.2 ], [ 166.2, 58.6 ],
							[ 159.4, 45.7 ], [ 162.5, 52.2 ], [ 159.0, 48.6 ],
							[ 162.8, 57.8 ], [ 159.0, 55.6 ], [ 179.8, 66.8 ],
							[ 162.9, 59.4 ], [ 161.0, 53.6 ], [ 151.1, 73.2 ],
							[ 168.2, 53.4 ], [ 168.9, 69.0 ], [ 173.2, 58.4 ],
							[ 171.8, 56.2 ], [ 178.0, 70.6 ], [ 164.3, 59.8 ],
							[ 163.0, 72.0 ], [ 168.5, 65.2 ], [ 166.8, 56.6 ],
							[ 172.7, 105.2 ], [ 163.5, 51.8 ], [ 169.4, 63.4 ],
							[ 167.8, 59.0 ], [ 159.5, 47.6 ], [ 167.6, 63.0 ],
							[ 161.2, 55.2 ], [ 160.0, 45.0 ], [ 163.2, 54.0 ],
							[ 162.2, 50.2 ], [ 161.3, 60.2 ], [ 149.5, 44.8 ],
							[ 157.5, 58.8 ], [ 163.2, 56.4 ], [ 172.7, 62.0 ],
							[ 155.0, 49.2 ], [ 156.5, 67.2 ], [ 164.0, 53.8 ],
							[ 160.9, 54.4 ], [ 162.8, 58.0 ], [ 167.0, 59.8 ],
							[ 160.0, 54.8 ], [ 160.0, 43.2 ], [ 168.9, 60.5 ],
							[ 158.2, 46.4 ], [ 156.0, 64.4 ], [ 160.0, 48.8 ],
							[ 167.1, 62.2 ], [ 158.0, 55.5 ], [ 167.6, 57.8 ],
							[ 156.0, 54.6 ], [ 162.1, 59.2 ], [ 173.4, 52.7 ],
							[ 159.8, 53.2 ], [ 170.5, 64.5 ], [ 159.2, 51.8 ],
							[ 157.5, 56.0 ], [ 161.3, 63.6 ], [ 162.6, 63.2 ],
							[ 160.0, 59.5 ], [ 168.9, 56.8 ], [ 165.1, 64.1 ],
							[ 162.6, 50.0 ], [ 165.1, 72.3 ], [ 166.4, 55.0 ],
							[ 160.0, 55.9 ], [ 152.4, 60.4 ], [ 170.2, 69.1 ],
							[ 162.6, 84.5 ], [ 170.2, 55.9 ], [ 158.8, 55.5 ],
							[ 172.7, 69.5 ], [ 167.6, 76.4 ], [ 162.6, 61.4 ],
							[ 167.6, 65.9 ], [ 156.2, 58.6 ], [ 175.2, 66.8 ],
							[ 172.1, 56.6 ], [ 162.6, 58.6 ], [ 160.0, 55.9 ],
							[ 165.1, 59.1 ], [ 182.9, 81.8 ], [ 166.4, 70.7 ],
							[ 165.1, 56.8 ], [ 177.8, 60.0 ], [ 165.1, 58.2 ],
							[ 175.3, 72.7 ], [ 154.9, 54.1 ], [ 158.8, 49.1 ],
							[ 172.7, 75.9 ], [ 168.9, 55.0 ], [ 161.3, 57.3 ],
							[ 167.6, 55.0 ], [ 165.1, 65.5 ], [ 175.3, 65.5 ],
							[ 157.5, 48.6 ], [ 163.8, 58.6 ], [ 167.6, 63.6 ],
							[ 165.1, 55.2 ], [ 165.1, 62.7 ], [ 168.9, 56.6 ],
							[ 162.6, 53.9 ], [ 164.5, 63.2 ], [ 176.5, 73.6 ],
							[ 168.9, 62.0 ], [ 175.3, 63.6 ], [ 159.4, 53.2 ],
							[ 160.0, 53.4 ], [ 170.2, 55.0 ], [ 162.6, 70.5 ],
							[ 167.6, 54.5 ], [ 162.6, 54.5 ], [ 160.7, 55.9 ],
							[ 160.0, 59.0 ], [ 157.5, 63.6 ], [ 162.6, 54.5 ],
							[ 152.4, 47.3 ], [ 170.2, 67.7 ], [ 165.1, 80.9 ],
							[ 172.7, 70.5 ], [ 165.1, 60.9 ], [ 170.2, 63.6 ],
							[ 170.2, 54.5 ], [ 170.2, 59.1 ], [ 161.3, 70.5 ],
							[ 167.6, 52.7 ], [ 167.6, 62.7 ], [ 165.1, 86.3 ],
							[ 162.6, 66.4 ], [ 152.4, 67.3 ], [ 168.9, 63.0 ],
							[ 170.2, 73.6 ], [ 175.2, 62.3 ], [ 175.2, 57.7 ],
							[ 160.0, 55.4 ], [ 165.1, 104.1 ], [ 174.0, 55.5 ],
							[ 170.2, 77.3 ], [ 160.0, 80.5 ], [ 167.6, 64.5 ],
							[ 167.6, 72.3 ], [ 167.6, 61.4 ], [ 154.9, 58.2 ],
							[ 162.6, 81.8 ], [ 175.3, 63.6 ], [ 171.4, 53.4 ],
							[ 157.5, 54.5 ], [ 165.1, 53.6 ], [ 160.0, 60.0 ],
							[ 174.0, 73.6 ], [ 162.6, 61.4 ], [ 174.0, 55.5 ],
							[ 162.6, 63.6 ], [ 161.3, 60.9 ], [ 156.2, 60.0 ],
							[ 149.9, 46.8 ], [ 169.5, 57.3 ], [ 160.0, 64.1 ],
							[ 175.3, 63.6 ], [ 169.5, 67.3 ], [ 160.0, 75.5 ],
							[ 172.7, 68.2 ], [ 162.6, 61.4 ], [ 157.5, 76.8 ],
							[ 176.5, 71.8 ], [ 164.4, 55.5 ], [ 160.7, 48.6 ],
							[ 174.0, 66.4 ], [ 163.8, 67.3 ] ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '体重最大值',
							symbol:'pin',
							symbolSize:'60'
						}, {
							type : 'min',
							name : '体重最小值',
							symbol:'pin',
							symbolSize:'40'
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '体重平均值'
						}, {
							type : 'average',
							//valueDim:'x',
							valueIndex:0,
							name : '身高平均值',
							label:{
								normal:{
									formatter:"{c}cm"
								}
							}
						} ]
					}
				},
				{
					name : '男性',
					type : 'scatter',
					data : [ [ 174.0, 65.6 ], [ 175.3, 71.8 ], [ 193.5, 80.7 ],
							[ 186.5, 72.6 ], [ 187.2, 78.8 ], [ 181.5, 74.8 ],
							[ 184.0, 86.4 ], [ 184.5, 78.4 ], [ 175.0, 62.0 ],
							[ 184.0, 81.6 ], [ 180.0, 76.6 ], [ 177.8, 83.6 ],
							[ 192.0, 90.0 ], [ 176.0, 74.6 ], [ 174.0, 71.0 ],
							[ 184.0, 79.6 ], [ 192.7, 93.8 ], [ 171.5, 70.0 ],
							[ 173.0, 72.4 ], [ 176.0, 85.9 ], [ 176.0, 78.8 ],
							[ 180.5, 77.8 ], [ 172.7, 66.2 ], [ 176.0, 86.4 ],
							[ 173.5, 81.8 ], [ 178.0, 89.6 ], [ 180.3, 82.8 ],
							[ 180.3, 76.4 ], [ 164.5, 63.2 ], [ 173.0, 60.9 ],
							[ 183.5, 74.8 ], [ 175.5, 70.0 ], [ 188.0, 72.4 ],
							[ 189.2, 84.1 ], [ 172.8, 69.1 ], [ 170.0, 59.5 ],
							[ 182.0, 67.2 ], [ 170.0, 61.3 ], [ 177.8, 68.6 ],
							[ 184.2, 80.1 ], [ 186.7, 87.8 ], [ 171.4, 84.7 ],
							[ 172.7, 73.4 ], [ 175.3, 72.1 ], [ 180.3, 82.6 ],
							[ 182.9, 88.7 ], [ 188.0, 84.1 ], [ 177.2, 94.1 ],
							[ 172.1, 74.9 ], [ 167.0, 59.1 ], [ 169.5, 75.6 ],
							[ 174.0, 86.2 ], [ 172.7, 75.3 ], [ 182.2, 87.1 ],
							[ 164.1, 55.2 ], [ 163.0, 57.0 ], [ 171.5, 61.4 ],
							[ 184.2, 76.8 ], [ 174.0, 86.8 ], [ 174.0, 72.2 ],
							[ 177.0, 71.6 ], [ 186.0, 84.8 ], [ 167.0, 68.2 ],
							[ 171.8, 66.1 ], [ 182.0, 72.0 ], [ 167.0, 64.6 ],
							[ 177.8, 74.8 ], [ 164.5, 70.0 ], [ 192.0, 101.6 ],
							[ 175.5, 63.2 ], [ 171.2, 79.1 ], [ 181.6, 78.9 ],
							[ 167.4, 67.7 ], [ 181.1, 66.0 ], [ 177.0, 68.2 ],
							[ 174.5, 63.9 ], [ 177.5, 72.0 ], [ 170.5, 56.8 ],
							[ 182.4, 74.5 ], [ 197.1, 90.9 ], [ 180.1, 93.0 ],
							[ 175.5, 80.9 ], [ 180.6, 72.7 ], [ 184.4, 68.0 ],
							[ 175.5, 70.9 ], [ 180.6, 72.5 ], [ 177.0, 72.5 ],
							[ 177.1, 83.4 ], [ 181.6, 75.5 ], [ 176.5, 73.0 ],
							[ 175.0, 70.2 ], [ 174.0, 73.4 ], [ 165.1, 70.5 ],
							[ 177.0, 68.9 ], [ 192.0, 102.3 ], [ 176.5, 68.4 ],
							[ 169.4, 65.9 ], [ 182.1, 75.7 ], [ 179.8, 84.5 ],
							[ 175.3, 87.7 ], [ 184.9, 86.4 ], [ 177.3, 73.2 ],
							[ 167.4, 53.9 ], [ 178.1, 72.0 ], [ 168.9, 55.5 ],
							[ 157.2, 58.4 ], [ 180.3, 83.2 ], [ 170.2, 72.7 ],
							[ 177.8, 64.1 ], [ 172.7, 72.3 ], [ 165.1, 65.0 ],
							[ 186.7, 86.4 ], [ 165.1, 65.0 ], [ 174.0, 88.6 ],
							[ 175.3, 84.1 ], [ 185.4, 66.8 ], [ 177.8, 75.5 ],
							[ 180.3, 93.2 ], [ 180.3, 82.7 ], [ 177.8, 58.0 ],
							[ 177.8, 79.5 ], [ 177.8, 78.6 ], [ 177.8, 71.8 ],
							[ 177.8, 116.4 ], [ 163.8, 72.2 ], [ 188.0, 83.6 ],
							[ 198.1, 85.5 ], [ 175.3, 90.9 ], [ 166.4, 85.9 ],
							[ 190.5, 89.1 ], [ 166.4, 75.0 ], [ 177.8, 77.7 ],
							[ 179.7, 86.4 ], [ 172.7, 90.9 ], [ 190.5, 73.6 ],
							[ 185.4, 76.4 ], [ 168.9, 69.1 ], [ 167.6, 84.5 ],
							[ 175.3, 64.5 ], [ 170.2, 69.1 ], [ 190.5, 108.6 ],
							[ 177.8, 86.4 ], [ 190.5, 80.9 ], [ 177.8, 87.7 ],
							[ 184.2, 94.5 ], [ 176.5, 80.2 ], [ 177.8, 72.0 ],
							[ 180.3, 71.4 ], [ 171.4, 72.7 ], [ 172.7, 84.1 ],
							[ 172.7, 76.8 ], [ 177.8, 63.6 ], [ 177.8, 80.9 ],
							[ 182.9, 80.9 ], [ 170.2, 85.5 ], [ 167.6, 68.6 ],
							[ 175.3, 67.7 ], [ 165.1, 66.4 ], [ 185.4, 102.3 ],
							[ 181.6, 70.5 ], [ 172.7, 95.9 ], [ 190.5, 84.1 ],
							[ 179.1, 87.3 ], [ 175.3, 71.8 ], [ 170.2, 65.9 ],
							[ 193.0, 95.9 ], [ 171.4, 91.4 ], [ 177.8, 81.8 ],
							[ 177.8, 96.8 ], [ 167.6, 69.1 ], [ 167.6, 82.7 ],
							[ 180.3, 75.5 ], [ 182.9, 79.5 ], [ 176.5, 73.6 ],
							[ 186.7, 91.8 ], [ 188.0, 84.1 ], [ 188.0, 85.9 ],
							[ 177.8, 81.8 ], [ 174.0, 82.5 ], [ 177.8, 80.5 ],
							[ 171.4, 70.0 ], [ 185.4, 81.8 ], [ 185.4, 84.1 ],
							[ 188.0, 90.5 ], [ 188.0, 91.4 ], [ 182.9, 89.1 ],
							[ 176.5, 85.0 ], [ 175.3, 69.1 ], [ 175.3, 73.6 ],
							[ 188.0, 80.5 ], [ 188.0, 82.7 ], [ 175.3, 86.4 ],
							[ 170.5, 67.7 ], [ 179.1, 92.7 ], [ 177.8, 93.6 ],
							[ 175.3, 70.9 ], [ 182.9, 75.0 ], [ 170.8, 93.2 ],
							[ 188.0, 93.2 ], [ 180.3, 77.7 ], [ 177.8, 61.4 ],
							[ 185.4, 94.1 ], [ 168.9, 75.0 ], [ 185.4, 83.6 ],
							[ 180.3, 85.5 ], [ 174.0, 73.9 ], [ 167.6, 66.8 ],
							[ 182.9, 87.3 ], [ 160.0, 72.3 ], [ 180.3, 88.6 ],
							[ 167.6, 75.5 ], [ 186.7, 101.4 ], [ 175.3, 91.1 ],
							[ 175.3, 67.3 ], [ 175.9, 77.7 ], [ 175.3, 81.8 ],
							[ 179.1, 75.5 ], [ 181.6, 84.5 ], [ 177.8, 76.6 ],
							[ 182.9, 85.0 ], [ 177.8, 102.5 ], [ 184.2, 77.3 ],
							[ 179.1, 71.8 ], [ 176.5, 87.9 ], [ 188.0, 94.3 ],
							[ 174.0, 70.9 ], [ 167.6, 64.5 ], [ 170.2, 77.3 ],
							[ 167.6, 72.3 ], [ 188.0, 87.3 ], [ 174.0, 80.0 ],
							[ 176.5, 82.3 ], [ 180.3, 73.6 ], [ 167.6, 74.1 ],
							[ 188.0, 85.9 ], [ 180.3, 73.2 ], [ 167.6, 76.3 ],
							[ 183.0, 65.9 ], [ 183.0, 90.9 ], [ 179.1, 89.1 ],
							[ 170.2, 62.3 ], [ 177.8, 82.7 ], [ 179.1, 79.1 ],
							[ 190.5, 98.2 ], [ 177.8, 84.1 ], [ 180.3, 83.2 ],
							[ 180.3, 83.2 ] ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						}, {
							xAxis : 170
						} ]
					}
				} ]
	};

	//使用刚指定的配置项和数据显示图表
	myChart.setOption(option);
	myChart.on('click', function (params) {
		console.log(params);
	});
</script>
</html>