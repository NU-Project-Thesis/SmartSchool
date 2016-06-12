<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>HRD | Management</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@include file="include/head.jsp"%>
<style>
.full {
	max-width: 100%;
	max-height: 100%;
	bottom: 0;
	left: 0;
	margin: auto;
	overflow: auto;
	position: fixed;
	right: 0;
	top: 0;
}
</style>

</head>
<body class="skin-green-light sidebar-mini fixed">
	<div class="wrapper">

		<%@include file="include/header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="include/left_side.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Dashboard</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>
			<br><br>
			<div class="container-fluid">
				<div class="well">
					<div class="container-fluid">
						<img src="dist/img/homehrd.png" width="100%" alt="Cinque Terre">
					</div>

				</div>
			</div>





			<!-- Content Header (Page header) -->
			<section class="content-header"></section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@include file="include/footer.jsp"%>


		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->

	<%@include file="include/script.jsp"%>
</body>
</html>
