<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新订单</title>
<link rel="stylesheet" href="/css/sm.min.css">
<link rel="stylesheet" href="/css/sm-extend.min.css">
<link rel="stylesheet" href="/css/demos.css">

<script type='text/javascript' src='/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/js/config.js' charset='utf-8'></script>


<!-- <script type='text/javascript' src='/js/jquery-3.1.1.min.js' charset='utf-8'></script> -->
<script type='text/javascript' src='/js/vue.js' charset='utf-8'></script>
</head>
<body>
	<header class="bar bar-nav">
		<h1 class="title">视图列表</h1>
	</header>
 <div class="bar bar-standard bar-footer">
    <a class="icon icon-home pull-right open-panel" data-panel=".panel-right"></a>
  </div>

	<div class="page-group">
		<div id="page-infinite-scroll-bottom" class="page">
			<header class="bar bar-nav">

				<h1 class="title">已完成订单</h1>
			</header>
			<div id="list" class="content infinite-scroll infinite-scroll-bottom"
				data-distance="100">
				<div v-for="order in orders">
					<div class="content-block-title">{{order.createTime}}</div>
					<div class="list-block">
						<ul>
							<li class="item-content item-link">
								<div class="item-media">
									<i class="icon icon-f7"></i>
								</div>
								<div class="item-inner" onclick="">
									<div class="item-title">订单号</div>
									<div class="item-after">{{order.NO}}</div>
								</div>
							</li>
							<li class="item-content item-link">
								<div class="item-media">
									<i class="icon icon-f7"></i>
								</div>
								<div class="item-inner">
									<div class="item-title">产品</div>
									<div class="item-after">{{order.itemName}}</div>
								</div>
							</li>
							<li class="item-content item-link">
								<div class="item-media">
									<i class="icon icon-f7"></i>
								</div>
								<div class="item-inner">
									<div class="item-title">数量</div>
									<div class="item-after">{{order.quantity}}</div>
								</div>
							</li>
							<li class="item-content item-link">
								<div class="item-media">
									<i class="icon icon-f7"></i>
								</div>
								<div class="item-inner">
									<div class="item-title">金额</div>
									<div class="item-after">{{order.cost}}</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="infinite-scroll-preloader">
					<div class="preloader"></div>
				</div>
			</div>
		</div>

	</div>
	<script type='text/javascript' src='/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='/js/sm-extend.min.js'
		charset='utf-8'></script>
	<script type='text/javascript' src='/js/sm-city-picker.min.js'
		charset='utf-8'></script>
	<script type='text/javascript' src='/js/demos.js' charset='utf-8'></script>

	<script type="text/javascript">
		var loading = false;
		var maxItems = 100;
		var pageIndex = 1;
		var pageSize = 1;
		var v_list;
		v_list = new Vue({
			el : '#list',
			data : {
				orders : []
			}
		});
		flushData();
		function flushData() {
			$.ajax({
				url : '/order/server/finished',
				dataType : 'json',
				type : 'get',
				data : {
					pageIndex : pageIndex,
					pageSize : pageSize
				},
				async : false,
				success : function(data) {
					if (!data.data || data.data.length == 0)
						return;
					var orderList = data.data, newOrders = [];
					for ( var i in orderList) {
						var orderMap = orderList[i];
						var order = {
							'NO' : orderMap.NO,
							'cost' : orderMap.cost,
							'quantity' : orderMap.quantity,
							'itemName' : orderMap.itemName
						}
						v_list.orders.push(order);
						//newOrders[i] = order;
					}
					pageIndex++;
				}
			});
		}
		$(document).on('infinite', '.infinite-scroll-bottom', function() {
			// 如果正在加载，则退出
			if (loading)
				return;
			//flushData();

			// 设置flag
			loading = true;

			// 模拟1s的加载过程
			setTimeout(function() {
				// 重置加载flag
				loading = false;
				if (pageIndex >= maxItems) {

					// 加载完毕，则注销无限加载事件，以防不必要的加载
					$.detachInfiniteScroll($('.infinite-scroll'));
					// 删除加载提示符
					$('.infinite-scroll-preloader').remove();
					return;
				}
				flushData();
				// 添加新条目
				//addItems(itemsPerLoad, lastIndex);
				// 更新最后加载的序号
				//lastIndex = $('.list-container li').length;
				//容器发生改变,如果是js滚动，需要刷新滚动
				$.refreshScroller();
			}, 1000);
			return false;
		})
	</script>
</body>
</html>