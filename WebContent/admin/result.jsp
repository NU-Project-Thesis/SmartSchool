<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monthly Result</title>

<!-- include script -->
<%@ include file="include/head.jsp"%>

<style>
.spinner {
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -50px; /* half width of the spinner gif */
	margin-top: -50px; /* half height of the spinner gif */
	text-align: center;
	z-index: 1234;
	overflow: auto;
	width: 140px; /* width of the spinner gif */
	height: 102px; /*hight of the spinner gif +2px to fix IE8 issue */
}
</style>
<style>
.avatar-frame, .avatar-frame img {
	width: 60px !important;
	height: 45px !important;
	-webkit-border-radius: 100% !important; /* Saf3+, Chrome */
	-moz-border-radius: 100%; /* for firefox */
	border-radius: 100% !important; /* Opera 10.5, IE 9 */
}

iframe {
	/* border: none; */
	width: 100% !important;
	height: 500px !important;
}

.form-group {
	margin-bottom: 10px !important;
}
</style>

</head>
<body class="skin-green-light sidebar-mini fixed">
	<div id="spinner" class="spinner" style="display: none">
		<img id="img-spinner" src="image/ajax-loader.gif" alt="Loading" />
	</div>

	<div class="wrapper">

		<!-- header -->
		<%@ include file="include/header.jsp"%>

		<!-- left-side -->
		<%@ include file="include/left_side.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="padding-top: 50px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Monthly <small>Result</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Monthly Result</li>
				</ol>
			</section>

			<!-- content body -->
			<section class="content">
				<div class="row">
					<section class="col-lg-12 connectedSortable ui-sortable"
						ng-app="docApp" ng-controller="docCtrl">
						<!-- staff -->
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<i class="fa fa-book"></i>
								<h3 class="box-title">Monthly Result</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<br> <br>

								<form class="form-inline" role="form">
									<!-- generation -->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Generation</span>
											</div>
											<select class="form-control" id="genFilter"
												ng-change="showCourse=true" ng-model="genFilter">
												<option ng-repeat="g in gen" value="{{g.gen_id}}">{{g.gen_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- course -->
									<div class="form-group" ng-show="showCourse">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Course</span>
											</div>
											<select class="form-control" id="courseFilter"
												ng-change="showClass=true" ng-model="courseFilter">
												<option
													ng-repeat="c in filtered = (course | filter:{gen_id:genFilter} | orderBy:cou_name)"
													value="{{c.cou_id}}">{{c.cou_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>

									<!-- class -->
									<div class="form-group" ng-show="showClass">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Class</span>
											</div>
											<select class="form-control" id="classFilter" ng-change="showDate=true"
												ng-model="classFilter">
												<option value="0">All Class</option>
												<option
													ng-repeat="c in filtered = (class_ | filter:{cou_id:courseFilter} | orderBy:class_name)"
													value="{{c.class_id}}">{{c.class_name}}</option>
											</select>
										</div>
										<!-- /.input group -->
									</div>
									<!-- date -->
									<div class="form-group" ng-show="showDate" name="mydiv">
										<div class="input-group">
											<div class="input-group-addon">
												<span>Date</span>
											</div>
											<input type="text" class="form-control" name="date_"
											ng-model="selectDate"	id="date_" placeholder="Select date" ng-required="true">
											<div class="input-group-btn">
												<button type="button" ng-disabled="!selectDate.length" class="btn btn-warning"
													id="btn-preview">Preview</button>
												<button type="button" class="btn btn-success"
													id="btn-export">Export</button>
											</div>
										</div>
									</div>
								</form>

								<!-- end form search -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<iframe id="box-preview"> </iframe>
								</div>
							</div>
						</div>
						<!-- end staff list -->

					</section>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		<%@ include file="include/footer.jsp"%>


	</div>
	<!-- ./wrapper -->

	<!-- import script -->
	<%@ include file="include/script.jsp"%>
	<script type="text/javascript" src="js/angular/result.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$("#date_").datepicker();

					$("#box-preview").hide();

					$('#btn-preview').on('click', function() {
								
								$("#box-preview").show();
								var url = "";
								if($('#classFilter').val()!=0){
									url = "ReportResultMonByClass.pdf?score_date=" + $('#date_').val()+"&class_id="+$('#classFilter').val();
								}else{
									url = "MontlyResult.pdf?score_date=" + $('#date_').val();
								}
								
								$("#box-preview").attr("src", url);
					});
					
					// export to excel
					$('#btn-export').on('click', function() {
						
						var url = "";
						if($('#classFilter').val()!=0){
							url = "ReportResultMonByClass.pdf?score_date=" + $('#date_').val()+"&class_id="+$('#classFilter').val();
						}else{
							url = "excelMonthlyResult.hrd?score_date=" + $('#date_').val();
						}
						
						location.href=url;
			});

				});
	</script>
</body>
</html>