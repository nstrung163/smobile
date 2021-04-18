<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">Core</div>
			<a class="nav-link" href="/admin/home">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div> Dashboard
			</a>
			<div class="sb-sidenav-menu-heading">Control</div>
			<a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapseLayouts" aria-expanded="false"
				aria-controls="collapseLayouts">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Table
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseLayouts"
				aria-labelledby="headingOne" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="/admin/account/list">Account</a> <a
						class="nav-link" href="/admin/brand/list">Brand</a> <a
						class="nav-link" href="/admin/category/list">Category</a> <a
						class="nav-link" href="/admin/product/list">Product</a>
					<!-- <a class="nav-link" href="/admin/payment/list">Payment Method</a> -->


				</nav>
			</div>
			<a class="nav-link" href="/admin/order/list">
				<div class="sb-nav-link-icon">
					<i class="fas fa-table"></i>
				</div> Control Order
			</a> <a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapsePages" aria-expanded="false"
				aria-controls="collapsePages">
				<div class="sb-nav-link-icon">
					<i class="fas fa-user fa-fw"></i>
				</div> My Account
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
				data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="/admin/my-account">Profile</a> <a
						class="nav-link" href="/admin/activity-log">Activity Log</a> <a
						class="nav-link" href="/admin/logout">Logout</a>
				</nav>
			</div>
			<div class="sb-sidenav-menu-heading">Adons</div>
			<a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapseStatistic" aria-expanded="false"
				aria-controls="collapseStatistic">
				<div class="sb-nav-link-icon">
					<i class="fas fa-chart-line"></i>
				</div> Statistics
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseStatistic"
				aria-labelledby="headingOne" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="/admin/statistic/product">Product</a> <a
						class="nav-link" href="/admin/statistic/order">Order</a> 
				</nav>
			</div>
		</div>
	</div>
	<div class="sb-sidenav-footer">
		<div class="small">Logged in as:</div>
		<sec:authentication var="user" property="principal" />
		<!-- Header Navbar User -->
		<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
			${user.username}
		</sec:authorize>
	</div>
</nav>