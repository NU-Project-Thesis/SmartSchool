<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Monthly Result</title>
<%@include file="include/head.jsp"%>
<style>
.input-group .form-control {
	position: relative;
	z-index: 2;
	float: left;
	width: 100%;
	margin-bottom: 0;
	font-size: 16px;
}

.input-group .input-group-addon {
	background: #fff;
}

.input-group-addon:first-child {
	border-right: 0;
}

@media only screen and (min-width: 600px) {
	.col-m-2 {
		float: left;
	}
}

iframe {
	/* border: none; */
	width: 100% !important;
	height: 500px !important;
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
					<li class="active">Monthly Result</li>
				</ol>
			</section>

			<section class="content" ng-repeat="data in list">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable">
						<div class="box box-info">
							
							<div class="box-header">
								<i class="fa fa-book"></i>
								<h3 class="box-title">Result</h3>
								
								<br> <br>
								<form class="form-inline" role="form">
									<!-- date -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Date</span>
											</div>
											<input type="text" class="form-control" name="date_"
												id="date_" placeholder="Select date">
											<div class="input-group-btn">
												<button type="button" class="btn btn-warning"
													id="btn-preview">Preview</button>

											</div>
										</div>
									</div>
								</form>
							</div>
							
							<div class="box-body">
								<div class="table-responsive">
									<iframe id="box-preview"> </iframe>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
		</div>

	</div>
	<!-- /.content-wrapper -->
	<!-- footer -->
	<%@include file="include/footer.jsp"%>

	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed -->
	<div class="control-sidebar-bg"></div>

	<!-- ./wrapper -->
	<%@include file="include/script.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {

			$("#date_").datepicker();

			$("#box-preview").hide();

			$('#btn-preview').on('click', function() {
				$("#box-preview").show();
				$("#box-preview").attr("src",
						"ReportResultMontly.pdf?score_date=" + $('#date_').val());
			});

		});

	</script>
</body>
</html>