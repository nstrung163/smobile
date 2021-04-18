<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><a href="/admin/home">Dashboard</a></li>
	<li class="breadcrumb-item"><a href="/admin/statistic/order">Order
			Statistic</a></li>
</ol>

<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-filter"></i> Bộ lọc
	</div>
	<div class="card-body">
		<form action="/admin/statistic/order" method="get">
			<div class="form-group">
				<div class="row">
					<div class="col-md-3  col-sm-4">
						<select name="year" id="month" class="form-control">
							<option value="2021">2021</option>
							<option value="2020">2020</option>
							<option value="2019">2019</option>
						</select>
					</div>
					<div class="col-md-3  col-sm-4">
						<button type="submit" class="btn btn-dark">Thống Kê</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-chart-line"></i> ${titleOrder}
	</div>
	<div class="card-body">
		<div class="card-body">
			<canvas id="orderStatistic" width="100%" height="30"></canvas>
		</div>
	</div>
</div>


<div class="card mb-4 mt-3">
	<div class="card-header">
		<i class="fas fa-chart-line"></i> ${titleRevenue}
	</div>
	<div class="card-body">
		<div class="card-body">
			<canvas id="revenueStatistic" width="100%" height="30"></canvas>
		</div>
		
	</div>
</div>

<button type="button" class="btn btn-dark float-right"
			onclick="window.location.href='/admin/home'">Back</button>
	

<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/template/admin/dist/js/scripts.js'/>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<%-- <script src="<c:url value='/template/admin/js/order-statistic.js'/>"></script>
 --%>
<script type="text/javascript">
	//Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';

	// Area Chart Example
	var orderStatistic = document.getElementById("orderStatistic");
	var revenueStatistic = document.getElementById("revenueStatistic");
	var orderLineChart = new Chart(orderStatistic, {
		type : 'line',
		data : {
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10",
					"Tháng 11", "Tháng 12" ],
			datasets : [ {
				label : "Số lượng đơn hàng",
				lineTension : 0.3,
				backgroundColor : "rgba(2,117,216,0.2)",
				borderColor : "rgba(2,117,216,1)",
				pointRadius : 5,
				pointBackgroundColor : "rgba(2,117,216,1)",
				pointBorderColor : "rgba(255,255,255,0.8)",
				pointHoverRadius : 5,
				pointHoverBackgroundColor : "rgba(2,117,216,1)",
				pointHitRadius : 50,
				pointBorderWidth : 2,
				data : ${listOrderStatistic},
			} ],
		},
		options : {
			scales : {
				xAxes : [ {
					time : {
						unit : 'date'
					},
					gridLines : {
						display : false
					},
					ticks : {
						maxTicksLimit : 12
					}
				} ],
				yAxes : [ {
					ticks : {
						min : 0,
						max : ${maxQuantityOfOrderValue},
						maxTicksLimit : 10
					},
					gridLines : {
						color : "rgba(0, 0, 0, .125)",
					}
				} ],
			},
			legend : {
				display : false
			}
		}
	});
	
	var revenueLineChart = new Chart(revenueStatistic, {
		type : 'line',
		data : {
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10",
					"Tháng 11", "Tháng 12" ],
			datasets : [ {
				label : "Số lượng đơn hàng",
				lineTension : 0.3,
				backgroundColor : "rgba(2,117,216,0.2)",
				borderColor : "rgba(2,117,216,1)",
				pointRadius : 5,
				pointBackgroundColor : "rgba(2,117,216,1)",
				pointBorderColor : "rgba(255,255,255,0.8)",
				pointHoverRadius : 5,
				pointHoverBackgroundColor : "rgba(2,117,216,1)",
				pointHitRadius : 50,
				pointBorderWidth : 2,
				data : ${listRevenueStatistic},
			} ],
		},
		options : {
			scales : {
				xAxes : [ {
					time : {
						unit : 'date'
					},
					gridLines : {
						display : false
					},
					ticks : {
						maxTicksLimit : 12
					}
				} ],
				yAxes : [ {
					ticks : {
						min : 0,
						max : ${maxRevenueValue},
						maxTicksLimit : 10
					},
					gridLines : {
						color : "rgba(0, 0, 0, .125)",
					}
				} ],
			},
			legend : {
				display : false
			}
		}
	});
</script>